//
//  NetworkManager.swift
//  homework №19
//
//  Created by Shirayo on 19.03.2020.
//  Copyright © 2020 Shirayo. All rights reserved.
//

import Foundation

class NetworkManager {
    
    static var shared = NetworkManager()

    func loadCurrency(completion: @escaping (CurrencyModel?) -> Void) {
        
        let apiAccessKey: String = "80d5ec2578b2a12320b91f23ed4fecff"
        let urlString = "http://data.fixer.io/api/latest?access_key=\(apiAccessKey)"
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200,
                error == nil,
                let data = data else {
                    completion(nil)
                    return
            }
            if let currencyModel = try? JSONDecoder().decode(CurrencyModel.self, from: data) {
                print(currencyModel)
                completion(currencyModel)
            } else {
                completion(nil)
                return
            }
        }
        task.resume()
    }
}
