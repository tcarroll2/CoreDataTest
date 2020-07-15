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
    
    func insertArray1(arrayInfo: [Int]) {
        print("Inserting new array1 item \(arrayInfo)")
        let myArray = Test1(context: self.context)
        myArray.array1 = arrayInfo
        
        self.context.insert(myArray)
        do {
            try self.context.save()
        } catch {
            // Customize this code block to include application-specific recovery steps.
            let nserror = error as NSError
            NSApplication.shared.presentError(nserror)
        }
    }
    
    func fetchArray1() -> [Test1] {
        var array1Info = [Test1]()
        let request = NSFetchRequest<Test1>(entityName: "Test1")
        
        do {
            array1Info = try self.context.fetch(request)
        } catch {
            // Customize this code block to include application-specific recovery steps.
            let nserror = error as NSError
            NSApplication.shared.presentError(nserror)
        }
        return array1Info
    }
    
    func insertDictionary1(dictionaryInfo: [String:Int]) {
        print("Inserting new dictionary1 item \(dictionaryInfo)")
        let myDictionary = Test2(context: self.context)
        myDictionary.dictionary1 = dictionaryInfo
        
        self.context.insert(myDictionary)
        do {
            try self.context.save()
        } catch {
            // Customize this code block to include application-specific recovery steps.
            let nserror = error as NSError
            NSApplication.shared.presentError(nserror)
        }
    }
    
    func fetchDictionary1() -> [Test2] {
        var dictionary1Info = [Test2]()
        let request = NSFetchRequest<Test2>(entityName: "Test2")
        
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
