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
    
    func update() {
        Task {
            try await fetchRepoListFromCache()
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
        self.display(fetchedItems: response.items)
        CoreDataManager.shared.deleteAllEntities()
        CoreDataManager.shared.store(items: response.items)
    }
    
    private func display(fetchedItems: [RepoItem]) {
        var shuffledItems = fetchedItems.shuffled()
        shuffledItems.insert(.mock, at: 0)
        self.items = shuffledItems
        isInitialLoading = false
    }
}
