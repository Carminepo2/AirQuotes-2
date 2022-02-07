//
//  ModelAirQuotes.swift
//  AirQuotes
//
//  Created by riccardo ruocco on 31/01/22.
//

import Foundation


struct ModelAirQuotes{
    var person:[Person] = []
    var quote:[Quote] = []
    var folder:[Folder] = []
    var tag:[Tag] = []
    
    init(){
        
    }
    // setModel set default data for the app
    func setModel(){
        
    }
    
    mutating func createTag(name:String,color:String){
        
    }
    mutating func removeTag(id:UUID){
        
    }
    mutating func createFolder(folderName:String){
        
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
