//
//  NewsListView.swift
//  Stocks
//
//  Created by Sai Raghu Varma Kallepalli on 11/9/20.
//

import SwiftUI

struct NewsListView: View {
    
    var news: [NewsViewModel]
    
    var body: some View {
        List {
            ForEach(self.news, id: \.title) { news in
                NewsCellView(news: news)
                    .padding([.bottom, .top])
            }.listRowBackground(Color.black)
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        let news = News(title: "The Bull Market is Charging into 2020", publication: "The Wallstreet Journal", imageURL: "https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5f2c667737950e6bf2338de1%2F0x0.jpg")
        let newsModel = NewsViewModel(news: news)
        NewsListView(news: [newsModel, newsModel])
    }
}
