//
//  StockCellView.swift
//  Stocks
//
//  Created by Sai Raghu Varma Kallepalli on 11/9/20.
//

import SwiftUI

struct StockCellView: View {
    
    var stock: StockViewModel
    var fontColor = Color.white
    
    var body: some View {
        VStack {
            HStack {
                Text(stock.symbol)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(fontColor)
                Spacer()
                Text("\(stock.price)")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(fontColor)
            }
            HStack {
                Text(stock.description)
                    .font(.title3)
                    .foregroundColor(Color.gray)
                Spacer()
                Text(stock.change)
                    .foregroundColor(fontColor)
                    .font(.headline)
                    .padding(3)
                    .background(Color.red)
                    .cornerRadius(7)
            }
        }.background(Color.black)
    }
}

struct StockCellView_Previews: PreviewProvider {
    static var previews: some View {
        let stock = Stock(symbol: "APL", description: "Apple", price: 25, change: "+1.5")
        StockCellView(stock: StockViewModel(stock: stock))
    }
}
