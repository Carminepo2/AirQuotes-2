//
//  TagView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 02/02/22.
//

import SwiftUI

struct TagView: View {
    
    let color : Color
    let title : String
     
    var body: some View {
        
        Text(title.truncate(length: 20))
            .foregroundStyle(.secondary)
            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
            .background(RoundedRectangle(cornerRadius: 20).fill(color))
            .lineLimit(1)
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(color: Color("TagGreen"), title: "Example")
    }
}
