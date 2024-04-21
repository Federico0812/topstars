//
//  GetRepoListServiceTests.swift
//  TopStarsTests
//
//  Created by Federico Bustos Fierro on 21/04/2024.
//

import XCTest
@testable import TopStars
import Combine

final class HomeViewModelTests: XCTestCase {
    func testService() async {
        // Given
        let mockResponse: GetRepoListResponse = .mock
        let mockPublisher: AnyPublisher<[RepoItem], Never> = Just(mockResponse.items).eraseToAnyPublisher()
        let dependencies = HomeViewModel.Dependencies(fetchRepoItemsPublisher: { _ in
            mockPublisher
        })
        let sut: HomeViewModel = .init(dependencies: dependencies)

        // When
        sut.getItems()

        // Then
        XCTAssertEqual(sut.items.count, 3)
    }
}
