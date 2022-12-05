//
//  SpriteTestView.swift
//  Slide
//
//  Created by 강현 on 2022/11/29.
//

import SwiftUI
import SpriteKit

class SpriteTestView: SKScene {
        override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      guard let touch = touches.first else { return }
      let location = touch.location(in: self)
    
      let box = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
      box.position = location
      box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
      addChild(box) // 오브젝트 뷰에 추가
    }
}
