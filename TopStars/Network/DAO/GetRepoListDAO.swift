//
//  GetRepoDAO.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 21/04/2024.
//

import Foundation
import Combine

class GetRepoListDAO {
    
    public static let shared = GetRepoListDAO()
    private let dependencies: Dependencies
    private var subscribers: [AnyCancellable] = []
    
    init(dependencies: Dependencies = .default) {
        self.dependencies = dependencies
    }
    
    func fetchRepoItemsPublisher(allowCachedResults: Bool) -> AnyPublisher<[RepoItem], ServiceError> {
        let servicePublisher = dependencies.getServicePublisher().eraseToAnyPublisher()
        let storagePublisher = dependencies.storageProvider().getStoragePublisher().eraseToAnyPublisher()
        servicePublisher.sink(receiveCompletion: { completion in
            if case let .failure(serviceError) = completion {
                print("Service failed with error: \(serviceError)")
            }
        }, receiveValue: { items in
            // Note: update stored entities with new values
            self.dependencies.storageProvider().deleteAllEntities()
            self.dependencies.storageProvider().store(items: items)
        }).store(in: &subscribers)
        if allowCachedResults {
            let combinedPublisher = servicePublisher.merge(with: storagePublisher)
            return combinedPublisher.eraseToAnyPublisher()
        }
        return servicePublisher
    }
}

extension GetRepoListDAO {
    struct Dependencies {
        var getServicePublisher: () -> AnyPublisher<[RepoItem], ServiceError>
        var storageProvider: () -> StorageProvider
        
        static var `default`: Self = Dependencies(getServicePublisher: {
            GetRepoListService().getPublisher().eraseToAnyPublisher()
        }, storageProvider: {
            CoreDataManager.shared
        })
    }
}


