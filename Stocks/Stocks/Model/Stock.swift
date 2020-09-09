//
//  Stock.swift
//  Stocks
//
//  Created by Sai Raghu Varma Kallepalli on 8/9/20.
//

import Foundation

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: Int
    let change: String
}

extension Stock {
    static var all: Resource<Stock> = {
        let url = URL(string: "https://island-bramble.glitch.me/stocks")!
        return Resource(url: url)
    }()
}
