//
//  TagFormView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 02/02/22.
//

import SwiftUI

struct TagFormView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var Controller: StoreAirQuotes

    // MARK: Form States
    @State private var tagName: String = ""
    @State private var chosenColor = "TagRed"
    
    var onSubmitSuccess: ((_ tag: Tag) -> Void)?
    
    init(onSubmitSuccess: ((_ folder: Tag) -> Void)? = nil) {
        self.onSubmitSuccess = onSubmitSuccess
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name")) {
                    TextField("Eg: happy, motivational...", text: $tagName)
                        .autofocus()
                }
                
                Section(header: Text("Color")) {
                    ColorSelectionView(chosenColor: $chosenColor)
                }
            }
            .navigationTitle("New tag")
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
            do {
                let newTag = try Controller.createTag(name: tagName, color: chosenColor)
                if let onSubmitSuccess = onSubmitSuccess {
                    onSubmitSuccess(newTag)
                }
            }
            catch {
                print("già esiste")
                // TODO: Error handling
                return
            }
            presentationMode.wrappedValue.dismiss()
        }
        .disabled(tagName.isEmpty)
    }
}


struct TagFormView_Previews: PreviewProvider {
    static var previews: some View {
        TagFormView()
        TagFormView()
            .preferredColorScheme(.dark)
    }
}

