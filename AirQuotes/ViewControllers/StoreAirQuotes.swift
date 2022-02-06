//
//  StoreAirQuotes.swift
//  AirQuotes
//
//  Created by riccardo ruocco on 31/01/22.
//

import Foundation
import SwiftUI

class StoreAirQuotes: ObservableObject {
    @Published var model: ModelAirQuotes
    static let shared = StoreAirQuotes()
    
    
    private init() {
        model = ModelAirQuotes()
    }
    
    func createTag(name:String,color:String){
        
    }
    func removeTag(id:UUID){
        
    }
    func createFolder(folderName:String){
        
    }
    func removeFolder(id:UUID){
        
    }
    func createQuote(text:String,authorName:String,parentFolder:UUID,tagList:Array<Tag>){
        
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
