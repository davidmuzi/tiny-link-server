//
//  Visit.swift
//  App
//
//  Created by David Muzi on 2018-04-24.
//

import Foundation

struct Visit: Codable {
	var id: Int?
	let linkID: ID
	let date: Date
	let userAgent: String
}
