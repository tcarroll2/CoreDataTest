import Cocoa

class DataHelper {
    
    let persistentContainer = NSPersistentContainer(name: "CoreDataTest")
    var context: NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }
    
    func initalizeStack() {
        self.persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                print("could not load store \(error.localizedDescription)")
                return
            }
            print("store loaded")
        }
    }
    
    func deleteStore() {
        let datamodelName = "CoreDataTest"
        let storeType = "sqlite"
        let url: URL = {
            let url = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0].appendingPathComponent("\(datamodelName).\(storeType)")
            print("URL \(url)")
            assert(FileManager.default.fileExists(atPath: url.path))

            return url
        }()
        try! persistentContainer.persistentStoreCoordinator.destroyPersistentStore(at: url, ofType: storeType, options: nil)
    }
    
    func insertTest1(name: String, arrayInfo: [Int]) {
        print("Inserting new array1 item \(name) with data \(arrayInfo)")
        let myTest1 = Test1(context: self.context)
        myTest1.name1 = name
        myTest1.array1 = arrayInfo
        
        self.context.insert(myTest1)
        do {
            try self.context.save()
        } catch {
            // Customize this code block to include application-specific recovery steps.
            let nserror = error as NSError
            NSApplication.shared.presentError(nserror)
        }
    }
    
    func fetchTest1(name: String) -> [Test1] {
        var test1Info = [Test1]()
        let request = NSFetchRequest<Test1>(entityName: "Test1")
        request.predicate = NSPredicate(format: "name1 == %@", name)
        do {
            test1Info = try self.context.fetch(request)
        } catch {
            // Customize this code block to include application-specific recovery steps.
            let nserror = error as NSError
            NSApplication.shared.presentError(nserror)
        }
        return test1Info
    }
    
    func insertTest2(name: String, dictionaryInfo: [String:Int]) {
        print("Inserting new dictionary1 item \(dictionaryInfo)")
        let myTest2 = Test2(context: self.context)
        myTest2.name1 = name
        myTest2.dictionary1 = dictionaryInfo
        
        self.context.insert(myTest2)
        do {
            try self.context.save()
        } catch {
            // Customize this code block to include application-specific recovery steps.
            let nserror = error as NSError
            NSApplication.shared.presentError(nserror)
        }
    }
    
    func fetchTest2(name: String) -> [Test2] {
        var dictionary1Info = [Test2]()
        let request = NSFetchRequest<Test2>(entityName: "Test2")
        request.predicate = NSPredicate(format: "name1 == %@", name)
        
        do {
            dictionary1Info = try self.context.fetch(request)
        } catch {
            // Customize this code block to include application-specific recovery steps.
            let nserror = error as NSError
            NSApplication.shared.presentError(nserror)
        }
        return dictionary1Info
    }
}
