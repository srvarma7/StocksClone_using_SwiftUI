//
//  News.swift
//  Stocks
//
//  Created by Sai Raghu Varma Kallepalli on 8/9/20.
//

import Foundation

struct News: Decodable {
    let title: String
    let publication: String
    let imageURL: String
}

extension News {
    static var all: Resource<News> = {
        let url = URL(string: "https://island-bramble.glitch.me/top-news")!
        return Resource(url: url)
    }()
}
