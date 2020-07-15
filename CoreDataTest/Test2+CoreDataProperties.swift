//
//  Test2+CoreDataProperties.swift
//  CoreDataTest
//
//  Created by Thomas Carroll on 7/14/20.
//  Copyright © 2020 Thomas Carroll. All rights reserved.
//
//

import Foundation
import CoreData


extension Test2 {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Test2> {
        return NSFetchRequest<Test2>(entityName: "Test2")
    }

    @NSManaged public var dictionary1: [String:Int]

}
