//
//  Test1+CoreDataProperties.swift
//  CoreDataTest
//
//  Created by Thomas Carroll on 7/14/20.
//  Copyright © 2020 Thomas Carroll. All rights reserved.
//
//

import Foundation
import CoreData


extension Test1 {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Test1> {
        return NSFetchRequest<Test1>(entityName: "Test1")
    }

    @NSManaged public var name1: String
    @NSManaged public var array1: [Int]

}
