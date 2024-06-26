//
//  HomeViewModel.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 20/04/2024.
//

import Foundation
import Combine

class HomeViewModel {
    @Published var error: ServiceError? = nil
    @Published var items: [RepoItem] = []
    @Published var isInitialLoading = true
    
    private let dependencies: Dependencies
    private var subscribers: [AnyCancellable] = []
    
    init(dependencies: Dependencies = .default) {
        self.dependencies = dependencies
    }
    
    func getItems(allowCachedResults: Bool = true) {
        self.dependencies.fetchRepoItemsPublisher(allowCachedResults).sink(receiveCompletion: { completion in
            if case let .failure( serviceError) = completion {
                self.display(error: serviceError)
            }
        }, receiveValue: { items in
            self.display(fetchedItems: items)
        }).store(in: &subscribers)
    }
    
    private func display(fetchedItems: [RepoItem]) {
        var displayItems = fetchedItems
        displayItems.insert(.mock, at: 0)
        self.items = displayItems
        isInitialLoading = false
    }
    
    
    private func display(error: ServiceError) {
        self.error = error
    }
}
