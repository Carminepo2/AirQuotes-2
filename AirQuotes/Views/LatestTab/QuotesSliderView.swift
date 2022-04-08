//
//  QuotesSliderView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 01/02/22.
//

import SwiftUI

struct QuoteSliderView: View {    
    @EnvironmentObject var Controller: StoreAirQuotes
    
      var latestQuotes: Array<Quote> {
          return Controller.getLatestQuotes()
    }
    var body: some View {
        if latestQuotes.count > 0 {
            TabView{
                ForEach(latestQuotes, id: \.self) { quote in
                    NavigationLink {
                        QuoteView(quote: quote)
                    } label: {
                        QuoteSliderItem(quote: quote)
                    }
                }
            }
            .frame(height: Settings.LatestQuotesHeight)
            .tabViewStyle(.page)
        } else {
            TabView{
                QuoteSliderItem(quote: nil)
                    .opacity(0.5)
            }
            .frame(height: Settings.LatestQuotesHeight)
            .tabViewStyle(.page)
        }
    }
}


fileprivate struct QuoteSliderItem: View {
    
    let quote: Quote?
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: Settings.CornerRadius)
                .foregroundStyle(.quaternary)
                .opacity(0.2)
            VStack {
                Text("\"\(quote?.text?.truncate(length: 120) ?? Settings.DefaultName)\"")
                    .font(.system(.title2, design: .serif))
                    .foregroundStyle(.primary)
                
                if let author = quote?.author {
                    Text("- \(author.name ?? Settings.DefaultName)")
                        .opacity(0.5)
                        .padding(.top, 1)
                }
            }
            .padding()
        }
        .padding(.horizontal)
    }
}


struct QuoteSliderView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteSliderView()
            .previewLayout(.fixed(width: 400, height: 300))
            .environmentObject(StoreAirQuotes.shared)
    }
}
