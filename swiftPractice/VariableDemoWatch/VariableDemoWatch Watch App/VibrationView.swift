//
//  VibrationView.swift
//  VariableDemoWatch Watch App
//
//  Created by leonine on 2024/5/17.
//

import SwiftUI
import WatchKit

struct VibrationView: View {
    @State private var isVibrating = false
    @State private var timer: Timer?

    var body: some View {
        VStack {
            Button(action: {
                isVibrating.toggle()
                if isVibrating {
                    startVibration()
                } else {
                    stopVibration()
                }
            }) {
                Text(isVibrating ? "停止震动" : "开始震动")
                    .padding()
                    .background(isVibrating ? Color.red : Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }

    func startVibration() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            WKInterfaceDevice.current().play(.notification)
        }
    }

    func stopVibration() {
        timer?.invalidate()
        timer = nil
    }
}

struct VibrationView_Previews: PreviewProvider {
    static var previews: some View {
        VibrationView()
    }
}

