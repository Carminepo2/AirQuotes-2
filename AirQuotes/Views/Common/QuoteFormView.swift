//
//  QuoteFormView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 01/02/22.
//

import SwiftUI


struct QuoteFormView: View {
    
    @State private var showTagForm = false
    
    // MARK: Form States
    @State private var quoteText = ""
    @State private var authorText = ""
    @State private var chosenTags: [String] = []
    @State private var selectedCollection: String? = nil

    
    var body: some View {
        Form {
            // MARK: - Quote and Author Fields
            Section(header: Text("Quote & Author")) {
                TextField(text: $quoteText, prompt: Text("Quote")) {
                    Text("Quote")
                }
                TextField(text: $authorText, prompt: Text("Author")) {
                    Text("Author")
                }
            }
            
            // MARK: - Tags Fields
            Section(header: Text("Tags")) {
                Button("Create a new tag", action: openTagFormModal)
                
                NavigationLink {
                    List {
                        MultipleSelectionRowView(title: "Unknown", isSelected: false, action: selectionRowTapped)
                        MultipleSelectionRowView(title: "Unknown", isSelected: true, action: selectionRowTapped)
                        MultipleSelectionRowView(title: "Unknown", isSelected: true, action: selectionRowTapped)
                    }
                    .listStyle(InsetListStyle())
                } label: {
                    Text("Choose tag")
                }
            }
        }
        .background(Color("BackgroundColor"))
    }
    
    //MARK: - Functions
    
    func openTagFormModal() { showTagForm = true }
    func selectionRowTapped() { }
}

struct QuoteFormView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteFormView()
    }
}
