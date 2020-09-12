//
//  NewsView.swift
//  Stocks
//
//  Created by Sai Raghu Varma Kallepalli on 12/9/20.
//

import SwiftUI

class Drag: ObservableObject {
    @Published var dragOffSet: CGSize = CGSize(width: 0, height: 200)
}

struct NewsView: View {
    
    let onDragBegin: (DragGesture.Value) -> Void
    let onDragEnded: (DragGesture.Value) -> Void
    var newsList: [NewsViewModel]
    
    var body: some View {
        UITableView.appearance().backgroundColor = UIColor.clear
        UITableViewCell.appearance().backgroundColor = .clear
        
        return ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                VStack {
                    Rectangle()
                        .frame(width: 100, height: 7)
                        .foregroundColor(.gray)
                        .cornerRadius(20)
                        .padding(.top, 20)
                
                    HStack {
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
                            
                        }
                        Spacer()
                    }
//                    }.gesture(DragGesture()
//                                .onChanged(self.onDragBegin)
//                                .onEnded(self.onDragEnded)
//                    )
                    
                }.gesture(DragGesture()
                            .onChanged(self.onDragBegin)
                            .onEnded(self.onDragEnded)
                )
                
                NewsListView(news: newsList)
                    
            }
        }
    }
}

//struct NewsView_Previews: PreviewProvider {
//    static var previews: some View {
//        //NewsView(onDragBegin: {_ in}, onDragEnded: { _ in }, newsVM: )
//    }
//}
