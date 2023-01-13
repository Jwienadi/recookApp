//
//  timerView.swift
//  recookApp
//
//  Created by Jessica Wienadi on 10/05/22.
//

import SwiftUI
import Combine

//sound
import AVKit

struct timerView: View {
    
    @StateObject var viewModel: timerViewModel
    @State var isPaused: Bool = true
    
    //sound
    @State var audioPlayer: AVAudioPlayer!
    
    
    var body: some View {
        VStack {
            Text(viewModel.secToTime(time: viewModel.timeRemaining))
                .font(.largeTitle)
            if viewModel.timeRemaining==0{
                Text("Timer Done")
                    .foregroundColor(.green)
                    .font(.title.bold())
                    .onAppear(perform: {
                        isPaused.toggle()
                        //sound
                        audioPlayer.numberOfLoops = 1
                        self.audioPlayer.play()
                    })
            }
            HStack{
                Button(action:{
                    if isPaused == false{
                        viewModel.cancelTimer()
                        isPaused.toggle()
                    } else if isPaused == true {
                        viewModel.instantiateTimer()
                        isPaused.toggle()
                    }
                    
                }){
                    Image(systemName: isPaused ? "play" : "pause")
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundColor(isPaused ? .accentColor : Color(UIColor.red))
                }
                .padding(13)
                .background(Color.accentColor.opacity(0.2))
                .clipShape(Circle())
                Button(action: {
                    viewModel.restartTimer(isPaused: isPaused)
                }) {
                    Text("Restart")
                        .foregroundColor(.secondary)
                        .font(.headline.bold())
                }
                .padding(13)
                .background(Color.accentColor.opacity(0.2))
                .cornerRadius(25)
            }
            .onDisappear {
                viewModel.cancelTimer()
            }.onReceive(viewModel.timer) { _ in
                if viewModel.timeRemaining>0{
                    viewModel.timeRemaining -= 1
                } else {
                    viewModel.cancelTimer()
                }
            }
        }
        .padding()
        //sound
        .onAppear {
            let sound = Bundle.main.path(forResource: "timer", ofType: "wav")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
               }
        
    }
}
struct timerView_Previews: PreviewProvider {
    static var previews: some View {
        timerView(viewModel: timerViewModel(timeMin: 1))
    }
}
