//
//  RepoDTO.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 20/04/2024.
//

import Foundation

struct RepoItem: Codable {
    let id: Int
    let name: String
    let fullName: String
    let description: String
    let url: String
    let owner: Owner
}

struct Owner: Codable {
    let avatarUrl: String
}
