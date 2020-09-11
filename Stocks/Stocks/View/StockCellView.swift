//
//  StockCellView.swift
//  Stocks
//
//  Created by Sai Raghu Varma Kallepalli on 11/9/20.
//

import SwiftUI

struct StockCellView: View {
    
    var stock: Stock
    var fontColor = Color.black
    
    var body: some View {
        VStack {
            HStack {
                Text(stock.symbol)
                    .font(.title)
                    .foregroundColor(fontColor)
                Spacer()
                Text("\(stock.price)")
                    .font(.title)
                    .foregroundColor(fontColor)
            }
            HStack {
                Text(stock.description)
                    .font(.title2)
                    .foregroundColor(fontColor)
                Spacer()
                Text(stock.change)
                    .foregroundColor(fontColor)
                    .font(.title2)
                    .padding(3)
                    .background(Color.red)
                    .cornerRadius(7)
            }
        }
        .padding()
        .background(Color.green)

    }
}

struct StockCellView_Previews: PreviewProvider {
    static var previews: some View {
        StockCellView(stock: Stock(symbol: "APL", description: "Apple", price: 25, change: "+1.5"))
    }
}
