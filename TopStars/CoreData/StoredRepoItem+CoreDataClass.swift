//
//  StoredRepoItem+CoreDataClass.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 21/04/2024.
//
//

import Foundation
import CoreData

@objc(StoredRepoItem)
public class StoredRepoItem: NSManagedObject {
    var repoItem: RepoItem {
        RepoItem(id: Int(id),
                 name: name ?? "",
                 language: language ?? "",
                 forks: Int(forks),
                 fullName: fullName ?? "",
                 description: repoDescription ?? "",
                 url: url ?? "",
                 owner: .init(avatarUrl: avatarUrl ?? ""))
    }
}
