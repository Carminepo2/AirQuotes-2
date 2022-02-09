//
//  ModelException.swift
//  AirQuotes
//
//  Created by riccardo ruocco on 07/02/22.
//

import Foundation

enum FolderName:Error{
    case alreadyExist
}

enum TagName:Error{
    case alreadyExist
}

enum QuoteInFolder:Error{
    case alreadyExist
}
