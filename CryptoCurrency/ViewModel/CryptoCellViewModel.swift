//
//  CryptoCellModel.swift
//  CryptoCurrency
//
//  Created by Aakash Shah on 13/10/19.
//  Copyright © 2019 Aakash Shah. All rights reserved.
//

import Foundation
import  UIKit

class CryptoCellViewModel {
    let currencyName: String
    let currencyPrice : String
    let currency24h: String
    let currency7d: String
    let currency24hTextColor: UIColor!
    let currency7dTextColor: UIColor
    
    init(_ cryptoDetails: CryptoDetails) {
        
        let USD = cryptoDetails.quote.USD
        currencyName = "\(cryptoDetails.symbol) | \(cryptoDetails.name)"
        currencyPrice = "\(String(format: "%.3f", USD.price))$"
        currency24h = String(format: "%.2f", USD.percent_change_24h)
        currency7d = String(format: "%.2f", USD.percent_change_7d)
        currency24hTextColor = setColor(of: currency24h)
        currency7dTextColor = setColor(of: currency7d)
    }
}


func setColor(of text: String) -> UIColor {
    return text.contains("-") ? UIColor.orange : UIColor.magenta
}
