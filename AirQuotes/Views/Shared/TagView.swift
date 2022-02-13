//
//  TagView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 02/02/22.
//

import SwiftUI

struct TagView: View {
    
    let tag: Tag?
    
    private var tagTitle: String {
        tag?.title?.truncate(length: 20) ?? Settings.DefaultName
    }
    
    private var tagColor: Color {
        tag?.color != nil ? Color(tag!.color!) : Settings.DefaultColor
    }
     
    var body: some View {
        Text(tagTitle)
            .foregroundStyle(.primary)
            .lineLimit(1)
            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
            .background(RoundedRectangle(cornerRadius: 20).fill(tagColor))
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            TagView(tag: nil)
            TagView(tag: nil)
            TagView(tag: nil)
            TagView(tag: nil)
        }
        
        HStack {
            TagView(tag: nil)
            TagView(tag: nil)
            TagView(tag: nil)
            TagView(tag: nil)
        }
        .preferredColorScheme(.dark)
    }
}
