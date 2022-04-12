//
//  CollectionItemView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 02/02/22.
//

import SwiftUI

struct CollectionItemView: View {
    @EnvironmentObject var store: StoreAirQuotes
    
    @State private var isShowingSheet = false
    
    let collection: Folder?
    
    private var collectionName: String {
        collection?.name ?? Settings.DefaultName
    }
    
    private var collectionColor: Color {
        collection?.color != nil ? Color(collection!.color!) : Settings.DefaultColor
    }
    
    private var collectionIcon: String {
        collection?.icon ?? Settings.DefaultIcon
    }
    
    var body: some View {
        VStack {
            NavigationLink {
                QuotesListView(quotes: store.getAllQuotesInFolder(idFolder: collection?.id ?? UUID()))
                    .navigationTitle(collection?.name ?? Settings.DefaultName)
            } label: {
                CollectionItemRectView(
                    color: collectionColor,
                    systemName: collectionIcon
                )
            }
            
            HStack {
                Text(collectionName)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
                
                Spacer()
                
                Button(action: { isShowingSheet = true }) {
                    Image(systemName: "ellipsis")
                }
            }
            .actionSheet(isPresented: $isShowingSheet) {
                ActionSheet(
                    title: Text(""),
                    buttons:[
//                        .default(Text("Edit"), action: editCollection),
                        .destructive(Text("Delete"),
                                     action: deleteCollection),
                        .cancel()
                    ]
                )}
        }
    }
    
    // MARK: - Functions
    
    func deleteCollection() {
        if let id = collection?.id {
            store.removeFolder(id: id)
        }
    }
    
//    func editCollection() {
//        if let id = collection?.id {
//            //TODO
//        }
//    }
}


struct CollectionItemRectView: View {
    @Environment(\.colorScheme) var colorScheme
    
    let color: Color
    let systemName: String
    
    var body: some View {
        let shadowColorOpacity = colorScheme == .dark ? Settings.ShadowColorOpacityDarkMode : Settings.ShadowColorOpacityLightMode
        
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: Settings.CornerRadius)
                    .fill(color)
                    .aspectRatio(1/1, contentMode: .fit)
                    .shadow(color: color.opacity(shadowColorOpacity), radius: Settings.ShadowRadius)
                Image(systemName: systemName)
                    .foregroundStyle(.tertiary)
                    .font(Font.system(size: size(thatFits: geometry.size)))
            }
        }
        .aspectRatio(contentMode: .fit)
        
    }
    
    private func size(thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) * Settings.CollectionIconScaleFactor
    }
}


struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        HStack(spacing: 20) {
            CollectionItemView(collection: nil)
            CollectionItemView(collection: nil)
        }
        .padding()
        VStack {
            HStack(spacing: 20) {
                CollectionItemView(collection: nil)
                CollectionItemView(collection: nil)
            }
            HStack(spacing: 20) {
                CollectionItemView(collection: nil)
                CollectionItemView(collection: nil)
            }
        }
        .preferredColorScheme(.dark)
    }
}
