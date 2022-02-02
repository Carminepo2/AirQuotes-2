//
//  TagFormView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 02/02/22.
//

import SwiftUI

struct TagFormView: View {
    @Environment(\.presentationMode) var presentationMode

    // MARK: Form States
    @State private var tagName: String = ""
    @State private var chosenColor = "TagRed"
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name")) {
                    TextField("Eg: happy, motivational...", text: $tagName)
                }
                
                Section(header: Text("Color")) {
                    HStack{
                        ColorButtonView(colorName: "TagRed", chosenColor: $chosenColor)
                        ColorButtonView(colorName: "TagGreen", chosenColor: $chosenColor)
                        ColorButtonView(colorName: "TagPink", chosenColor: $chosenColor)
                        ColorButtonView(colorName: "TagBlue", chosenColor: $chosenColor)
                    }
                    .padding(.horizontal)
                    .padding(.horizontal)
                }
            }
            .navigationTitle("New tag")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: CancelButton(), trailing: DoneButton())

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

