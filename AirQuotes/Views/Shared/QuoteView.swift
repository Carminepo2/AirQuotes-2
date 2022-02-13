//
//  QuoteView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 13/02/22.
//

import SwiftUI

struct QuoteView: View {
    let quote: Quote?
    
    private var quoteText: String {
        quote?.text ?? Settings.DefaultName
    }
    
    var body: some View {
        VStack {
            Text(quoteText)
        }
        .navigationTitle(quoteText)
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(quote: nil)
    }
}
