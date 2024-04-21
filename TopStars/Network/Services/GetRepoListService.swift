//
//  GetRepositoriesService.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 20/04/2024.
//

import Foundation
import CoreNetworking

struct GetRepoListService {
    func fetchRepoList() async throws -> GetRepoListResponse {
        let queryItem = URLQueryItem(name: "q", value: "language=+sort:stars")
        return try await HTTPClient.shared.execute(
            .init(urlString: "https://api.github.com/search/repositories", method: .get([queryItem])),
            responseType: GetRepoListResponse.self
        )
    }
}
