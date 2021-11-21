//
//  CoinManager.swift
//  ByteConverter
//
//  Created by Marlon Junior🦈⚓️ on 15/11/21.
//

import Foundation

protocol coinManagerDelegate{
    func didUpDateByteCoin(_ CoinManager: CoinManager,coin: CoinModel)
    func didFailError(_ error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "F80EDD28-A49C-4466-BCAE-57E51F918DEE"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    var delegate : coinManagerDelegate?
    
    func getCoinPrice(_ coin: Int){
        let coinQuote = currencyArray[coin]
        let urlString = "\(baseURL)/\(coinQuote)?apikey=\(apiKey)"
        performRequest(with: urlString)
    }
    
    
    func performRequest(with urlString : String){
        if let url = URL(string: urlString){
        let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){
                (data,response,error) in
                if error != nil{
                    
                }
                if let safeData = data{
                    if let byteCoin = self.parseJSON(safeData){
                        self.delegate?.didUpDateByteCoin(self, coin : byteCoin)
                    }
                }
            }
            task.resume()
        }
        
    }
    
    func parseJSON(_ safeData: Data) -> CoinModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try  decoder.decode(CoinData.self, from: safeData)
            let rate = decodedData.rate
            let time = decodedData.time
            let base = decodedData.asset_id_base
            let quote = decodedData.asset_id_quote
            return CoinModel(rate: rate, time: time, coinBase: base, coinQuote: quote)
            
            
        }
        catch{
            delegate?.didFailError(error)
            return nil
        }
        
    }
}
