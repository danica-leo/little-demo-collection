import SwiftUI
import CoreHaptics

struct ContentView: View {
    @State private var isVibrating = false
    @State private var engine: CHHapticEngine?
    @State private var continuousPlayer: CHHapticAdvancedPatternPlayer?

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
        .onAppear(perform: prepareHaptics)
    }

    func prepareHaptics() {
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("Haptic engine Error: \(error.localizedDescription)")
        }
    }

    func startVibration() {
        guard let engine = engine else { return }

        do {
            let pattern = try createVibrationPattern()
            let player = try engine.makeAdvancedPlayer(with: pattern)
            player.loopEnabled = true
            continuousPlayer = player
            try player.start(atTime: CHHapticTimeImmediate)
        } catch {
            print("Failed to start vibration: \(error.localizedDescription)")
        }
    }

    func stopVibration() {
        do {
            try continuousPlayer?.stop(atTime: CHHapticTimeImmediate)
        } catch {
            print("Failed to stop vibration: \(error.localizedDescription)")
        }
        isVibrating = false
    }

    func createVibrationPattern() throws -> CHHapticPattern {
        let events = [
            CHHapticEvent(eventType: .hapticContinuous, parameters: [
                CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.25),
                CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.25)
            ], relativeTime: 0, duration: 0.4),
            CHHapticEvent(eventType: .hapticContinuous, parameters: [
                CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0),
                CHHapticEventParameter(parameterID: .hapticSharpness, value: 1.0)
            ], relativeTime: 0.4, duration: 0.1),
            CHHapticEvent(eventType: .hapticContinuous, parameters: [
                CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.75),
                CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.75)
            ], relativeTime: 0.5, duration: 0.4),
            CHHapticEvent(eventType: .hapticContinuous, parameters: [
                CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0),
                CHHapticEventParameter(parameterID: .hapticSharpness, value: 1.0)
            ], relativeTime: 0.9, duration: 0.1),
        ]

        let pattern = try CHHapticPattern(events: events, parameters: [])
        return pattern
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
