//
//  HomeViewModel.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 20/04/2024.
//

import Foundation

class HomeViewModel {
    private let dependencies: Dependencies
    @Published var repoItems: [RepoItem] = []
    @Published var isInitialLoading = true
    
    init(dependencies: Dependencies = .default) {
        self.dependencies = dependencies
    }
    
    func fetchRepoList() {
        Task {
            let response = try await dependencies.fetchRepoList()
            //Note: items are shuffled to make the reload more visible
            self.repoItems = response.items.shuffled()
            isInitialLoading = false
        }
    }
}
