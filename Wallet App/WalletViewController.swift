//
//  WalletViewController.swift
//  Wallet App
//
//  Created by N on 2017-03-21.
//  Copyright © 2017 agaba. All rights reserved.
//

import UIKit
import Alamofire

class WalletViewController: UITableViewController {
	
	var accounts: [Account] = [Account]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let cellNib = UINib(nibName: "AccountCell", bundle: nil)
		tableView.register(cellNib, forCellReuseIdentifier: "AccountCell")
		
		tableView.separatorStyle = .none
		tableView.rowHeight = 200
		
		downloadData()
	}
	
	
	// MARK: - TableView Data Source
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath) as! AccountCell
		
		cell.contentView.layer.cornerRadius = 10
		cell.contentView.layer.masksToBounds = true
		
		let account = accounts[indexPath.row]
		cell.configure(with: account)
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return accounts.count
	}
	
	func downloadData(){
		let url = "https://gist.githubusercontent.com/Shanjeef/3562ebc5ea794a945f723de71de1c3ed/raw/25da03b403ffa860dd68a9bfc84f562262ee5ca5/walletEndpoint"
		
		Alamofire.request(url).responseJSON { response in
			guard response.result.isSuccess else {
				print("Error while fetching data \(response.result.error)")
				return
			}
			
			guard let responseJSON = response.result.value as? [String: Any],
			let info = responseJSON["info"] as? [String: Any],
			let cards = info["cards"] as? [[String: Any]]
			else {
				print("Invalid data received")
				return
			}
			
			for card in cards {
				if let account = Account(from: card) {
					self.accounts.append(account)
				}
			}
			
			self.tableView.reloadData()
		}
		
	}
	
	
}
