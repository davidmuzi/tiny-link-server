//
//  VisitController.swift
//  App
//
//  Created by David Muzi on 2018-04-24.
//

import Vapor
import FluentSQLite

final class VisitController {
	
	func index(_ req: Request) throws -> Future<[Visit]> {
		return Visit.query(on: req).all()
	}
	
	func redirect(_ req: Request) throws -> Future<Response> {

		let slug = try req.parameters.next(String.self)

		return try Link.query(on: req).filter(\.slug == slug).first().map(to: Response.self) { link in
			guard let link = link, let id = link.id else {
				throw Abort(.notFound, reason: "Could not find link.")
			}
			
			// Store the visit object
			let userAgent = (req.http.headers[.userAgent]).first!
			let visit = Visit(id: nil, linkID: id, date: Date(), userAgent: userAgent)
			_ = visit.create(on: req)
			return req.redirect(to: link.originalURL.absoluteString)
		}
	}
	
	func link(_ req: Request) throws -> Future<Link> {
		let slug = try req.parameters.next(String.self)

		return try Link.query(on: req).filter(\.slug == slug).first().map(to: Link.self) { link in
			guard let link = link else {
				throw Abort(.notFound, reason: "Could not find link.")
			}
			
			return link
		}
	}
}

extension VisitController: RouteCollection {
	func boot(router: Router) throws {
		let route = router.grouped("visits")
		route.get(use: index)
		route.get("link", String.parameter, use: link)
		router.get(String.parameter, use: redirect)
	}
}
