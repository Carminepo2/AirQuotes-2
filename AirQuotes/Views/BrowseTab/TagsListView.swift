//
//  TagsListView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 10/02/22.
//

import SwiftUI

struct TagsListView: View {
    @State private var searchText = ""
    @EnvironmentObject var Controller: StoreAirQuotes
    


    private var tags: Array<Tag> {
        if searchText.isEmpty {
            return Controller.getAllTags()
        }
        return Controller.getAllTags()
            .filter { ($0.title ?? Settings.DefaultName).contains(searchText) }
    }

    var body: some View {
        Group {
            if tags.isEmpty {
                Text(Settings.EmptyStateMessage)
                    .foregroundStyle(.tertiary)
                    .vCenter()
            } else {
                List(tags, id: \.self) { tag in
                    // MARK: - Tag Navigation Link
                    NavigationLink {
                        QuotesListView(quotes: Controller.searchByTag(idTag: tag.id))
                            .navigationTitle(tag.title ?? Settings.DefaultName)
                    } label: {
                        TagListRowView(tag: tag)
                    }

                }
            }
        }
        .navigationTitle("Tags")
        .searchable(text: $searchText)
    }
}


fileprivate struct TagListRowView: View {
    
    let tag: Tag?
    
    private var tagTitle: String {
        tag?.title ?? Settings.DefaultName
    }
    
    private var tagColor: Color {
        tag?.color != nil ? Color(tag!.color!) : Settings.DefaultColor
    }

    
    var body: some View {
        HStack {
            Circle()
                .fill(tagColor)
                .frame(width: 8, height: 8)
            
            Text(tagTitle)
                .lineLimit(1)
        }
    }
}


struct TagsListView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            TagListRowView(tag: nil)
            TagListRowView(tag: nil)
            TagListRowView(tag: nil)
        }
        
        List {
            TagListRowView(tag: nil)
            TagListRowView(tag: nil)
            TagListRowView(tag: nil)
        }
        .preferredColorScheme(.dark)
    }
}
