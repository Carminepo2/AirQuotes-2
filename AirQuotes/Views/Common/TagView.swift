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
            .foregroundStyle(.primary)
            .lineLimit(1)
            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
            .background(RoundedRectangle(cornerRadius: 20).fill(color))
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            TagView(color: Color("TagGreen"), title: "Example")
            TagView(color: Color("TagPink"), title: "Example")
            TagView(color: Color("TagRed"), title: "Example")
            TagView(color: Color("TagBlue"), title: "Example")
        }
        
        HStack {
            TagView(color: Color("TagGreen"), title: "Example")
            TagView(color: Color("TagPink"), title: "Example")
            TagView(color: Color("TagRed"), title: "Example")
            TagView(color: Color("TagBlue"), title: "Example")
        }
        .preferredColorScheme(.dark)
    }
}
