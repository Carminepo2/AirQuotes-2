//
//  QuoteListRowView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 13/02/22.
//

import SwiftUI

struct QuoteListRowView: View {
    
    let quote: Quote?
    
    private var quoteText: String {
        quote?.text ?? Settings.DefaultName
    }
    
    private var quoteAuthor: String {
        quote?.author?.name ?? Settings.DefaultName
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(quoteText)
                .lineLimit(2)
                .padding(.bottom, 2)
            
            Text("- \(quoteAuthor)")
                .font(.subheadline)
                .foregroundColor(Color(uiColor: .systemGray2))
          
        }
        .padding(.vertical)
        .font(.system(.title2, design: .serif)) //Font new york
        
    }
}

struct QuoteListRowView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            QuoteListRowView(quote: nil)
            QuoteListRowView(quote: nil)
            QuoteListRowView(quote: nil)
            QuoteListRowView(quote: nil)
        }
        
        List {
            QuoteListRowView(quote: nil)
            QuoteListRowView(quote: nil)
            QuoteListRowView(quote: nil)
            QuoteListRowView(quote: nil)
        }
        .preferredColorScheme(.dark)
    }
}
