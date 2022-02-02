//
//  QuoteFormView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 01/02/22.
//

import SwiftUI

let TEST_TAGS = ["Love", "War", "Peace"]


struct QuoteFormView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showTagForm = false
    
    // MARK: Form States
    @State private var quoteText = ""
    @State private var authorText = ""
    @State private var chosenTags: [String] = []
    @State private var selectedCollection: String? = nil
    
    
    var body: some View {
        NavigationView {
            Form {
                // MARK: - Quote and Author Fields
                Section {
                    TextField(text: $quoteText, prompt: Text("Quote")) {
                        Text("Quote")
                    }
                    TextField(text: $authorText, prompt: Text("Author")) {
                        Text("Author")
                    }
                }
                
                // MARK: - Tags Fields
                Section(header: Text("Tags")) {
                    
                    //MARK: Create New Tag Button
                    NavigationLink {
                        List {
                            ForEach(TEST_TAGS, id: \.self) {
                                MultipleSelectionRowView(title: $0, isSelected: checkIfTagSelected($0), action: selectionRowTapped)
                            }
                        }
                        .listStyle(GroupedListStyle())
                        .navigationTitle("Choose tag")
                    } label: {
                        Text("Choose tag")
                    }
                    
                    //MARK: Tag Preview
                    if chosenTags.count > 0 {
                        ScrollView(.horizontal) {
                            HStack(spacing: 10) {
                                ForEach(chosenTags, id: \.self) {
                                    TagView(color: Color("TagBlue"), title: $0)
                                }
                            }
                            .padding(.vertical)
                        }
                    }
                    
                    //MARK: New Tag Button
                    NewItemButton("New Tag", systemName: "plus.circle", action: newTagButtonTapped)
                }
                
                // MARK: - Collection Fields
                Section(header: Text("Collection")) {
                    //MARK: Choose Collection Button
                    Picker("Choose collection", selection: $selectedCollection) {
                        ForEach(TEST_TAGS, id: \.self) {
                            Text($0).tag($0)
                        }
                    }
                    
                    //MARK: Create New Collection Button
                    NewItemButton("New Collection", systemName: "folder.badge.plus", action: {})
                }
            }
            .navigationTitle("New Quote")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: CancelButton(), trailing: DoneButton())
            .sheet(isPresented: $showTagForm, content: { TagFormView() })
        }
    }
    
    //MARK: - Navigation Bar Buttons
    
    @ViewBuilder
    func CancelButton() -> some View {
        Button("Cancel") {
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    @ViewBuilder
    func DoneButton() -> some View {
        Button("Done") {
            presentationMode.wrappedValue.dismiss()
        }
        .disabled(quoteText.isEmpty)
    }
    
    //MARK: - Functions

    func newTagButtonTapped() { showTagForm = true }
    
    func checkIfTagSelected(_ tag: String) -> Bool {
        return chosenTags.contains(tag)
    }
    
    func selectionRowTapped(_ selectedTag: String) {
        if checkIfTagSelected(selectedTag) {
            if let index = chosenTags.firstIndex(of: selectedTag) {
                chosenTags.remove(at: index)
            }
        } else {
            chosenTags.append(selectedTag)
        }
    }
}

fileprivate struct NewItemButton: View {
    let label: String
    let systemName: String
    let action: () -> Void
    
    init(_ label: String, systemName: String, action: @escaping () -> Void) {
        self.label = label
        self.systemName = systemName
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(label)
                Spacer()
                Image(systemName: systemName)
            }
        }
    }
    
}

struct QuoteFormView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteFormView()
        QuoteFormView()
            .preferredColorScheme(.dark)
    }
}
