//
//  QuoteFormView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 01/02/22.
//

import SwiftUI

struct QuoteFormView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var Controller: StoreAirQuotes
        
    var collections: Array<Folder> {
        return Controller.getAllFolders()
    }
    
    var tags: Array<Tag> {
        return Controller.getAllTags()
    }
    
    @State private var showTagForm = false
    @State private var showCollectionForm = false
    
    // MARK: Form States
    @State private var quoteText = ""
    @State private var authorText = ""
    @State private var chosenTags: [Tag] = []
    @State private var chosenCollection: Folder? = nil
    
    let quote: Quote?

    init(quote: Quote? = nil) {
        if let quote = quote {
            self.quote = quote
            self._quoteText = State(wrappedValue: quote.text!)
            self._authorText = State(wrappedValue: quote.author!.name!)
            if let parentFolder = quote.parentFolder {
                self._chosenCollection = State(wrappedValue: parentFolder)
            }
            if let tags = quote.tag {
                self._chosenTags = State(wrappedValue: Array(_immutableCocoaArray: tags))
            }

        } else {
            self.quote = nil
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                // MARK: - Quote and Author Fields
                Section(header: Text("Quote")) {
                    TextEditor(text: $quoteText)
                        .autofocus()
                        .accessibilityIdentifier("quoteField")

                    TextField(text: $authorText, prompt: Text("Author")) {
                        Text("Author")
                    }
                }
                
                // MARK: - Tags Fields
                Section(header: Text("Tags")) {
                    
                    //MARK: Add Tag Button
                    NavigationLink {
                        List {
                            ForEach(tags, id: \.self) { tag in
                                MultipleSelectionRowView(label: tag.title ?? Settings.DefaultName, data: tag, isSelected: checkIfTagSelected(tag), action: selectionRowTapped)
                            }
                        }
                        .listStyle(GroupedListStyle())
                        .navigationTitle("Choose tag")
                    } label: {
                        Text("Choose tag")
                    }
                    .disabled(tags.isEmpty)
                    
                    //MARK: Tag Preview
                    if chosenTags.count > 0 {
                        ScrollView(.horizontal) {
                            HStack(spacing: 10) {
                                ForEach(chosenTags, id: \.self) {
                                    TagView(tag: $0)
                                }
                            }
                            .padding(.vertical)
                        }
                    }
                    
                    //MARK: New Tag Button
                    NewItemButton("New Tag", systemName: "plus.circle", action: newTagButtonTapped)
                }
                
                // MARK: - Collection Fields
                // TODO: In edit quote the Collection section is not visible for now
                if quote == nil {
                    Section(header: Text("Collection")) {
                        //MARK: Choose Collection Button
                        Picker("Choose collection", selection: $chosenCollection) {
                            ForEach(collections, id: \.self) {
                                Text($0.name ?? Settings.DefaultName)
                                    .tag($0 as Folder?)
                            }
                        }
                        .disabled(collections.isEmpty)
                        
                        //MARK: Create New Collection Button
                        NewItemButton("New Collection", systemName: "folder.badge.plus", action: newCollectionButtonTapped)
                            .accessibilityIdentifier("newCollection")

                    }
                }
                
            }
            .navigationTitle("New Quote")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: CancelButton(), trailing: DoneButton()
                .accessibilityIdentifier("quoteDoneButton")
                .accessibilityAddTraits([.isButton])
            )
            
            // MARK: Modals
            .sheet(isPresented: $showTagForm, content: { TagFormView(onSubmitSuccess: newTagCreated) })
            .sheet(isPresented: $showCollectionForm, content: { CollectionFormView(onSubmitSuccess: newCollectionCreated) })
        }
    }
    
    //MARK: - Navigation Bar Buttons
    
    @ViewBuilder
    private func CancelButton() -> some View {
        Button("Cancel") { presentationMode.wrappedValue.dismiss() }
    }
    
    @ViewBuilder
    private func DoneButton() -> some View {
        Button("Done", action: handleSubmit)
            .disabled(quoteText.isEmpty || chosenCollection == nil)
    }
    
    //MARK: - Functions
    
    private func newTagButtonTapped() { showTagForm = true }
    private func newCollectionButtonTapped() { showCollectionForm = true }
    
    private func checkIfTagSelected(_ tag: Tag) -> Bool {
        return chosenTags.contains(tag)
    }
    
    private func newTagCreated(tag: Tag) { self.chosenTags.append(tag) }
    private func newCollectionCreated(folder: Folder) { self.chosenCollection = folder }
    
    private func selectionRowTapped(_ selectedTag: Tag) {
        if checkIfTagSelected(selectedTag) {
            if let index = chosenTags.firstIndex(of: selectedTag) {
                chosenTags.remove(at: index)
            }
        } else {
            chosenTags.append(selectedTag)
        }
    }
    
    private func handleSubmit() {
        do {
            if let quote = self.quote {
                Controller.updateQuote(id: quote.id!, text: quoteText, authorName: authorText, tagList: chosenTags)
            } else {
                try Controller.createQuote(text: quoteText, authorName: authorText, parentFolder: chosenCollection!.id!, tagList: chosenTags)
            }
        } catch {
            print(error)
            // TODO: Error handling
            return
        }
        presentationMode.wrappedValue.dismiss()
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
            .environmentObject(StoreAirQuotes.shared)
        
        QuoteFormView()
            .environmentObject(StoreAirQuotes.shared)
            .preferredColorScheme(.dark)
    }
}
