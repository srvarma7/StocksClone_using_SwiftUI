//
//  ContentView.swift
//  Stocks
//
//  Created by Sai Raghu Varma Kallepalli on 8/9/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchTerm = ""
    
    var body: some View {
        
        NavigationView {
            
            ZStack(alignment: .leading) {
                
                Color.black
                
                Text("September 11")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -350)
                
                    .navigationTitle("Stocks")
            }
        }.edgesIgnoringSafeArea(Edge.Set(.bottom))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
