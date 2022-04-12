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
    @EnvironmentObject var store: StoreAirQuotes
    
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
                List {
                    
                    ForEach(quotes, id: \.self) { quote in
                        NavigationLink {
                            QuoteView(quote: quote)
                        } label: {
                            QuoteListRowView(quote: quote)
                        }
                    }
                    .onDelete(perform: onDelete)
                    
                }
            }
        }
        .searchable(text: $searchText)

    }
    
    //MARK: - Functions
    func onDelete(indexes: IndexSet) {
        for i in indexes {
            if let quoteId = quotes[i].id {
                store.deleteQuote(id: quoteId)
            }
        }
    }
}

struct QuotesListView_Previews: PreviewProvider {
    static var previews: some View {
        QuotesListView(quotes: [])
    }
}
