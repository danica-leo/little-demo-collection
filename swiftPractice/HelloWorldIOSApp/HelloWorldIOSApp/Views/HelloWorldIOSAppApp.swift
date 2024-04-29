//
//  File.swift
//  HelloWorldIOSApp
//
//  Created by leonine on 2024/4/9.
//

import SwiftUI

@main
struct HelloWorldIOSAppApp: App {
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
