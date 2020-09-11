//
//  SearchView.swift
//  Stocks
//
//  Created by Sai Raghu Varma Kallepalli on 11/9/20.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchTerm: String
    
    var body: some View {
        
        HStack {
            Spacer()
            Image(systemName: "magnifyingglass")
                .padding(.leading, 10)
            
            TextField("Search here", text: $searchTerm)
                .foregroundColor(Color.primary)
                .padding()
            
            Spacer()
        }
        .foregroundColor(Color.secondary)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(20)
        .padding()
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchTerm: .constant("example"))
    }
}
