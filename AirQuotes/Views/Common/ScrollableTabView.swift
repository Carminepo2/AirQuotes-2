//
//  SegmentedScrollView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 01/02/22.
//

import SwiftUI

struct ScrollableTabView: View {
    let pages: [AnyView]
    let buttonLabels: [String]
    
    @Namespace var animation
    @Environment(\.isSearching) var isSearching

    @State private var selectedIndex = 0
    
    init<Views>(_ buttonLabels: [String], @ViewBuilder pages: @escaping () -> TupleView<Views>) {
        self.pages = pages().getViews
        self.buttonLabels = buttonLabels
    }
    
    var body: some View {
        VStack {
            // MARK: - Tab Buttons
            let columns: [GridItem] = Array(repeating: GridItem.init(.adaptive(minimum: 80)), count: buttonLabels.count)
            LazyVGrid(columns: columns) {
                ForEach(buttonLabels.indices) { index in
                    TabButtonView(label: buttonLabels[index], index: index, actualPageIndex: $selectedIndex, animation: animation)
                }
            }
            .padding(.horizontal)
            .padding(.top, isSearching ? 15 : 0)
            
            // MARK: - Tabs
            TabView(selection: $selectedIndex) {
                ForEach(pages.indices) { pages[$0].tag($0) }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
        .animation(.easeIn(duration: 0.2) ,value: selectedIndex)
        
    }
}


// MARK: - Tab Button View
fileprivate struct TabButtonView : View {
    let label: String
    let index: Int
    
    @Binding var actualPageIndex: Int
    var animation: Namespace.ID
    
    var isSelected: Bool {
        index == actualPageIndex
    }
    
    var body: some View {
        VStack {
            Text(label)
                .foregroundStyle(.primary)
                .font(.footnote)
                .onTapGesture(perform: handleTap)
            
            if isSelected {
                Divider()
                    .foregroundStyle(.primary)
                    .matchedGeometryEffect(id: "selectedTab", in: animation)
            } else {
                Divider()
                    .opacity(0)
            }
        }
    }
    
    // MARK: - Functions
    func handleTap() {
        actualPageIndex = index
    }
}


// !!! PREVIEW CRASH !!!

//struct SegmentedScrollView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScrollableTabView(["1", "2", "3"]) {
//            Text("test")
//            Text("test")
//            Text("test")
//        }
//
//        ScrollableTabView(["1", "2", "3"]) {
//            Text("test")
//            Text("test")
//            Text("test")
//        }
//        .preferredColorScheme(.dark)
//    }
//} 
