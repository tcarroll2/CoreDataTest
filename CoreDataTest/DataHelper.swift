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
            print("CoreDataTest store loaded")
        }
    }
    
    func deleteStore(storeName: String) {
        let programName = "CoreDataTest"
        let storeType = "sqlite"
        let url: URL = {
            let url = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0].appendingPathComponent("\(programName)/\(storeName).\(storeType)")
            //print("url = \(url)")
            //print("url.path = \(url.path)")
            assert(FileManager.default.fileExists(atPath: url.path))

            return url
        }()
        try! persistentContainer.persistentStoreCoordinator.destroyPersistentStore(at: url, ofType: storeType, options: nil)
    }
    
    func insertTest1(name: String, arrayInfo: [Int]) throws {
        print("Inserting new Test1 item named \(name) with data \(arrayInfo)")
        let test1 = Test1(context: self.context)
        test1.name1 = name
        test1.array1 = arrayInfo
        
        self.context.insert(test1)
        try self.context.save()
    }
    
    func fetchTest1() throws -> [Test1] {
        let test1 = try self.context.fetch(Test1.fetchRequest() as NSFetchRequest<Test1>)
        return test1
    }
    
    func fetchTest1(withName name: String) throws -> [Test1] {
        let request = NSFetchRequest<Test1>(entityName: "Test1")
        request.predicate = NSPredicate(format: "name1 == %@", name)
        
        let test1 = try self.context.fetch(request)
        return test1
    }
    
    func insertTest2(name: String, dictionaryInfo: [String:Int]) throws {
        print("Inserting new Test2 item named \(name) with data \(dictionaryInfo)")
        let myTest2 = Test2(context: self.context)
        myTest2.name1 = name
        myTest2.dictionary1 = dictionaryInfo
        
        self.context.insert(myTest2)
        try self.context.save()
    }
    
    func fetchTest2() throws -> [Test2] {
        let test2 = try self.context.fetch(Test2.fetchRequest() as NSFetchRequest<Test2>)
        return test2
    }
    
    func fetchTest2(withName name: String) throws -> [Test2] {
        let request = NSFetchRequest<Test2>(entityName: "Test2")
        request.predicate = NSPredicate(format: "name1 == %@", name)

        let dictionary1Info = try self.context.fetch(request)
        return dictionary1Info
    }
}
