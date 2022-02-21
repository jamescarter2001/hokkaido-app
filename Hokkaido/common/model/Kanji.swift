//
//  Kanji.swift
//  Hokkaido
//
//  Created by James on 20/02/2022.
//

import Foundation

struct Kanji : Identifiable, Codable {
    let id : Int64
    let symbol: String
    let name : String
    let onReadings : [String]
    let kunReadings: [String]
    let meanings: [String]
    
    init(id: Int64, symbol: String, name: String, onReadings: [String], kunReadings: [String], meanings: [String]) {
        self.id = id
        self.symbol = symbol
        self.name = name
        self.onReadings = onReadings
        self.kunReadings = kunReadings
        self.meanings = meanings
    }
}
