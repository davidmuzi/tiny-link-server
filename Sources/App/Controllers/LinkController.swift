//
//  LinkController.swift
//  App
//
//  Created by David Muzi on 2018-04-23.
//

import Vapor

final class LinkController {
	
	func index(_ req: Request) throws -> Future<[Link]> {
		return Link.query(on: req).all()
	}
	
	func create(_ req: Request) throws -> Future<Link> {
		return try req.content.decode(Link.self).flatMap(to: Link.self) { todo in
			
			var link = todo
			link.slug = "String.random()"
			
			return link.save(on: req)
		}
	}
}

extension LinkController: RouteCollection {
	
	func boot(router: Router) throws {
		let route = router.grouped("links")
		route.get(use: index)
		route.post(use: create)
	}
}
