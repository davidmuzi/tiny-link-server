//
//  String+Extensions.swift
//  App
//
//  Created by David Muzi on 2018-04-27.
//

import Foundation

extension String {
	
	static func random(length: Int = 4) -> String {
		let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
		var randomString: String = ""
		
		for _ in 0..<length {
			let randomValue = arc4random_uniform(UInt32(base.count))
			randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
		}
		return randomString
	}
}