//
//  NewsView.swift
//  Stocks
//
//  Created by Sai Raghu Varma Kallepalli on 12/9/20.
//

import SwiftUI

struct NewsView: View {
    
    @ObservedObject var newsVM: NewsListViewModel
    
    init() {
        newsVM = NewsListViewModel()
        UITableView.appearance().backgroundColor = UIColor.clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("Top Stores")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding([.leading, .top])
                
                Text("From ")
                    .foregroundColor(.gray)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding([.leading])
                
                
                NewsListView(news: $newsVM.news)
                    
            }
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
