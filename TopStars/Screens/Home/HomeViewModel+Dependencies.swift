//
//  HomeViewModel+Dependencies.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 20/04/2024.
//

import Foundation
import Combine

extension HomeViewModel {
    struct Dependencies {
        var fetchRepoItemsPublisher: (_ allowCachedResults: Bool) -> AnyPublisher<[RepoItem], ServiceError>
        
        static var `default`: Self = Dependencies(fetchRepoItemsPublisher: { allowCachedResults in
            GetRepoListDAO.shared.fetchRepoItemsPublisher(allowCachedResults: allowCachedResults)
        })
    }
}
