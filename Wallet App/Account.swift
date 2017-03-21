//
//  Account.swift
//  Wallet App
//
//  Created by N on 2017-03-21.
//  Copyright © 2017 agaba. All rights reserved.
//

import Foundation

enum AccountType: String {
	case personalSpending = "Personal Spending Account"
	case healthSpending = "Health Spending Account"
	case personalStore = "Personal Store Credit"
}

func accountType(from string: String) -> AccountType {
	switch string {
	case "personal_spending_account":
		return .personalSpending
	case "health_spending_account":
		return .healthSpending
	default:
		return .personalStore
	}
}
struct Account {
	var id: Int
	var type: AccountType
	var amount: Double
	var currency: String
	var policyStartDate: String
	var policyEndDate: String
	
	init?(from json: [String: Any]) {
		guard let _startDate = json["policy_start_date"] as? String,
			let _endDate = json["policy_end_date"] as? String,
			let _amount = json["amount"] as? Double,
			let _currency = json["currency"] as? String,
			let _id = json["id"] as? Int,
			let _type = json["type"] as? String else {
				print("Some error with parsing JSON")
				return nil
		}
		
		let startDate = dateFormatter.date(from: _startDate)!.stringRepresentation
		let endDate = dateFormatter.date(from: _endDate)!.stringRepresentation
		
		policyStartDate = startDate
		policyEndDate = endDate
		amount = _amount
		currency = _currency
		type = accountType(from: _type)
		id = _id
		
	}
	
}

extension Account: CustomStringConvertible {
	var description: String {
		return " Type: \(type.rawValue) \n Amount: \(amount) \n "
	}
}
