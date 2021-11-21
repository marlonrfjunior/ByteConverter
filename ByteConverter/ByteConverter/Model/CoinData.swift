//
//  CoinData.swift
//  ByteConverter
//
//  Created by Marlon Junior🦈⚓️ on 20/11/21.
//

import Foundation

struct CoinData: Codable{
    let rate: Double
    let time: String
    let asset_id_base: String
    let asset_id_quote: String
}
