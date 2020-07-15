//
//  Book+CoreDataProperties.swift
//  CoreDataTest
//
//  Created by Thomas Carroll on 7/14/20.
//  Copyright © 2020 Thomas Carroll. All rights reserved.
//
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var title: String?
    @NSManaged public var users: User?

}
