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
    mutating func createTag(name:String,color:String) throws -> Tag {
        //      check that a folder with that name does not already exist
        for aTag in tag {
            if(aTag.title == name){
                throw TagName.alreadyExist
            }
        }
        let newTag:Tag = Tag(context: CoreDataManager.shared.persistentContainer.viewContext)
        newTag.id = UUID()
        newTag.title = name
        newTag.color = color
        tag.append(newTag)
        CoreDataManager.shared.createTag(tagToSave: newTag)
        return newTag
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
    mutating func createFolder(folderName:String,folderIcon:String,folderColor:String) throws -> Folder {
        //      check that a folder with that name does not already exist
        for aFolder in folder{
            if(aFolder.name == folderName){
                throw FolderName.alreadyExist
            }
        }
        let newFolder:Folder = Folder(context: CoreDataManager.shared.persistentContainer.viewContext)
        
        newFolder.id = UUID()
        newFolder.name = folderName
        newFolder.icon = folderIcon
        newFolder.color = folderColor
        
        folder.append(newFolder)
        CoreDataManager.shared.createFolder(folderToSave: newFolder)
        return newFolder
    }

    ///removeFolder remove a specific folder from the sistem
    mutating func removeFolder(id:UUID) {
        
        var indexOfFolderToDelete:Int? = nil
        var quotesInTheFolder:[Quote]
        var folderToDelete:Folder
        for indexOfFolder in 0..<folder.count{
            if(folder[indexOfFolder].id == id){
                indexOfFolderToDelete = indexOfFolder
            }
        }
        folderToDelete = folder.remove(at: indexOfFolderToDelete!)
        if folderToDelete.myQuote != nil{
            quotesInTheFolder = folderToDelete.myQuote!.toArray()
            for eachQuote in quotesInTheFolder{
                deleteQuote(id: eachQuote.id!)
            }
        }
        CoreDataManager.shared.deleteFolder(folderToDelete: folderToDelete)
    }
    
    

    ///the user creates a unique quote within the same folder
    mutating func createQuote(text:String,authorName:String,parentFolder:UUID,tagList:Array<Tag>) throws{
//        var theFolder: Folder = Folder(context: CoreDataManager.shared.persistentContainer.viewContext)
        var indexOfTheFolder:Int? = nil
        var theQuotesInTheFolder:Array<Quote> = Array<Quote>()
        var authorOfTheQuote = Person(context: CoreDataManager.shared.persistentContainer.viewContext)
        
        //I check that a quote with the same text does not exist in the same folder
        
        //I start by taking all the quotes in the folder
        for index in 0..<folder.count{
            if(folder[index].id == parentFolder){
                indexOfTheFolder = index
            }
        }
        theQuotesInTheFolder = folder[indexOfTheFolder!].myQuote!.toArray()
        //        if there is already a quotation with the same text I throw an exception
        for aQuote in theQuotesInTheFolder {
            if(aQuote.text == text){
                throw QuoteInFolder.alreadyExist
            }
        }
        //        I create a newAuthor if not already exist
        authorOfTheQuote = createAuthor(authorName: authorName)
        // Now I create the quote
        let newQuote:Quote = Quote(context: CoreDataManager.shared.persistentContainer.viewContext)
        newQuote.setQuote(text: text, author: authorOfTheQuote, parentFolder: folder[indexOfTheFolder!], tagList: tagList)
        for aTag in tagList {
            aTag.quotes?.adding(newQuote) //da verificare
        }
        
        quote.append(newQuote)
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
            newAuthor = Person(context: CoreDataManager.shared.persistentContainer.viewContext)
            newAuthor?.id = UUID()
            newAuthor?.name = authorName
            person.append(newAuthor!)
            CoreDataManager.shared.createPerson(personToSave: newAuthor!)
        }
        return newAuthor!
        
    }
    /// deleteQuote delete an existing quote
    mutating func deleteQuote(id:UUID){
        var indexOfQuoteToDelete:Int? = nil
        var quoteToDelete:Quote
        for indexOfAQuote in 0..<quote.count{
            if(quote[indexOfAQuote].id == id){
                indexOfQuoteToDelete = indexOfAQuote
            }
        }
        quoteToDelete = quote.remove(at: indexOfQuoteToDelete!)
        quoteToDelete.parentFolder = nil
        CoreDataManager.shared.deleteQuote(quoteToDelete: quoteToDelete)
    }
    /// updateQuote add new values to an existing quote
    mutating func updateQuote(id:UUID,text:String,authorName:String,tagList:Array<Tag>){
        var quoteToUpdate:Quote = Quote()
        for aQuote in quote{
            if(aQuote.id == id){
                quoteToUpdate = aQuote
            }
        }
        let newAuthor:Person = createAuthor(authorName: authorName)
        quoteToUpdate.setQuote(text: text, author: newAuthor, parentFolder: quoteToUpdate.parentFolder!, tagList: tagList)
        CoreDataManager.shared.updateQuote()
        
    }
    /// return an existing folder
    func getFolder(idFolder:UUID)->Folder{
        var folderIndexToReturn:Int? = nil
        
        for folderIndex in 0..<folder.count{
            if(folder[folderIndex].id == idFolder){
                folderIndexToReturn = folderIndex
            }
        }
        return folder[folderIndexToReturn!]
    }
    
    func getFolders()->Array<Folder>{
        return self.folder
    }
    
    
    ///addQuoteToFavorites add a specific quote to the favorites
    mutating func addQuoteToFavorites(idQuote:UUID){
        
        var indexQuoteToAddToFavorites:Int? = nil
        for index in 0..<quote.count{
            if(quote[index].id == idQuote){
                indexQuoteToAddToFavorites = index
            }
        }
        quote[indexQuoteToAddToFavorites!].isFavorite = true
    }
    ///removeQuoteFromFavorites remove a specific quote from the favorites
    mutating func removeQuoteFromFavorites(idQuote:UUID){
        var indexQuoteToRemoveFromFavorites:Int? = nil
        for index in 0..<quote.count{
            if(quote[index].id == idQuote){
                indexQuoteToRemoveFromFavorites = index
            }
        }
        quote[indexQuoteToRemoveFromFavorites!].isFavorite = false
    }
    func getQuotes()->Array<Quote>{
        return self.quote
    }
    func getQuoteById(id:UUID)->Quote{
        var quoteToReturn:Quote? = nil
        for aQuote in quote{
            if(aQuote.id == id){
                quoteToReturn = aQuote
            }
        }
        return quoteToReturn!
    }
    
}
extension Quote{
    func setQuote(text:String,author:Person,parentFolder:Folder,tagList:Array<Tag>){
        self.id = UUID()
        self.text = text
        self.author = author
        self.parentFolder = parentFolder
        self.tag = NSSet(array: tagList)
    }
}

