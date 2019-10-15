//
//  CryptoCellModel.swift
//  CryptoCurrency
//
//  Created by Aakash Shah on 13/10/19.
//  Copyright © 2019 Aakash Shah. All rights reserved.
//

import Foundation

class CryptoCellModel {
    let currencyName: String
    let currencyPrice : String
    let currency24h: String
    let currency7d: String
    
    init(_ cryptoDetails: CryptoDetails) {
        
        let USD = cryptoDetails.quote.USD
        print("Your USD is",USD)
        currencyName = "\(cryptoDetails.symbol) | \(cryptoDetails.name)"
        currencyPrice = "\(String(format: "%.3f", USD.price))$"
        currency24h = String(format: "%.2f", USD.percent_change_24h)
        //self.currency24h.textColor = UIColor(with: self.currency24h.text?.contains("-") ?? false)
        currency7d = String(format: "%.2f", USD.percent_change_7d)
        //self.currency7d.textColor = UIColor(with: self.currency7d.text?.contains("-") ?? false)
    }
    
}
