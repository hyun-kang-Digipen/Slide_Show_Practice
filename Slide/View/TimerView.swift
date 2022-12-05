//
//  TimerView.swift
//  Slide
//
//  Created by 강현 on 2022/11/30.
//

import SwiftUI

struct TimerView: View {
    @StateObject var data = TimerData()
        
    var body: some View {
        ZStack{
            SelectTimerScreen()
            TimerScreen()
        }
    }
    
    @ViewBuilder
    func TimerScreen() -> some View {
        if data.IsTimerUp {
            Text("\(data.selectedTime)")
                .font(.system(size: 50, weight: .heavy))
                .frame(width: 120, height: 100)
                .foregroundColor(.orange)
                .background {
                    RoundedRectangle(cornerRadius: 30)
                }
                .onReceive(Timer.publish(every:1, on: .main, in: .common).autoconnect(), perform: { _ in
                    if data.selectedTime != 0 {
                        data.selectedTime -= 1
                    }
                })
                .onTapGesture{
                    data.IsTimerUp.toggle()
                    data.selectedTime = data.time
                }
        }
    }
    
    @ViewBuilder
    func SelectTimerScreen() -> some View {
        HStack(spacing: 10) {
            ForEach(1...3, id: \.self) { index in
                let time = index * 100
                
                if !data.IsTimerUp {
                    Text("\(time)")
                        .font(.system(size: 50, weight: .heavy))
                        .frame(width: 120, height: 100)
                        .foregroundColor(.orange)
                        .background {
                            RoundedRectangle(cornerRadius: 30)
                        }
                        .onTapGesture{
                            data.time = time
                            data.selectedTime = time
                            data.IsTimerUp.toggle()
                        }
                }
            }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
