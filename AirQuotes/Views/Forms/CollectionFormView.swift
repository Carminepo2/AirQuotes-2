//
//  CollectionFormView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 02/02/22.
//

import SwiftUI

struct CollectionFormView: View {
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: Form States
    @State private var collectionNameTest = ""
    @State private var chosenColor = "TagRed"
    @State private var chosenIcon: String = "quote.opening"


    var body: some View {
        NavigationView {
            Form {
                Section {
                    VStack {
                        CollectionItemRectView(name: collectionNameTest, color: Color(chosenColor), systemName: chosenIcon)
                            .padding()
                        TextField("Collection Name", text: $collectionNameTest)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal)
                    }
                    .padding(.vertical)
                }
                
                Section(header: Text("Color")) {
                    ColorSelectionView(chosenColor: $chosenColor)
                }
                
                Section(header: Text("Icon")) {
                    IconSelectionView(chosenIcon: $chosenIcon)
                }
            }
            .navigationTitle("New Collection")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: CancelButton(), trailing: DoneButton())
        }
    }
    
    //MARK: - Navigation Bar Buttons
    
    @ViewBuilder
    private func CancelButton() -> some View {
        Button("Cancel") {
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    @ViewBuilder
    private func DoneButton() -> some View {
        Button("Done") {
            presentationMode.wrappedValue.dismiss()
        }
        .disabled(collectionNameTest.isEmpty)
    }
}

struct CollectionFormView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionFormView()
    }
}
