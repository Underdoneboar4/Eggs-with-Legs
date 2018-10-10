//
//  Egg.swift
//  Eggs with Legs
//
//  Created by 90309776 on 10/7/18.
//  Copyright © 2018 Egg Beater. All rights reserved.
//

import SpriteKit
import Foundation

/*
 The main parent class for all subclasses for Egg
 Contains all atributes that all eggs must have and functions that
 all eggs will be able to use.
 
 Most eggs created will be created through a subclass of this Egg class
 
 */

class Egg {
    
    var sprite: SKSpriteNode
    var speed: Int
    var animationCount: Int
    var health: Int
    var animateType: Int
    
    //ANIMATIION VARIABLES
    var runAnimateAction: SKAction!
    var deathAnimateAction: SKAction!
    var animateAction: SKAction!
    
    var eggRunningTextures: [SKTexture]!
    var eggDeathTextures: [SKTexture]!
    var eggKickingTextures: [SKTexture]!

    
    init(sprite: SKSpriteNode) {
        self.sprite = sprite
        self.speed = 10
        self.health = 10
        self.animateType = 0
        self.animationCount = 0
        
        
//        let actualY = random(min: 0 - (self.sprite.scene.size.height) / 2 + self.sprite.size.height, max: 300)
//        self.sprite.position = CGPoint(x: (0 - self.sprite.size.width), y: actualY)
        //GameScene.addChild(self.sprite)
        //self.sprite.addChild(self.sprite)
        //self.sprite.run(self.animateAction, withKey: "run")
        //GameScene.eggArray.append(self)
        //self.sprite.scene.siz
        
        /*
         Gives every Egg type physics properties
        */
        self.sprite.physicsBody = SKPhysicsBody(rectangleOf: self.sprite.size) // 1
        self.sprite.physicsBody?.isDynamic = true // 2
        self.sprite.physicsBody?.affectedByGravity = false
        self.sprite.physicsBody?.categoryBitMask = GameScene.PhysicsCategory.egg // 3
        self.sprite.physicsBody?.contactTestBitMask = GameScene.PhysicsCategory.fence // 4
        self.sprite.physicsBody?.collisionBitMask = GameScene.PhysicsCategory.fence // 5
    }
    
    func move() {
        self.sprite.position.x += CGFloat(self.speed)
    }
    
    //animate and deathAnamation should be overriden by their subclasses when called
    //These are place holder functions so Swift stays happy
    func animate() {
        print("i dont have anyhting to animate")
    }
    
    func deathAnimation() {
        print("i dont have anyhting to animate")
    }
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
}