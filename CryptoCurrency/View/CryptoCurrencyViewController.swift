//
//  ViewController.swift
//  CryptoCurrency
//
//  Created by Aakash Shah on 30/08/19.
//  Copyright © 2019 Aakash Shah. All rights reserved.
//

import UIKit

class CryptoCurrencyViewController: UITableViewController {
    
    var cryptoViewModel = CryptoCurrencyViewModel() 

    override func viewDidLoad() {
        navigationItem.title = "Cryptocurrency App"
        super.viewDidLoad()
        cryptoViewModel.fetchingCryptoData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoViewModel.numberOfRow()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       return cryptoViewModel.cellForRowAt(tableView: tableView, indexPath: indexPath)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}

