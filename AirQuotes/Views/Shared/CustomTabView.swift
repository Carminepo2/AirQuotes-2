//
//  CustomTabView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 08/04/22.
//

import SwiftUI

enum Tab: String {
    case latest = "Latest"
    case browse = "Browse"
}

struct CustomTabView: View {
    @Binding var selectedTab: Tab
    @State private var showQuoteForm = false
    @Environment(\.colorScheme) var colorScheme

    
    var body: some View {
        
        HStack {
            Spacer()
            tabButton(.latest, icon: "text.quote")
            Spacer()
            Button(action: addQuotePressed) {
                Circle()
                    .fill(colorScheme == .dark ? Color.white : Color.black)
                    .frame(width: 70, height: 70)
                    .shadow(radius: 2)
                    .overlay {
                        Image(systemName: "plus")
                            .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                            .font(.system(size: 30))
                    }
                    .offset(y: -32)
            }
            
            Spacer()
            tabButton(.browse, icon: "books.vertical.fill")
            Spacer()
        }
        .padding(.bottom)
        .background(
            .regularMaterial,
            in: RoundedRectangle(cornerRadius: Settings.CornerRadius, style: .continuous)
        )
        // Modal
        .sheet(isPresented: $showQuoteForm, content: { QuoteFormView() })


    }
    
    
    
    @ViewBuilder
    func tabButton(_ tab: Tab, icon: String) -> some View {
        Button {
            selectedTab = tab
        } label: {
            VStack {
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                Text(tab.rawValue)
                    .font(.caption2)
            }
            .foregroundColor(selectedTab == tab ? .primary : .secondary)
        }
    }
    
    // MARK: - Functions
    
    func addQuotePressed() { showQuoteForm = true }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView(selectedTab: .constant(.browse))
    }
}
