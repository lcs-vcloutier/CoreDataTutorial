//
//  Persistence.swift
//  CDCRUDMVVM
//
//  Created by Vincent Cloutier on 2022-01-24.
//

import Foundation
import CoreData

struct PersistenceController{
    static let shared = PersistenceController()
    
    let container:NSPersistentContainer
    init(inMemory: Bool = false){
        container = NSPersistentContainer(name: "CDCRUDMVVM")
        if inMemory{
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores(completionHandler: {(storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
