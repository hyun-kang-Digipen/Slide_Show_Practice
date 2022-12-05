//
//  ContentView.swift
//  Slide
//
//  Created by 강현 on 2022/11/21.
//

import SwiftUI

struct ContentView: View {
    private let slide = IntroViewModel()
    var body: some View {
        IntroView(slideView: slide)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
