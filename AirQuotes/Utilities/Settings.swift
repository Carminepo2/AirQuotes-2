//
//  Settings.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 31/01/22.
//

import Foundation
import SwiftUI

struct Settings {
    static let CornerRadius = 8.0
    static let LatestQuotesHeight = 280.0
    static let LatestCollectionsHeight = 230.0

    static let CollectionHSpacing = 15.0
    static let CollectionVSpacing = 20.0

    static let CollectionIconSize = 32.0
    static let CollectionIconScaleFactor = 0.5
    static let ShadowColorOpacityLightMode = 0.7
    static let ShadowColorOpacityDarkMode = 0.3
    static let ShadowRadius = 10.0
    
    static let CollectionViewsPerRow = 2
    
    static let SelectionFormButtonSize = 50.0
    
    static let CollectionIcons = [
        "quote.opening",
        "heart.fill",
        "music.note",
        "gamecontroller.fill",
        "person.fill",
        "face.smiling.fill",
        "lightbulb.fill"
    ]
    
    static let DefaultName = "Unknown"
    static let DefaultColor = Color(uiColor: .systemGray5)
    static let DefaultIcon = "questionmark"
    static let EmptyStateMessage = "Empty"
    static let EmptyStateSliderQuote = "Write your first quote!"
}

