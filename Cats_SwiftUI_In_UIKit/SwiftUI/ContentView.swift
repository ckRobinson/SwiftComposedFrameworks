//
//  ContentView.swift
//  Cats_SwiftUI_In_UIKit
//
//  Created by Cameron on 8/24/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewController: ContentViewModel = ContentViewModel()
    var body: some View {
        
        VStack {
            ScrollView {
                ForEach(viewController.contentList) { data in
                    dataCard(data: data)
                        .padding(.bottom)
                }
            }
            .padding(.vertical)
            
            Button("Load Data", action: {
                viewController.loadData()
            })
        }
    }
    
    func dataCard(data: CatsData) -> some View {
        return Group {
            HStack {
                
                VStack(alignment: .leading) {
                    Text(data.name)
                    Text(data.breed)
                }
                
                Spacer()
                
                AsyncImage(url: URL(string: data.photo) ?? nil,
                           content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150)
                }, placeholder: {
                    ProgressView()
                })
                .padding(.horizontal)
            }
            .padding(.leading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
