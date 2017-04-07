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
	
	private var downloadManager: AccountDownloadManager!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let cellNib = UINib(nibName: "AccountCell", bundle: nil)
		tableView.register(cellNib, forCellReuseIdentifier: "AccountCell")
		
		tableView.separatorStyle = .none
		tableView.rowHeight = 200
		
		downloadManager = AccountDownloadManager.sharedInstance
		downloadManager.loadAccountsFromCloud { (didReceiveData) in
			if didReceiveData {
				self.tableView.reloadData()
			}
		}
	}
	
	// MARK: - TableView Data Source
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath) as! AccountCell
		
		cell.contentView.layer.cornerRadius = 10
		cell.contentView.layer.masksToBounds = true
		
		let account = downloadManager.accounts[indexPath.row]
		cell.configure(with: account)
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return downloadManager.accounts.count
	}
	
}
