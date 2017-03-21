//
//  AccountCell.swift
//  Wallet App
//
//  Created by N on 2017-03-21.
//  Copyright © 2017 agaba. All rights reserved.
//

import UIKit

class AccountCell: UITableViewCell {
	@IBOutlet weak var accountNameLabel: UILabel!
	@IBOutlet weak var accountBalanceLabel: UILabel!
	@IBOutlet weak var policyTermLabel: UILabel!
	
	func configure(with account: Account) {
		
		accountNameLabel.text = account.type.rawValue.uppercased()
		
		let amount = String(format: "%.0f", account.amount)
		
		accountBalanceLabel.text = "$ \(amount)"
		policyTermLabel.text = "Effective: \(account.policyStartDate) - \(account.policyEndDate)"
	}
	
}
