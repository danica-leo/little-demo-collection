//
//  ContentView.swift
//  HelloWorldIOSApp
//
//  Created by leonine on 2024/4/3.
//
// Swift UI essentials - Chapter 1 - Creating and combining views
// finish Section 1
// finish Section 2
// finish Section 3
// Start Section 4

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Turtle Rock")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            HStack {
                Text("Joshua Tree National Park")
                    .font(.subheadline)
                Spacer()
                Text("California")
                    .font(.subheadline)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
