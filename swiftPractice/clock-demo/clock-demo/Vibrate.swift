//
//  vibrate.swift
//  clock-demo
//
//  Created by leonine on 2024/5/9.
//

import SwiftUI
#if os(iOS)
import UIKit
#endif

struct Vibrate: View {
    @State private var isVibrating = false
    #if os(iOS)
    @State private var feedbackGenerator :UIImpactFeedbackGenerator?
    #endif
    var body: some View {
        Button( isVibrating ? "停止震动":"开始震动" ) {
      
            if isVibrating {
                print("停止震动")
#if os(iOS)
                feedbackGenerator?.impactOccurred()
                feedbackGenerator = nil
#endif
            }  else{
                print("开始震动")
#if os(iOS)
                feedbackGenerator = UIImpactFeedbackGenerator(style:.heavy)
                feedbackGenerator?.prepare()
                feedbackGenerator?.impactOccurred()
                feedbackGenerator?.prepare()
#endif
            }
            
            isVibrating = !isVibrating
            
        }
        .buttonStyle(.bordered)
    }
}

#Preview {
    Vibrate()
}
