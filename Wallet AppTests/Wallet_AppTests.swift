//
//  Wallet_AppTests.swift
//  Wallet AppTests
//
//  Created by N on 2017-04-07.
//  Copyright © 2017 agaba. All rights reserved.
//

import XCTest
@testable import Wallet_App

class Wallet_AppTests: XCTestCase {
	
	var downloadManager: AccountDownloadManager!
	var accounts: [Account]!
	
	override func setUp() {
		super.setUp()
		downloadManager = AccountDownloadManager.sharedInstance
		accounts = [Account]()
	}
	
	func testDownloadManager() {
		let expectation = self.expectation(description: "Expected load accounts from cloud to fail")
		
		downloadManager.loadAccountsFromCloud { (didReceiveData) in
			expectation.fulfill()
			XCTAssertTrue(didReceiveData, "No accounts received from cloud")
		}
		
		waitForExpectations(timeout: 3, handler: nil)
	}
	
	func testDownloadAccounts() {
		
		let expectation = self.expectation(description: "Expected download accounts from cloud to fail")
		
		downloadManager.download(success: { (accounts) in
			expectation.fulfill()
			XCTAssert(!accounts.isEmpty, "Accounts Download failed")
		}, failure: { (error) in
			print("Error: \(error)")
		})
		
		waitForExpectations(timeout: 3, handler: nil)
		
	}
	
}

