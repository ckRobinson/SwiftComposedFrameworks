//
//  ViewModel.swift
//  Cats_UIKit_In_SwiftUI
//
//  Created by Cameron on 8/24/23.
//

import Foundation
import Combine

enum ContentViewState {
    case initial, loading, loaded, error
}

class ContentViewModel {
    
    let networkService: NetworkServiceProtocol
    var cancellables: Set<AnyCancellable> = []
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService;
    }
    
    public func loadData( callback: @escaping ([CatsData]) -> Void) {
        
        networkService.fetchData()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let err):
                    print(err)
                }
            }, receiveValue: {data in
                callback(data)
            })
            .store(in: &cancellables)
    }
}
