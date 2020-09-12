//
//  StocksView.swift
//  Stocks
//
//  Created by Sai Raghu Varma Kallepalli on 8/9/20.
//

import SwiftUI

struct StocksView: View {
    
    @ObservedObject var stockListVM: StockListViewModel
    @ObservedObject var newsVM: NewsListViewModel
    @ObservedObject var dragValue = Drag()
    
    init() {
        stockListVM = StockListViewModel()
        newsVM = NewsListViewModel()
        self.setupNavigation()
        self.setupTableView()
    }
    
    var body: some View {
        
        VStack {
            ZStack {
                Color.black
                
                VStack(alignment: .leading) {
                    Spacer(minLength: 50)
                    stocksHedingView()
                    todayDateView()
                    
                    SearchView(searchTerm: self.$stockListVM.searchTerm)
                        .padding()
                    
                    StocksListView(stocks: $stockListVM.stocks, searchTerm: $stockListVM.searchTerm)
                    //Spacer()
                    
                    NewsView(onDragBegin: { value in
                        self.dragValue.dragOffSet = value.translation
                    }, onDragEnded: { value in
                        if value.translation.height > 0 {
                            self.dragValue.dragOffSet = CGSize(width: 0, height: 190)
                        } else {
                            self.dragValue.dragOffSet = CGSize(width: 0, height: -300)
                        }
                    }, newsList: newsVM.news)
                    .animation(.spring())
                    .offset(y: dragValue.dragOffSet.height)
                }
            }.edgesIgnoringSafeArea(.all)
        }
        
    }
    
    func setupNavigation() {
        UINavigationBar.appearance().backgroundColor = .black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().prefersLargeTitles = true
    }
    
    func setupTableView() {
        UITableView.appearance().backgroundColor = .black
        UITableViewCell.appearance().backgroundColor = .black
        UITableView.appearance().backgroundColor = UIColor.clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    fileprivate func stocksHedingView() -> some View {
        return Text("Stocks")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
    }
    
    fileprivate func todayDateView() -> some View {
        return Text("11 September")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.gray)
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StocksView()
    }
}
