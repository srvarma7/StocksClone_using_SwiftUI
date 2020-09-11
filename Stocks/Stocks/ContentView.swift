//
//  ContentView.swift
//  Stocks
//
//  Created by Sai Raghu Varma Kallepalli on 8/9/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchTerm = ""
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor.black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().prefersLargeTitles = false
    }
    
    var body: some View {
        
        NavigationView {
            ZStack(alignment: .leading) {
                Color.black
                VStack(alignment: .leading) {
                    Text("September 11")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                        
                    SearchView(searchTerm: self.$searchTerm)
                        .padding()
                    
                }.offset(y: -240)
            }.edgesIgnoringSafeArea(.all)
            .navigationTitle("Stocks")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
