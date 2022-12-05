//
//  SlideApp.swift
//  Slide
//
//  Created by 강현 on 2022/11/21.
//

import SwiftUI

@main
struct SlideApp: App {
    private let slide = IntroViewModel()
    var body: some Scene {
        WindowGroup {
            IntroView(slideView: slide)
        }
    }
}
