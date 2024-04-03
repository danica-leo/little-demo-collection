//
//  CircleImage.swift
//  HelloWorldIOSApp
//
//  Created by leonine on 2024/4/3.
// 

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtlerock")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 299.0, height: 299.0)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay {
                Circle().stroke(.white,lineWidth: 4)
            }
            .shadow(radius:7)
    }
}

#Preview {
    CircleImage()
}
