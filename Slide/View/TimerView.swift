//
//  TimerView.swift
//  Slide
//
//  Created by 강현 on 2022/11/30.
//

import SwiftUI

struct TimerView: View {
    @StateObject var data = TimerData()
    @State var animationRange: [Int] = []
    
    var font: Font = .largeTitle
    var weight: Font.Weight = .regular
    
    var body: some View {
        ZStack{
            SelectTimerScreen()
            TimerScreen()
        }
    }
    
    @ViewBuilder
    func TimerScreen() -> some View {
        if data.IsTimerUp {
            HStack(spacing: 10) {
                ForEach(0..<animationRange.count, id: \.self) { index in
                    Text("9")
                        .font(font)
                        .fontWeight(weight)
                        .opacity(0)
                    //.frame(width: 120, height: 100)
                    //.foregroundColor(.orange)
//                    .background {
//                        RoundedRectangle(cornerRadius: 30)
//                    }
                    .overlay {
                        GeometryReader { proxy in
                            let size = proxy.size
                            
                            VStack(spacing: 0) {
                                ForEach(0...9, id: \.self) { number in
                                    Text("\(number)")
                                        .font(font)
                                        .fontWeight(weight)
                                        .frame(width: size.width, height: size.height, alignment: .center)
                                }
                            }
                            .offset(y: -CGFloat(animationRange[index]) * size.height)
                        }
                        .clipped()
                    }
                }
            }
            .onAppear {
                animationRange = Array(repeating: 0, count: "\(data.selectedTime)".count)
                updateValue()
            }
            .onChange(of: data.selectedTime) { newValue in
                updateValue()
            }
            .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect(), perform: { _ in
                
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
    
    func updateValue() {
        let stringValue = "\(data.selectedTime))"
        
        for (index, value) in zip(0..<animationRange.count, stringValue){
            var fraction = Double(index) * 0.15
            fraction = (fraction > 0.5 ? 0.5 : fraction)
            
            withAnimation(.interactiveSpring(response: 0.8, dampingFraction: 1 + fraction, blendDuration: 1 + fraction)) {
                animationRange[index] = (String(value) as NSString).integerValue
            }
        }
        
        
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
