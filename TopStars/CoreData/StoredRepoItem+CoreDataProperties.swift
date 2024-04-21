//
//  StoredRepoItem+CoreDataProperties.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 21/04/2024.
//
//

import Foundation
import CoreData


extension StoredRepoItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StoredRepoItem> {
        return NSFetchRequest<StoredRepoItem>(entityName: "StoredRepoItem")
    }

    @NSManaged public var avatarUrl: String?
    @NSManaged public var forks: Int64
    @NSManaged public var fullName: String?
    @NSManaged public var id: Int64
    @NSManaged public var language: String?
    @NSManaged public var name: String?
    @NSManaged public var repoDescription: String?
    @NSManaged public var url: String?

}

extension StoredRepoItem : Identifiable {

}
