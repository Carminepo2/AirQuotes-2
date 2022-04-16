//
//  CoreDataManager.swift
//  AirQuotes
//
//  Created by riccardo ruocco on 31/01/22.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    let persistentContainer: NSPersistentContainer

    
    private init() {
        persistentContainer = NSPersistentContainer(name: "CoreDataModelAirQuotes")
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
            do {
                try context.save()
            }
            catch {
                
            }
        }
    }
//    MARK: - CRUD(Person)
    func createPerson(personToSave:Person){
        save()
    }
    
    func readPerson()->Array<Person>{
        let fetchRequest:NSFetchRequest<Person> = Person.fetchRequest()
        var result:Array<Person> = []
        do{
             result = try persistentContainer.viewContext.fetch(fetchRequest)
        }catch{
            
        }
        return result
    }
    
    func updatePerson(){
        save()
    }
    
    func deletePerson(personToDelete:Person){
        persistentContainer.viewContext.delete(personToDelete)
        save()
    }
    
//    MARK: - CRUD(Quote)
    func createQuote(quoteToSave:Quote){
        
        save()
    }
    func readQuote()->Array<Quote>{
        let fetchRequest:NSFetchRequest<Quote> = Quote.fetchRequest()
        var result:Array<Quote> = []
        do{
            result =  try persistentContainer.viewContext.fetch(fetchRequest)
        }
        catch{
        }
        return result
    }
    func updateQuote(){
        save()
    }
    func deleteQuote(quoteToDelete:Quote){
        persistentContainer.viewContext.delete(quoteToDelete)
        save()
    }
//    MARK: - CRUD(Folder)
    func createFolder(folderToSave:Folder){
        
        save()
    }
    func readFolder()->Array<Folder>{
        let fetchRequest:NSFetchRequest<Folder> = Folder.fetchRequest()
        var result:Array<Folder> = []
        do{
            result = try persistentContainer.viewContext.fetch(fetchRequest)
        }
        catch{
            
        }
        
        return result
    }
    func updateFolder(){
        save()
    }
    func deleteFolder(folderToDelete:Folder){
        persistentContainer.viewContext.delete(folderToDelete)
        save()
    }
//    MARK: - CRUD(Tag)
    func createTag(tagToSave:Tag){
        save()
    }
    func readTag()->Array<Tag>{
        let fetchRequest:NSFetchRequest<Tag> = Tag.fetchRequest()
        var result:Array<Tag> = []
        do{
            result = try persistentContainer.viewContext.fetch(fetchRequest)
        }catch{
            
        }
        return result
    }
    func updateTag(){
        save()
    }
    func deleteTag(tagToDelete:Tag){
        persistentContainer.viewContext.delete(tagToDelete)
        save()
    }
    
    
    func resetAllCoreData() {
        
        // get all entities and loop over them
        let entityNames = self.persistentContainer.managedObjectModel.entities.map({ $0.name!})
        entityNames.forEach { [weak self] entityName in
            let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
            
            do {
                try self?.persistentContainer.viewContext.execute(deleteRequest)
                try self?.persistentContainer.viewContext.save()
            } catch {
                // error
            }
        }
    }
    
}
