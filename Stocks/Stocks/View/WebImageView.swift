//
//  WebImageView.swift
//  Stocks
//
//  Created by Sai Raghu Varma Kallepalli on 12/9/20.
//

import SwiftUI

struct WebImageView: View {
    
    var imageLink: String
    
    @ObservedObject var imageDownloader = ImageDownloader()
        
    init(link: String) {
        self.imageLink = link
        self.imageDownloader.getImage(link: imageLink)
    }
    
    var body: some View {
        if let data = imageDownloader.downloadedImageData {
            Image(uiImage: UIImage(data: data) ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
        } else {
            Text("!")
        }
    }
}

struct WebImageView_Previews: PreviewProvider {
    static var previews: some View {
        WebImageView(link: "https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5f2c667737950e6bf2338de1%2F0x0.jpg")
    }
}
