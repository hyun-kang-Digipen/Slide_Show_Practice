//
//  Slide.swift
//  Slide
//
//  Created by 강현 on 2022/11/21.
//

import Foundation

struct Intro<IdText> where IdText: Equatable {
    
    private(set) var texts: Array<Page>
    
    
    init(numberOfPages: Int, textOfPage: (Int) -> IdText) {
        texts = []
        
        for index in 0..<numberOfPages {
            let tx = textOfPage(index)
            texts.append(Page(id: index, text: tx))
        }
    }
    
    struct Page: Identifiable{
        
        var id: Int
        var text: IdText

    }
}



//var shapes: [Shape] = [
//    .init(id: 1, shape: RoundedRectangle(cornerRadius: 20))
//    .init(id: 2, shape: RoundedRectangle(cornerRadius: 20))
//    .init(id: 3, shape: RoundedRectangle(cornerRadius: 20))
//]

//var intros: [Intro] = [
//    .init(imageName: "Image 1", title: "Relax")
//    .init(imageName: "Image 2", title: "Care")
//    .init(imageName: "Image 3", title: "Mood Dairy")
//]
