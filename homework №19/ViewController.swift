//
//  ViewController.swift
//  homework №19
//
//  Created by Shirayo on 19.03.2020.
//  Copyright © 2020 Shirayo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lastUpdateLabel: UILabel!
    @IBOutlet weak var usdCurrencyLabel: UILabel!
    @IBOutlet weak var bynCurrencyLabel: UILabel!
    @IBOutlet weak var rubCurrencyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showCurrency()
    }
    
    
    func showCurrency() {
        NetworkManager.shared.loadCurrency(completion: {CurrencyModel in
             DispatchQueue.main.async {
                self.lastUpdateLabel.text = "last update: \(CurrencyModel!.date)"
                self.usdCurrencyLabel.text = String(CurrencyModel!.rates.USD)
                self.bynCurrencyLabel.text = String(CurrencyModel!.rates.BYN)
                self.rubCurrencyLabel.text = String(CurrencyModel!.rates.RUB)
            }
        })
    }
    
    
    @IBAction func updateButtonDidClick(_ sender: Any) {
        showCurrency()
    }
    
}
