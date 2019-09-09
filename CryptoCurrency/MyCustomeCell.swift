//
//  MyCustomeCell.swift
//  CryptoCurrency
//
//  Created by Aakash Shah on 09/09/19.
//  Copyright © 2019 Aakash Shah. All rights reserved.
//

import UIKit

class MyCustomeCell: UITableViewCell {
    
    @IBOutlet weak var currencyName: UILabel!
    @IBOutlet weak var currencyPrice: UILabel!
    @IBOutlet weak var currency7d: UILabel!
    @IBOutlet weak var currency24h: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
