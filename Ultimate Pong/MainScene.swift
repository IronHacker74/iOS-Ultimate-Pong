//
//  MainScene.swift
//  Ultimate Pong
//
//  Created by Andrew Masters on 9/16/17.
//  Copyright © 2017 Andrew Masters. All rights reserved.
//

import SpriteKit

class MainScene: SKScene, SKPhysicsContactDelegate {

    let backgroundImg = SKSpriteNode(imageNamed: "HomeScreen BG")
    let smokeParticle = SKSpriteNode(fileNamed: "Smoke.sks")
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) error")
    }
    
    override init(size: CGSize){
        super.init(size: size)
    }
    
    override func didMove(to view: SKView) {
        
        backgroundImg.position = CGPoint(x: size.width / 2, y: size.height / 2)
        smokeParticle?.position = CGPoint(x: size.width / 2, y: size.height * 0.8)
        
        addChild(backgroundImg)
        addChild(smokeParticle!)
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsWorld.contactDelegate = self
    }
    
}
