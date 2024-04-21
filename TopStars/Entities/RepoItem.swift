//
//  RepoDTO.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 20/04/2024.
//

import Foundation
import UIKit

struct RepoItem: Codable {
    let id: Int
    let name: String
    let language: String?
    let forks: Int
    let fullName: String
    let description: String
    let url: String
    let owner: Owner
    
    var displayedStars: String { "\(forks)" }
    var langugageSegmentInfo: RepoSegmentInfo {
        RepoSegmentInfo(text: self.language ?? "Unknown",
                        icon: UIImage(systemName: "circle.fill"),
                        color: .systemBlue)
    }
    
    var starSegmentInfo: RepoSegmentInfo {
        RepoSegmentInfo(text: self.displayedStars,
                        icon: UIImage(systemName: "star.fill"),
                        color: .systemYellow)
    }
    
    static let mock: RepoItem = .init(id: 123,
                                      name: "TopStars",
                                      language: "Swift",
                                      forks: 99999,
                                      fullName: "federico0812/TopStars",
                                      description: """
An incredible app designed to highlight the best GitHub repositories available, developed with UIKit, following the MVVM pattern. It's meant to showcase good practices, a well-defined project structure, and offer a sleek user experience!
""",
                                      url: "https://github.com/Federico0812/topstars",
                                      owner: .init(avatarUrl: "https://avatars.githubusercontent.com/u/4297119?v=4"))
}

struct Owner: Codable {
    let avatarUrl: String
}
