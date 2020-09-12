//
//  NewsListViewModel.swift
//  Stocks
//
//  Created by Sai Raghu Varma Kallepalli on 11/9/20.
//

import Foundation
import SwiftUI

class NewsListViewModel: ObservableObject {
    
    @Published var news: [NewsViewModel] = [NewsViewModel]()
    
    init() {
        fetchNews()
    }
    
    private func fetchNews() {
        WebService().getDataFromWeb(resource: News.all, completion: { parsedData in
            if let obtainedStocks = parsedData {
                self.news = obtainedStocks.map(NewsViewModel.init)
                self.printStatus(status: .success)
            } else {
                self.printStatus(status: .error)
            }
        })
    }
    
    func printStatus(status: Status) {
        if status.rawValue == "🛑" {
            debugPrint("\(Status.error.rawValue) -> Error while parsing JSON after download")
        } else {
            debugPrint("\(Status.success.rawValue) -> Successfully downloaded and parsed JSON")
        }
    }
    
}
