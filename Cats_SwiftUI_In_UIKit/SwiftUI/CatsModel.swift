//
//  CatsModel.swift
//  Cats_SwiftUI_In_UIKit
//
//  Created by Cameron on 8/24/23.
//

import Foundation

struct CatsData: Decodable, Identifiable {
    let id: String
    let breed: String
    let name: String
    let photo: String
}
