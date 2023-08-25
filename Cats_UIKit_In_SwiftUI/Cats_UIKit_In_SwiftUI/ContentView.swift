//
//  ContentView.swift
//  Cats_UIKit_In_SwiftUI
//
//  Created by Cameron on 8/24/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            ContentVC()
                .ignoresSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

