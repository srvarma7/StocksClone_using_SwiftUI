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

class ImageDownloader: ObservableObject {
    
    @Published var downloadedImageData: Data?
    
    func getImage(link: String) {
        convertLinkToURL(link: link)
    }
    
    private func convertLinkToURL(link: String) {
        guard let urlLink = URL(string: link) else {
            print("Error while converting link to URL")
            return
        }
        downloadDatabyLink(urlLink: urlLink)
    }
    
    private func downloadDatabyLink(urlLink: URL) {
        URLSession.shared.dataTask(with: urlLink) { data, response, error in
            guard let data = data, error == nil else {
                print("Error while Downloading image data")
                return
            }
            DispatchQueue.main.async {
                self.downloadedImageData = data
                print(data)
            }
        }.resume()
    }
}
