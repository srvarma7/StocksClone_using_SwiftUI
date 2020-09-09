//
//  ContentView.swift
//  Stocks
//
//  Created by Sai Raghu Varma Kallepalli on 8/9/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var webservice = WebService()
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
