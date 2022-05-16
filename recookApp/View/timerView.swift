//
//  timerView.swift
//  recookApp
//
//  Created by Jessica Wienadi on 10/05/22.
//

import SwiftUI
import Combine

struct timerView: View {
    
    @StateObject var viewModel: timerViewModel
    @State var isPaused: Bool = false
    
    
    
//    init(timeMin: Int){
//        self.viewModel = timerViewModel(timeMin: timeMin)
//    }
    
    var body: some View {
        VStack {
            Text(viewModel.secToTime(time: viewModel.timeRemaining))
                .font(.largeTitle)
            HStack{
                Button(action:{
                    if isPaused == true{
                        viewModel.cancelTimer()
                        isPaused.toggle()
                    } else if isPaused == false {
                        viewModel.instantiateTimer()
                        isPaused.toggle()
                    }

                }){
                Image(systemName: isPaused ? "pause" : "play")
                            .font(.system(size: 25, weight: .semibold))
                            .foregroundColor(isPaused ? Color(UIColor.red) : .accentColor)
//                            .padding()
//                            .padding()
                }
                .padding(13)
                .background(Color.accentColor.opacity(0.2))
                .clipShape(Circle())
//                .cornerRadius()
//                .background(.gray)
                
//
                Button(action: {
                    viewModel.restartTimer()
                }) {
                    Text("Restart")
                        .foregroundColor(.secondary)
                        .font(.headline.bold())
                }
                .padding(13)
                .background(Color.accentColor.opacity(0.2))
                .cornerRadius(25)

            }
//            .onAppear {
//                self.instantiateTimer()
//            }
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
    }
    
    
}
struct timerView_Previews: PreviewProvider {
    static var previews: some View {
        timerView(viewModel: timerViewModel(timeMin: 1))
    }
}
