//
//  QuoteView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 13/02/22.
//

import SwiftUI

struct QuoteView: View {
    @EnvironmentObject var store: StoreAirQuotes
    @State private var showActionSheet: Bool = false
    
    let quote: Quote
    
    var body: some View {
        ScrollView {
            VStack {
                HStack{
                    Image("QuoteStart")
                    Spacer()
                }
                
                Text("\(quote.text ?? Settings.DefaultName)")
                    .font(.system(.title2, design: .serif))
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.primary)
                    .lineLimit(100)
                    .padding(.horizontal)
                
                HStack{
                    Spacer()
                    Image("QuoteEnd")
                    
                }
                
                
                Text("- \(quote.author?.name ?? Settings.DefaultName)")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
                
                if quote.tag?.count ?? 0 > 0 {
                    
                    TagCloudView(tags: Array(quote.tag! as! Set<Tag>))
                        .padding(.horizontal)
                        .padding(.top)
                    
                }
            }
            .toolbar {
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    Button{
                        
                    }label:{
                        
                        if quote.isFavorite {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                                .padding()
                                .onTapGesture {
                                    store.removeQuoteFromFavorites(idQuote: quote.id)
                                }
                        } else{
                            Image(systemName: "heart")
                                .foregroundColor(.blue)
                                .padding()
                                .onTapGesture {
                                    store.addQuoteToFavorites(idQuote: quote.id)
                                }
                        }
                    }
                    Button{
                        
                    }label:{
                        
                        Image(systemName: "ellipsis.circle")
                            .foregroundColor(.blue)
                            .onTapGesture {
                                showActionSheet = true
                            }
                    }
                }
            }
            .actionSheet(isPresented: $showActionSheet, content: {
                ActionSheet(title: Text("Choose"), buttons: [
//                    .default(Text("Edit")) {
//                        showModal.toggle()
//                    },
                    .destructive(Text("Delete")) {
                        store.deleteQuote(id: quote.id)
                    },
                    .cancel()
                ])
            })
//            .sheet(isPresented: $showModal) {
//                QuoteForm(showModal: $showModal, quote: quote)
//            }
        }
    }
}



struct TagCloudView: View {
    var tags: [Tag]
    
    @State private var totalHeight
    = CGFloat.infinity   // << variant for VStack
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(minHeight: 200) // << variant for VStack
    }
    
    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return ZStack(alignment: .topLeading) {
            ForEach(self.tags) { tag in
                TagView(tag: tag)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width)
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if tag == self.tags.last! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if tag == self.tags.last! {
                            height = 0 // last item
                        }
                        return result
                    })
            }
        }.background(viewHeightReader($totalHeight))
    }
    
    
    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}

