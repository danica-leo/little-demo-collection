//
//  clock_demo_watch.swift
//  clock-demo-watch
//
//  Created by leonine on 2024/5/9.
//

import AppIntents

struct clock_demo_watch: AppIntent {
    static var title: LocalizedStringResource = "clock-demo-watch"
    
    func perform() async throws -> some IntentResult {
        return .result()
    }
}
