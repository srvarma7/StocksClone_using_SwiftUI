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

class WebService {
    
    func getDataFromWeb<T: Decodable> (resource: Resource<T>, completion: @escaping ([T]?) -> Void) {
        let urlLink = resource.url
        
        URLSession.shared.dataTask(with: urlLink) { data, response, error in
            if let receivedData = data , error == nil {
                debugPrint("\(Status.success.rawValue) -> Successfully downloaded Data")
                do {
                    let parsedData = try JSONDecoder().decode([T].self, from: receivedData)
                    
                    DispatchQueue.main.async {
                        completion(parsedData)
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
