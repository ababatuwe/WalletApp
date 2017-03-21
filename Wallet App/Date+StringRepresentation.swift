//
//  Date+StringRepresentation.swift
//  Wallet App
//
//  Created by N on 2017-03-21.
//  Copyright © 2017 agaba. All rights reserved.
//

import Foundation

extension Date {
	var stringRepresentation: String {
		let calendar = Calendar(identifier: .gregorian)
		
		let day = calendar.component(.day, from: self)
		let monthInt = calendar.component(.month, from: self)
		let year = calendar.component(.year, from: self)
		
		let monthString = dateFormatter.monthSymbols[monthInt - 1]
		
		return "\(day) \(monthString) \(year)"
	}
}
