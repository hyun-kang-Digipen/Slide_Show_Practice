//
//  IntroViewModel.swift
//  Slide
//
//  Created by 강현 on 2022/11/21.
//

import Foundation

class IntroViewModel: ObservableObject {
    
    private static var str = ["a" , "b" , "c"]
    
    private static func createModel() -> Intro<String> {
        Intro<String>(numberOfPages: 3) { index in
            IntroViewModel.str[index]
        }
    }
    
    var shapeArray: Array<Intro<String>.Page> {
        return model.texts
    }
    
    @Published private var model: Intro<String> = createModel()

}
