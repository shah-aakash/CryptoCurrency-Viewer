//
//  MyCustomeCell.swift
//  CryptoCurrency
//
//  Created by Aakash Shah on 09/09/19.
//  Copyright © 2019 Aakash Shah. All rights reserved.
//

import UIKit


class CryptoCurrencyCell: UITableViewCell {
    
    @IBOutlet weak var currencyName: UILabel!
    @IBOutlet weak var currencyPrice: UILabel!
    @IBOutlet weak var currency7d: UILabel!
    @IBOutlet weak var currency24h: UILabel!
    
    
// This is also working 
//    var cryptoDetail: CryptoDetails! {
//        didSet {
//            let USD = cryptoDetail.quote.USD
//            currencyName.text = cryptoDetail.name
//            currencyPrice.text = String(format: "%.3f", USD.price)
//            currency7d.text = String(format: "%.2f", USD.percent_change_7d)
//            currency24h.text = String(format: "%.2f", USD.percent_change_24h)
//        }
//    }
    
    var model: CryptoCellModel! {
        didSet {
            currencyName.text = model.currencyName
            currencyPrice.text = model.currencyPrice
            currency24h.text = model.currency24h
            currency7d.text = model.currency7d
        }
    }
   
}
