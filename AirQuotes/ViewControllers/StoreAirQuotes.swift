//
//  StoreAirQuotes.swift
//  AirQuotes
//
//  Created by riccardo ruocco on 31/01/22.
//

import Foundation
import SwiftUI

class StoreAirQuotes: ObservableObject {
    @Published private var model: ModelAirQuotes
    static let shared = StoreAirQuotes()
    
    
    private init() {
        model = ModelAirQuotes()
    }
    ///getAllTags returns all the tags
    func getAllTags() -> Array<Tag> {
        model.tag
    }
    /// createTag create a newTag in the app
    func createTag(name:String,color:String) throws {
        try model.createTag(name: name, color: color)
    }
    ///removeTag remove a specific tag from the sistem
    func removeTag(id:UUID){
        model.removeTag(id: id)
    }
    /// createFolder creates a new folder if one with the same name does not already exist
    func createFolder(folderName:String,folderIcon:String,folderColor:String) throws{
        try model.createFolder(folderName:folderName,folderIcon:folderIcon,folderColor:folderColor) 
    }
    ///removeFolder remove a specific folder from the sistem
    func removeFolder(id:UUID){
        model.removeFolder(id: id)
    }
    ///createQuote creates a unique quote within the same folder
    func createQuote(text:String,authorName:String,parentFolder:Folder?,tagList:Array<Tag>) throws{
        try model.createQuote(text: text, authorName: authorName, parentFolder: parentFolder?.id, tagList: tagList)
    }
    ///deleteQuote delete an existing quote
    func deleteQuote(id:UUID){
        model.deleteQuote(id: id)
    }
    ///updateQuote set an existing quote with new value
    func updateQuote(id:UUID,text:String,authorName:String,tagList:Array<Tag>){
        model.updateQuote(id: id, text: text, authorName: authorName, tagList: tagList)
    }
    ///getAllFolders returns all the folders
    func getAllFolders() ->Array<Folder> {
        return model.folder
    }
    ///getAllQuotesInFolder returns all the quote in a specific folder
    func getAllQuotesInFolder(idFolder:UUID)->Array<Quote>{
        let theFolderWhichContainTheQuotes = model.getFolder(idFolder: idFolder)
        let theQuotesToReturn:Array<Quote> = theFolderWhichContainTheQuotes.myQuote!.toArray()
        return theQuotesToReturn
    }
    ///addQuoteToFavorites add an existing quote to the favorites
    func addQuoteToFavorites(idQuote:UUID){
        model.addQuoteToFavorites(idQuote: idQuote)
    }
    ///removeQuoteFromFavorites remove an existing quote from the favorites
    func removeQuoteFromFavorites(idQuote:UUID){
        model.removeQuoteFromFavorites(idQuote: idQuote)
    }
    ///getAllQuotes returns all the quotes
    func getAllQuotes()->Array<Quote>{
        return model.quote
    }
    ///searchBy Author returns all the quote with a specific tag
    func searchByTag(idTag:UUID)->Array<Quote>{
        let listaTag = model.tag
        var indexOfTheTag:Int? = nil
        for tagIndex in 0..<listaTag.count{
            if(listaTag[tagIndex].id == idTag){
                indexOfTheTag = tagIndex
            }
        }
        return listaTag[indexOfTheTag!].quotes!.toArray()
    }
    ///searchBy Author returns all the quote associated to a specific author
    func searchByAuthor(idAuthor:UUID)->Array<Quote>{
        let listaAuthor = model.person
        var indexOfTheAuthor:Int? = nil
        for authorIndex in 0..<listaAuthor.count{
            if(listaAuthor[authorIndex].id == idAuthor){
               indexOfTheAuthor = authorIndex
            }
        }
        return listaAuthor[indexOfTheAuthor!].quotes!.toArray()
    }
    ///getFavorites returns all the favorites
    func getFavorites()->Array<Quote>{
        var favorites:Array<Quote> = Array<Quote>()
        let allTheQuote:Array<Quote> = model.quote
        
        for aQuote in allTheQuote{
            if(aQuote.isFavorite == true){
                favorites.append(aQuote)
            }
        }
        
        return favorites
    }
    ///getLatesQuotes returns the last five quotes created
    func getLatestQuotes()->Array<Quote>{
        var latestQuote:Array<Quote> = Array<Quote>()
        let allTheQuote:Array<Quote> = model.quote
        for quoteIndex in allTheQuote.count..<(allTheQuote.count-5){
            latestQuote.append(allTheQuote[quoteIndex])
        }
        return latestQuote
    }
}
