//
//  coinModel.swift
//  ByteConverter
//
//  Created by Marlon Junior🦈⚓️ on 20/11/21.
//

import Foundation

struct CoinModel{
    let rate : Double
    let time : String
    let coinBase : String
    let coinQuote : String
    
    var rateString: String{
        let value = rate
        return String(format: "%.2f", value)
    }
}
