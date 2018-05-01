//
//  Link+Vapor.swift
//  App
//
//  Created by David Muzi on 2018-04-23.
//

import FluentSQLite
import Vapor

extension Link: SQLiteModel, Parameter, Content, Migration, SQLiteFieldTypeStaticRepresentable {
	
	static var sqliteFieldType: SQLiteFieldType {
		return .integer
	}
}

extension Visit: SQLiteModel, Parameter, Content, Migration {}
