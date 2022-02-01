//
//  QuotesSliderView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 01/02/22.
//

import SwiftUI

struct QuoteSliderView: View {
    
    private let emptyState = "Write your first quote!"
    //    private let quotes = [Quote]()
    
    
    var body: some View {
        
        TabView {
            //            if quotes.count > 0 {
            //                ForEach(quotes) { quote in
            //                    NavigationLink {
            //                        ProgressView()
            //                    } label: {
            //                        QuoteSliderItem(text: (quote.text ?? "Unknown").truncate(length: 120), author: (quote.author ?? "Unknown").trunc(length: 16))
            //                    }
            //
            //                }
            //            } else {
            QuoteSliderItem(text: emptyState, author: nil)
                .opacity(0.5)
                .padding(.horizontal)

            QuoteSliderItem(text: emptyState, author: nil)
                .opacity(0.5)
                .padding(.horizontal)

            QuoteSliderItem(text: emptyState, author: nil)
                .opacity(0.5)
                .padding(.horizontal)
            //            }
        }
        .frame(height: Settings.LatestQuotesHeight)
        .tabViewStyle(.page)
    }
}


fileprivate struct QuoteSliderItem: View {
    
    let text: String
    let author: String?
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: Settings.CornerRadius)
                .foregroundStyle(.secondary)
                .opacity(0.2)
            VStack {
                Text("\"\(text)\"")
                    .font(.system(.title2, design: .serif))
                    .foregroundStyle(.primary)
                
                if let author = author {
                    Text("- \(author)")
                        .opacity(0.5)
                        .padding(.top, 1)
                }
            }
            .padding()
        }
    }
}


struct QuoteSliderView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteSliderView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
