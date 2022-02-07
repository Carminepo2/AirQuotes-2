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
    ///the user creates a unique quote within the same folder
    func createQuote(text:String,authorName:String,parentFolder:UUID,tagList:Array<Tag>) throws{
        try model.createQuote(text: text, authorName: authorName, parentFolder: parentFolder, tagList: tagList)
    }
    func deleteQuote(id:UUID){
        
    }
    func updateQuote(id:UUID,text:String,authorName:String,tagList:Array<Tag>){
        
    }
    func getAllFolders() ->Array<Folder> {
        
        return []
    }
    func getAllQuotesInFolder(folder:UUID)->Array<Quote>{
        return []
    }
    func addQuoteToFavorites(quote:UUID){
        
    }
    func removeQuoteFromFavorites(quoteToRemove:UUID){
        
    }
    func getAllQuotes()->Array<Quote>{
        return []
    }
    func searchByTag(tag:UUID){
        
    }
    
    
}
