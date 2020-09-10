//
//  StockListViewModel.swift
//  Stocks
//
//  Created by Sai Raghu Varma Kallepalli on 9/9/20.
//

import Foundation

class StockListViewModel: ObservableObject {
    
    @Published var searchTerm: String = ""
    @Published var stocks: [StockViewModel] = [StockViewModel]()
    
    func loadDataFromWeb() {
        fetchStocks()
        //fetchNews()
    }
    
    private func fetchStocks() {
        WebService().getDataFromWeb(resource: Stock.all, completion: { parsedData in
            if let obtainedStocks = parsedData {
                self.stocks = obtainedStocks.map(StockViewModel.init)
                self.printStatus(status: .success)
            } else {
                self.printStatus(status: .error)
            }
        })
        
    }
    
//    private func fetchNews() {
//        WebService().getDataFromWeb(resource: News.all, completion: { parsedData in
//            if let obtainedNews = parsedData {
//                //self.news = obtainedNews
//                self.printStatus(status: .success)
//            } else {
//                self.printStatus(status: .error)
//            }
//        })
//    }
    
    func printStatus(status: Status) {
        if status.rawValue == "🛑" {
            debugPrint("\(Status.error.rawValue) -> Error while parsing JSON after download")
        } else {
            debugPrint("\(Status.success.rawValue) -> Successfully downloaded and parsed JSON")
        }
    }

}
