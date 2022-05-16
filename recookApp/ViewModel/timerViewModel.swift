//
//  timerViewModel.swift
//  recookApp
//
//  Created by Jessica Wienadi on 10/05/22.
//

import Foundation
import Combine

class timerViewModel: ObservableObject{
    let timeSec: Int
    @Published var timeRemaining : Int
    @Published var timer: Timer.TimerPublisher = Timer.publish(every: 1, on: .main, in: .common)
    @Published var connectedTimer: Cancellable? = nil
    
    
    
    
    
    init(timeMin: Int){
        self.timeRemaining = timeMin * 60
        self.timeSec = timeMin * 60
    }
    
    func secToTime(time: Int) -> String{
        //convert to sec dulu
            let sec = time % 60
            let fullmenit = time / 60
            let hour = fullmenit / 60
            let min = fullmenit % 60
            
        return String(format: "%02i:%02i:%02i",hour,min,sec)
    }
    
    
    func instantiateTimer() {
        self.timer = Timer.publish(every: 1, on: .main, in: .common)
        self.connectedTimer = self.timer.connect()
        return
    }
    
    func cancelTimer() {
        self.connectedTimer?.cancel()
        return
    }
    
    func resetCounter() {
        self.timeRemaining = timeSec
        return
    }
    
    func restartTimer() {
        self.timeRemaining = timeSec
        self.cancelTimer()
        self.instantiateTimer()
        return
    }
    
}
