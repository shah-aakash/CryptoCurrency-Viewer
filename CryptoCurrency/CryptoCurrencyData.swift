//
//  CryptoData.swift
//  CryptoCurrency
//
//  Created by Aakash Shah on 30/08/19.
//  Copyright © 2019 Aakash Shah. All rights reserved.
//

import Foundation



struct CryptoCurrencyData: Decodable {
    let data: [CryptoDetails]
}

struct CryptoDetails: Decodable {
    let id: Int
    let name: String
    let symbol: String
    let quote: Quote
}

struct  Quote: Decodable {
    let USD: USD
}

struct USD: Decodable {
    let price: Double
    let percent_change_24h: Double
    let percent_change_7d: Double

}


