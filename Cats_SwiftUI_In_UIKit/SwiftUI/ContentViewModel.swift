//
//  ContentViewController.swift
//  Cats_SwiftUI_In_UIKit
//
//  Created by Cameron on 8/24/23.
//

import Foundation
import Combine

enum ContentViewState {
    case initial, loading, loaded, error
}

class ContentViewModel: ObservableObject {
    
    @Published var contentList: [CatsData] = []
    @Published var viewState: ContentViewState = .initial
    let networkService: NetworkServiceProtocol
    var cancellables: Set<AnyCancellable> = []
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService;
    }
    
    public func loadData() {
        
        networkService.fetchData()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let err):
                    print(err)
                }
            }, receiveValue: {[weak self] data in
                
                guard let self = self else {
                    return
                }
                
                self.contentList = data
            })
            .store(in: &cancellables)
        
    }
}
