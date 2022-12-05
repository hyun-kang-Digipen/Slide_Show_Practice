//
//  TimerViewModel.swift
//  Slide
//
//  Created by 강현 on 2022/11/30.
//

import Foundation

class TimerData: ObservableObject{
    @Published var time: Int = 0
    @Published var selectedTime: Int = 0
    
    @Published var IsTimerUp: Bool = false
}
