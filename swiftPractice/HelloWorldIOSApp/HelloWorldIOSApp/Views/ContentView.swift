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
// finish Section 4
// finish Section 5
// finish Section 6
// finish Section 7

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .frame(height:300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom,-130)
            
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                HStack {
                    Text("Joshua Tree National Park")
                    Spacer()
                    Text("California")
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Desciptive text goes here")
            }
            
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}