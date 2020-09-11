//
//  NewsViewModel.swift
//  Stocks
//
//  Created by Sai Raghu Varma Kallepalli on 11/9/20.
//

import Foundation

struct NewsViewModel {
        
    let news: News
    
    var title: String {
        return news.title
    }
    
    var publication: String {
        return news.publication
    }
    
    var imageURL: String {
        return news.imageURL
    }
}
