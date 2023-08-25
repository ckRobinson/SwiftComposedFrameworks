//
//  ContentViewControllerRepresentable.swift
//  Cats_UIKit_In_SwiftUI
//
//  Created by Cameron on 8/24/23.
//

import Foundation
import SwiftUI

struct ContentVC: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIViewController {
        
        /// https://www.youtube.com/watch?v=T8_uqibv0YI
        let storyboard = UIStoryboard(name: "MainContent", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(withIdentifier: "MainContent")
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}
