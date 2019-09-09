//
//  ViewController.swift
//  CryptoCurrency
//
//  Created by Aakash Shah on 30/08/19.
//  Copyright © 2019 Aakash Shah. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    private let uRL_STRING = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest"
    private let aPI_KEY = "9b9f71f5-20e3-4279-ac13-0c6522a4c9e1"
    private let hEADER_FIELD = "X-CMC_PRO_API_KEY"
    
    private var cryptoData: CryptoCurrencyData?
       

    override func viewDidLoad() {
        navigationItem.title = "Cryptocurrency App"
        downloadingData()
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoData?.data.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MyCustomeCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyCustomeCell
        return setCellData(ofCell: cell, at: indexPath.row)
    }


    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func setCellData(ofCell cell: MyCustomeCell, at indexPath: Int) -> MyCustomeCell {
        guard let currentData = cryptoData?.data[indexPath] else {return cell}
        let cryptoDetails = currentData.quote.USD
        cell.currencyName.text = "\(currentData.symbol) | \(currentData.name)"
        cell.currencyPrice.text = "\(String(format: "%.3f", cryptoDetails.price))$"
        cell.currency24h.text = String(format: "%.2f", cryptoDetails.percent_change_24h)
        cell.currency24h.textColor = setColor(with: cell.currency24h.text?.contains("-") ?? false)
        cell.currency7d.text = String(format: "%.2f", cryptoDetails.percent_change_7d)
        cell.currency7d.textColor = setColor(with: cell.currency7d.text?.contains("-") ?? false)
        return cell
    }
    
    func setColor(with: Bool) -> UIColor {
        return with ? UIColor.orange : UIColor.cyan
    }
    
    func downloadingData(){
        if let url = URL(string: uRL_STRING) {
            var request = URLRequest(url: url)
            request.addValue(aPI_KEY, forHTTPHeaderField: hEADER_FIELD)
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
                cryptoData = jsonData
                tableView.reloadData()
                print("Success")
            } catch {
                print(error)
            }
        }
    }
    
    
}

