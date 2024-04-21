//
//  GetRepositoriesService.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 20/04/2024.
//

import Foundation
import CoreNetworking
import Combine

struct GetRepoListService {
    func fetchRepoList() async throws -> GetRepoListResponse {
        let queryItem = URLQueryItem(name: "q", value: "language=+sort:stars")
        let response = try await HTTPClient.shared.execute(
            .init(urlString: "https://api.github.com/search/repositories", method: .get([queryItem])),
            responseType: GetRepoListResponse.self
        )
        
        //Note: service response is delay to make the loading states more noticeables
        try await Task.sleep(seconds: 3.0)
        return response
    }
    
    func getPublisher() -> Future<[RepoItem], Never> {
        Future { promise in
            Task {
                do {
                    let result = try await fetchRepoList()
                    promise(.success(result.items.shuffled()))
                } catch {
                    print(error)
                }
            }
        }
    }
}
