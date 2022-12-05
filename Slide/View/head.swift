//
//  head.swift
//  Slide
//
//  Created by 강현 on 2022/11/28.
//

import SwiftUI
import SpriteKit

class GameScene: SKScene {
    
    var player: SKSpriteNode!
    
    private var playerAtlas: SKTextureAtlas {
        return SKTextureAtlas(named: "MoveSprite")
    }
    
    private var playerIdleTextures: [SKTexture] {
        return [
            playerAtlas.textureNamed("head_1"),
            playerAtlas.textureNamed("head_2"),
            playerAtlas.textureNamed("head_3"),
            playerAtlas.textureNamed("head_4"),
            playerAtlas.textureNamed("head_5"),
            playerAtlas.textureNamed("head_6"),
            playerAtlas.textureNamed("head_7"),
            playerAtlas.textureNamed("head_8"),
            playerAtlas.textureNamed("head_9")
        ]
    }

    private var playerTexture: SKTexture {
        return playerAtlas.textureNamed("player")
    }

    
    private func setupPlayer() {
        player = SKSpriteNode(texture: playerTexture, size: CGSize(width: 70, height: 46))
        player.position = CGPoint(x: frame.width/2, y: frame.height/2)
        
        addChild(player)
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = .clear
        self.setupPlayer()
        self.startIdleAnimation()
    }
    
    func startIdleAnimation() {
        let idleAnimation = SKAction.animate(with: playerIdleTextures, timePerFrame: 0.1)
        
        player.run(SKAction.repeatForever(idleAnimation), withKey: "playerIdleAnimation")
    }
}
