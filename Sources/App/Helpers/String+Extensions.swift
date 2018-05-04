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
		let baseCount = UInt32(base.count)
		
		for _ in 0..<length {
			#if os(Linux)
				return random() % (baseCount + 1)
			#else
				let randomValue = arc4random_uniform(baseCount)
			#endif
			
			randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
		}
		return randomString
	}
	
}
