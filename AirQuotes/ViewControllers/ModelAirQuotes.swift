//
//  ModelAirQuotes.swift
//  AirQuotes
//
//  Created by riccardo ruocco on 31/01/22.
//

import Foundation
import CoreData

struct ModelAirQuotes{
    var person:[Person] = []
    var quote:[Quote] = []
    var folder:[Folder] = []
    var tag:[Tag] = []
    
    init(){
        person = CoreDataManager.shared.readPerson()
        quote = CoreDataManager.shared.readQuote()
        folder = CoreDataManager.shared.readFolder()
        tag = CoreDataManager.shared.readTag()
    }
    /// setModel set default data for the app
    func setModel(){
        
    }
    /// createTag create a newTag in the app
    mutating func createTag(name:String,color:String){
        var newTag:Tag = Tag()
        newTag.title = name
        newTag.color = color
        tag.append(newTag)
        CoreDataManager.shared.createTag(tagToSave: newTag)
    }
    ///removeTag remove a specific tag from the sistem
    mutating func removeTag(id:UUID){
        var index:Int? = nil
        var tagToDelete:Tag? = nil
//        search for the position in the array of the element to delete
        for tagIndex in 0..<tag.count{
            if(tag[tagIndex].id == id){
                index = tagIndex
            }
        }
        if (index != nil){
            tagToDelete = tag.remove(at: index!)
            CoreDataManager.shared.deleteTag(tagToDelete: tagToDelete!)
        }
    }
/// createFolder creates a new folder if one with the same name does not already exist
    mutating func createFolder(folderName:String) throws{
//      check that a folder with that name does not already exist
        for aFolder in folder{
            if(aFolder.name == folderName){
                throw FolderName.alreadyExist
            }
        }
        var newFolder:Folder = Folder()
        newFolder.name = folderName
        CoreDataManager.shared.createFolder(folderToSave: newFolder)
    }
    mutating func removeFolder(id:UUID){
        
    }
    mutating func createQuote(text:String,authorName:String,parentFolder:UUID,tagList:Array<Tag>){
        
    }
    mutating func deleteQuote(id:UUID){
        
    }
    mutating func updateQuote(id:UUID,text:String,authorName:String,tagList:Array<Tag>){
    
    }
    mutating func getFolder(idFolder:UUID){
        
    }
    mutating func addQuoteToFavorites(idQuote:UUID){
        
    }
    mutating func removeQuoteFromFavorites(idQuote:UUID){
        
    }
    
    
}
extension Quote{
    func setQuote(text:String,authorName:String,parentFolder:UUID,tagList:Array<Tag>){
        
    }
}

