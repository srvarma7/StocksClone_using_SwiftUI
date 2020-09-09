//
//  StockListViewModel.swift
//  Stocks
//
//  Created by Sai Raghu Varma Kallepalli on 9/9/20.
//

import Foundation

class StockListViewModel: ObservableObject {
    
    @Published var searchTerm: String = ""
    @Published var stocks: [StockViewModel] = [StockViewModel]()
    
    
    
}
