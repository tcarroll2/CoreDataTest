//
//  DataController.swift
//  CoreDataTest
//
//  Created by Thomas Carroll on 7/14/20.
//  Copyright © 2020 Thomas Carroll. All rights reserved.
//

import Foundation
import Cocoa

class DataController {
    let persistentContainer = NSPersistentContainer(name: "LibraryDataModel")
    var context: NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }
    
    func initalizeStack() {
        self.persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                print("could not load store \(error.localizedDescription)")
                return
            }
            print("LibraryDataModel store loaded")
        }
    }
    
    func insertUser(withBook: Bool) throws {
        let user = User(context: self.context)
        user.firstName = "John"
        user.lastName = "Snow"
        user.username = "john_snow12"
        
        if withBook {
            let book = Book(context: self.context)
            book.title = "A Song of Ice and Fire"
            user.addToBooks(book)
        }
     
        self.context.insert(user)
        try self.context.save()
    }
    
    func fetchUsers() throws -> [User] {
        let users = try self.context.fetch(User.fetchRequest() as NSFetchRequest<User>)
        return users
    }
    
    func fetchUsers(withName name: String) throws -> [User] {
        let request = NSFetchRequest<User>(entityName: "User")
        request.predicate = NSPredicate(format: "firstName == %@", name)
        
        let users = try self.context.fetch(request)
        return users
    }
    
    func update(user: User) throws {
        user.firstName = "John (updated)"
        try self.context.save()
    }
    
    func delete(user: User) throws {
        self.context.delete(user)
        try self.context.save()
    }
    
    func deleteUsers(withName name: String) throws {
        let fetchRequest = User.fetchRequest() as NSFetchRequest<NSFetchRequestResult>
        fetchRequest.predicate = NSPredicate(format: "firstName == %@", name)
        
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        try self.context.execute(deleteRequest)
        try self.context.save()
    }
}
