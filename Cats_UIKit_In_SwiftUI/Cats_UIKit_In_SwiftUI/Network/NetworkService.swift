//
//  NetworkService.swift
//  Cats_UIKit_In_SwiftUI
//
//  Created by Cameron on 8/24/23.
//

import Foundation
import Combine

protocol NetworkServiceProtocol {
    func fetchData() -> AnyPublisher<[CatsData], Error>
}

enum ApiError: Error {
    case invalidURL
}

class NetworkService: NetworkServiceProtocol {

    let urlString: String = "https://647e1a94af984710854af0ac.mockapi.io/api/v1/Cats"
    func fetchData() -> AnyPublisher<[CatsData], Error> {
        
        guard let url = URL(string: urlString) else {
            return Fail(error: ApiError.invalidURL).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .decode(type: [CatsData].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
