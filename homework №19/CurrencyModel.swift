//
//  CurrencyModel.swift
//  homework №19
//
//  Created by Shirayo on 19.03.2020.
//  Copyright © 2020 Shirayo. All rights reserved.
//

import Foundation


struct CurrencyModel: Codable {
    let date: String
    let base: String
    var rates: RateCurrencyModel
}

struct  RateCurrencyModel: Codable {
    var USD: Double
    var BYN: Double
    var RUB: Double
    
}
