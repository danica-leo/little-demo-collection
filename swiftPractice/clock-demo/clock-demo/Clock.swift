//
//  Clock.swift
//  clock-demo
//
//  Created by leonine on 2024/5/8.
//

import SwiftUI

struct Clock: View {
    @State private var currentTime = Date()
    @State private var recoredTime:Date?
    @State private var timerSeconds = 25 * 60
    @State private var timer:Timer?
    
    var startTime = Date()
    
    var body: some View {
        let timer = Timer.publish(every:1 , on: .main, in: .common).autoconnect()
      
        
        return VStack{
            Text(currentTimeFormatted(self.currentTime))
                .onReceive(timer) { _ in
                    self.currentTime = Date()
                }
                .padding()
            
            Button("开始"){
                handleStartTimer()
            }
            .padding()
            
            Text(timerFormatted(self.timerSeconds))
            
            if let recoredTime = recoredTime {
                Text("历史记录：\(currentTimeFormatted(recoredTime))")
            }
        }
       
        
    }
    
    func currentTimeFormatted(_ time:Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: time)
    }
    
    func timerFormatted(_ seconds:Int) -> String{
        let minutes =  seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d",minutes,seconds)
    }
    
    func handleStartTimer(){
        timer = Timer.scheduledTimer(withTimeInterval:1,repeats:true){_ in
            if self.timerSeconds > 0 {
                self.timerSeconds -= 1
            } else {
                self.timer?.invalidate()
            }
        }
    }
}

#Preview {
    Clock()
}
