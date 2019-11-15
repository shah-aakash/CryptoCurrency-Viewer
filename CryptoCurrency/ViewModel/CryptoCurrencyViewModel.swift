//
//  CryptoCurrencyViewModel.swift
//  CryptoCurrency
//
//  Created by Aakash Shah on 19/10/19.
//  Copyright © 2019 Aakash Shah. All rights reserved.
//

import Foundation
import UIKit

class CryptoCurrencyViewModel {
    
    private let URL_STRING = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest"
    private let API_KEY = "9b9f71f5-20e3-4279-ac13-0c6522a4c9e1"
    private let HEADER_FIELD = "X-CMC_PRO_API_KEY"
    
    var cryptoCurrencyData: CryptoCurrencyData?
    
    func fetchingCryptoData(){
        if let url = URL(string: URL_STRING) {
            var request = URLRequest(url: url)
            request.addValue(API_KEY, forHTTPHeaderField: HEADER_FIELD)
            let dataTask = URLSession.shared.dataTask(with: request) { (data: Data?, _, _) in
                guard let conformData = data else { return }
                parse(json: conformData)
            }
            dataTask.resume()
    }
        
    func parse(json: Data) {
            do{
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(CryptoCurrencyData.self, from: json)
                cryptoCurrencyData = jsonData
                print("Success")
            } catch {
                print(error)
            }
    }
        
    }
    
    func numberOfRow() -> Int {
        return cryptoCurrencyData?.data.count ?? 0
        
    }
    
    func cellForRowAt(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell: CryptoCurrencyCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CryptoCurrencyCell
        let cryptoDetails: CryptoDetails? = cryptoCurrencyData?.data[indexPath.row]
        cell.model = CryptoCellViewModel(cryptoDetails!)
        return cell
    }
    
}
