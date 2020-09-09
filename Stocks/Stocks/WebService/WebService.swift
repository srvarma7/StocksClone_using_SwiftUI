//
//  WebService.swift
//  Stocks
//
//  Created by Sai Raghu Varma Kallepalli on 8/9/20.
//

import Foundation

struct Resource<T: Decodable> {
    let url: URL
}

class WebService: ObservableObject {
    
    @Published var stocks = [Stock]()
    @Published var news = [News]()
    
    init() {
        getDataFromWeb(resource: Stock.all)
        getDataFromWeb(resource: News.all)
    }

    func getDataFromWeb<T: Decodable> (resource: Resource<T>) {
        let urlLink = resource.url
        
        URLSession.shared.dataTask(with: urlLink) { data, response, error in
            if let receivedData = data , error == nil {
                debugPrint("\(Status.success.rawValue) -> Successfully downloaded Data")
                do {
                    let parsedData = try JSONDecoder().decode([T].self, from: receivedData)
                    DispatchQueue.main.async {
                        if let obtainedStocks = parsedData as? [Stock] {
                            self.stocks = obtainedStocks
                            debugPrint("\(Status.success.rawValue) -> Successfully downloaded and JSON")
                        } else if let obtainedNews = parsedData as? [News] {
                            self.news = obtainedNews
                            debugPrint("\(Status.success.rawValue) -> Successfully downloaded and JSON")
                        } else {
                            debugPrint("\(Status.error.rawValue) -> Error while parsing JSON after download")
                        }
                    }
                } catch {
                    debugPrint(error)
                }
            } else {
                debugPrint("\(Status.error.rawValue) -> Error while downloading data from \(urlLink)")
            }
        }.resume()
    }
}
