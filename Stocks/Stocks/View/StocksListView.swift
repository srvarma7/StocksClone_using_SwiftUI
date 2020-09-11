//
//  StocksListView.swift
//  Stocks
//
//  Created by Sai Raghu Varma Kallepalli on 11/9/20.
//

import SwiftUI

struct StocksListView: View {
    
    @Binding var stocks: [StockViewModel]
    @Binding var searchTerm: String
    
    var body: some View {
        
        let filteredStocks = self.searchTerm.isEmpty ? stocks : stocks.filter { $0.symbol.lowercased().starts(with: self.searchTerm.lowercased()) }
        
        VStack {
            List {
                ForEach(filteredStocks, id: \.symbol) { stock in
                    StockCellView(stock: stock)
                }
                .listRowBackground(Color.black)
            }
            Text("test")
        }.background(Color.black)
    }
}

struct StockView: View {
    
    var stock: StockViewModel
    
    var body: some View {
        Text("Hey").listRowBackground(Color.green)
    }
}

struct StocksListView_Previews: PreviewProvider {
    static var previews: some View {
        let stock = Stock(symbol: "APL", description: "Apple", price: 20, change: "+3")
        let stockViewModel = [StockViewModel(stock: stock)]
        StocksListView(stocks: .constant(stockViewModel), searchTerm: .constant("A"))
    }
}
