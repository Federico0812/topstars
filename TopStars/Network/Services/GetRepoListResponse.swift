//
//  GetRepoListResponse.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 20/04/2024.
//

import Foundation

struct GetRepoListResponse: Codable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [RepoItem]
    
    static let mock: GetRepoListResponse = .init(totalCount: 2, 
                                                 incompleteResults: false,
                                                 items: [.mock, .mock])
}
