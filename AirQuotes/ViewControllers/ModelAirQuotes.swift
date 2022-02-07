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
            //remove the element from the array
            tagToDelete = tag.remove(at: index!)
            //remove the array from the DB
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
///removeFolder remove a specific folder from the sistem
    mutating func removeFolder(id:UUID){
        var index:Int? = nil
        var folderToDelete:Folder? = nil
        //search for the position in the array of the element to delete
        for folderIndex in 0..<folder.count{
            if(folder[folderIndex].id == id){
                index = folderIndex
            }
        }
        if(index != nil){
//            remove the element from the array
            folderToDelete = folder.remove(at: index!)
//            remove the array from the DB
            CoreDataManager.shared.deleteFolder(folderToDelete: folderToDelete!)
        }

    }
    ///the user creates a unique quote within the same folder
    mutating func createQuote(text:String,authorName:String,parentFolder:UUID,tagList:Array<Tag>) throws{
        var theFolder:Folder = Folder()
        var theQuotesInTheFolder:Array<Quote> = Array<Quote>()
        var authorOfTheQuote = Person()
        
//I check that a quote with the same text does not exist in the same folder

        //I start by taking all the quotes in the folder
        for aFolder in folder{
            if(aFolder.id == parentFolder){
             theFolder = aFolder
            }
        }
        theQuotesInTheFolder = theFolder.myQuote!.toArray()
//        if there is already a quotation with the same text I throw an exception
        for aQuote in theQuotesInTheFolder {
            if(aQuote.text == text){
                throw QuoteInFolder.alreadyExist
            }
        }
//        I create a newAuthor if not already exist
        authorOfTheQuote = createAuthor(authorName: authorName)
// Now I create the quote
        var newQuote:Quote = Quote()
        newQuote.setQuote(text: text, author: authorOfTheQuote, parentFolder: theFolder, tagList: tagList)
        for aTag in tagList {
            aTag.quotes?.adding(newQuote) //da verificare
        }
        CoreDataManager.shared.createQuote(quoteToSave: newQuote)
        CoreDataManager.shared.updateTag()
        
        
    }
///createAuthor create and return an Author that already exist or a newAuthor
    mutating func createAuthor(authorName:String)->Person{
        var newAuthor:Person? = nil
        for anAuthor in person{
            if(anAuthor.name == authorName){
                newAuthor = anAuthor
            }
        }
        if (newAuthor == nil){
            newAuthor = Person()
            newAuthor?.name = authorName
            person.append(newAuthor!)
            CoreDataManager.shared.createPerson(personToSave: newAuthor!)
        }
        return newAuthor!
        
    }
    mutating func deleteQuote(id:UUID){
        var indexOfQuoteToDelete:Int? = nil
        
        for indexOfAQuote in 0..<quote.count{
            if(quote[indexOfAQuote].id == id){
                indexOfQuoteToDelete = indexOfAQuote
            }
        }
        quote.remove(at: indexOfQuoteToDelete!)
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
//extension Quote{
//    func setQuote(text:String,authorName:String,parentFolder:UUID,tagList:Array<Tag>){
//        self.text = text
//        self.author = authorName
//        self.parentFolder = parentFolder
//        self.tag
//    }
//}
extension Quote{
    func setQuote(text:String,author:Person,parentFolder:Folder,tagList:Array<Tag>){
        self.text = text
        self.author = author
        self.parentFolder = parentFolder
        self.tag = NSSet(array: tagList)
    }
}

