//
//  User+CoreDataProperties.swift
//  CoreDataTest
//
//  Created by Thomas Carroll on 7/14/20.
//  Copyright © 2020 Thomas Carroll. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var username: String?
    @NSManaged public var books: Set<Book>?

}

// MARK: Generated accessors for books
extension User {

    @objc(addBooksObject:)
    @NSManaged public func addToBooks(_ value: Book)

    @objc(removeBooksObject:)
    @NSManaged public func removeFromBooks(_ value: Book)

    @objc(addBooks:)
    @NSManaged public func addToBooks(_ values: Set<Book>)

    @objc(removeBooks:)
    @NSManaged public func removeFromBooks(_ values: Set<Book>)

}
