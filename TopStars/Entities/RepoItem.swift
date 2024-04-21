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
        RepoSegmentInfo(text: self.language,
                        icon: UIImage(systemName: "circle.fill"),
                        color: .systemBlue)
    }
    
    var starSegmentInfo: RepoSegmentInfo {
        RepoSegmentInfo(text: self.displayedStars,
                        icon: UIImage(systemName: "star.fill"),
                        color: .systemYellow)
    }
}

struct Owner: Codable {
    let avatarUrl: String
}
