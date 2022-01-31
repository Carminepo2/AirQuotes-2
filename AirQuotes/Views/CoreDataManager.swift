//
//  CoreDataManager.swift
//  AirQuotes
//
//  Created by riccardo ruocco on 31/01/22.
//

import Foundation
import CoreData

class CoreDataManager{
    static let shared = CoreDataManager()
    let persistentContainer:NSPersistentContainer

    
    private init(){
        persistentContainer = NSPersistentContainer(name: "CoreDataModel")
        persistentContainer.loadPersistentStores{ (description,error) in
            if let error = error {
                fatalError("Core Data Store failed \(error.localizedDescription)")
            }
        }
    }
    
    func save(){
        do{
            try persistentContainer.viewContext.save()
        }
        catch{
            persistentContainer.viewContext.rollback()
        }
    }
    
    func saveContext(){
        let context = persistentContainer.viewContext
        if context.hasChanges{
            do{
                try context.save()
            }
            catch{
                
            }
        }
    }
//    MARK: - CRUD(Person)
    
    
//    MARK: - CRUD(Quote)
    
    
//    MARK: - CRUD(Folder)
    
    
//    MARK: - CRUD(Tag)

    


    
    
}
