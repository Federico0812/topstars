//
//  GetRepoListServiceTests.swift
//  TopStarsTests
//
//  Created by Federico Bustos Fierro on 21/04/2024.
//

import XCTest
@testable import TopStars

final class GetRepoListService: XCTestCase {
    func testService() async {
        // Given
        let mockResponse: GetRepoListResponse = .mock
        
        let sut: HomeViewModel = .init(dependencies: .init(fetchRepoList: {
            mockResponse
        }))

        // When
        try? await sut.fetchRepoListService()

        // Then
        XCTAssertEqual(sut.items.count, 3)
    }
}
