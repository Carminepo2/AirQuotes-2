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
    /// createTag create a newTag in the app
    func createTag(name:String,color:String){
        model.createTag(name: name, color: color)
    }
    ///removeTag remove a specific tag from the sistem
    func removeTag(id:UUID){
        model.removeTag(id: id)
    }
    /// createFolder creates a new folder if one with the same name does not already exist
    func createFolder(folderName:String) throws{
        try model.createFolder(folderName: folderName)
    }
    ///removeFolder remove a specific folder from the sistem
    func removeFolder(id:UUID){
        model.removeFolder(id: id)
    }
    ///createQuote creates a unique quote within the same folder
    func createQuote(text:String,authorName:String,parentFolder:UUID,tagList:Array<Tag>) throws{
        try model.createQuote(text: text, authorName: authorName, parentFolder: parentFolder, tagList: tagList)
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
    func getAllQuotesInFolder(folder:UUID)->Array<Quote>{
        return []
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
    func searchByTag(tag:UUID){
        
    }
}
