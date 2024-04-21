//
//  HomeViewModel.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 20/04/2024.
//

import Foundation

class HomeViewModel {
    private let dependencies: Dependencies
    @Published var items: [RepoItem] = []
    @Published var isInitialLoading = true
    
    init(dependencies: Dependencies = .default) {
        self.dependencies = dependencies
    }
    
    func getItems(allowCachedResults: Bool = true) {
        Task {
            if allowCachedResults {
                try await fetchRepoListFromCache()
            }
            try await fetchRepoListFromService()
        }
    }
    
    func fetchRepoListFromCache() async throws {
        let cachedResults = try await CoreDataManager.shared.fetchAllEntities()
        print("Cached results found: \(cachedResults.count)!")
        if cachedResults.count > 0 {
            self.display(fetchedItems: cachedResults)
        }
    }
    
    func fetchRepoListFromService() async throws {
        let response = try await dependencies.fetchRepoList()
        let shuffledItems = response.items.shuffled()
        self.display(fetchedItems: shuffledItems)
        CoreDataManager.shared.deleteAllEntities()
        CoreDataManager.shared.store(items: shuffledItems)
    }
    
    private func display(fetchedItems: [RepoItem]) {
        var displayItems = fetchedItems
        displayItems.insert(.mock, at: 0)
        self.items = displayItems
        isInitialLoading = false
    }
}
