//
//  QuotesListView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 13/02/22.
//

import SwiftUI

struct QuotesListView: View {
    let quotes: Array<Quote>
    @State private var searchText: String = ""
    
    private var filteredQuotes: Array<Quote> {
        if searchText.isEmpty {
            return quotes
        }
        return quotes
            .filter { ($0.text ?? Settings.DefaultName).contains(searchText) }
    }
    
    
    var body: some View {
        Group {
            // MARK: Empty State
            if filteredQuotes.isEmpty {
                Text(Settings.EmptyStateMessage)
                    .foregroundStyle(.tertiary)
                    .vCenter()
            } else {
                // MARK: Quotes List
                List(quotes, id: \.self) { quote in
                    NavigationLink {
                        QuoteView(quote: quote)
                    } label: {
                        QuoteListRowView(quote: quote)
                    }
                }
            }
        }
        .searchable(text: $searchText)

    }
}

struct QuotesListView_Previews: PreviewProvider {
    static var previews: some View {
        QuotesListView(quotes: [])
    }
}
