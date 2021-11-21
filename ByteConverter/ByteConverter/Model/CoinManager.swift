//
//  CoinManager.swift
//  ByteConverter
//
//  Created by Marlon Junior🦈⚓️ on 15/11/21.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "YOUR_API_KEY_HERE"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func performRequest(with urlString : String){
        if let url = URL(string: urlString){
        let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){
                (data,response,error) in
                if error != nil{
                    
                }
                if let safeData = data
            }
            task.resume()
        }
        
    }
}
