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
            try await fetchRepoListService()
        }
    }
    
    func fetchRepoListService() async throws {
        let response = try await dependencies.fetchRepoList()
        
        //Note: items are shuffled to make the reload more visible
        var shuffledItems = response.items.shuffled()
        shuffledItems.insert(.mock, at: 0)
        items = shuffledItems
        
        isInitialLoading = false
    }
}
