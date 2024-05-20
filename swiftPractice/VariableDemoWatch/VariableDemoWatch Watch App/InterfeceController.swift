//
//  InterfeceController.swift
//  VariableDemoWatch Watch App
//
//  Created by leonine on 2024/5/17.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
    @IBOutlet weak var toggleButton: WKInterfaceButton!
    var isVibrating = false
    var timer: Timer?

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }

    @IBAction func toggleVibration() {
        isVibrating.toggle()
        if isVibrating {
            startVibration()
            toggleButton.setTitle("停止震动")
        } else {
            stopVibration()
            toggleButton.setTitle("开始震动")
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
