//
//  Link.swift
//  App
//
//  Created by David Muzi on 2018-04-23.
//

import Foundation

struct Link: Codable {
	var id: Int?
	var slug: String?
	let originalURL: URL
	let shortURL: URL
}
