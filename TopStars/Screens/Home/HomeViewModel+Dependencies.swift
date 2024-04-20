//
//  HomeViewModel+Dependencies.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 20/04/2024.
//

import Foundation

extension HomeViewModel {
    struct Dependencies {
        var fetchRepoList: () async throws -> GetRepoListResponse
        static var `default`: Self = Dependencies {
            try await GetRepoListService().fetchRepoList()
        }
    }
}
