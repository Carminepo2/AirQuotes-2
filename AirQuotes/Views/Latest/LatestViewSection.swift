//
//  LatestViewSection.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 31/01/22.
//

import SwiftUI

struct LatestViewSection<ContentView: View, ButtonView: View>: View {
    let title: String
    
    @ViewBuilder let content: ContentView
    let button: ButtonView?

    init(_ title: String, @ViewBuilder content: () -> ContentView, @ViewBuilder button: () -> ButtonView? = { nil }) {
        self.title = title
        self.content = content()
        self.button = button()
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
                button
            }
            Divider()
                .padding(.vertical, -10)
            content
        }
        .padding(.horizontal)
        
    }
}

extension LatestViewSection where ButtonView == EmptyView {
  init(_ title: String, @ViewBuilder content: () -> ContentView) {
      self.init(title, content: content, button: { EmptyView() })
  }
}

struct LatestViewSection_Previews: PreviewProvider {
    static var previews: some View {
        LatestViewSection("Test") {
            Text("Test")
        } button: {
            Button("Hello") {
                print("Hello")
            }
        }
    }
}
