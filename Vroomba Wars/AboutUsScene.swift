//
//  AboutUsScene.swift
//  Vroomba Wars
//
//  Created by Haemi Lee on 3/15/21.
//

import Foundation
import SpriteKit

class AboutUsScene: SKScene{
    
    var haemi = SKSpriteNode()
    var haemiFrames: [SKTexture] = []
    
    var deka = SKSpriteNode()
    var dekaFrames: [SKTexture] = []
    
    var dylan = SKSpriteNode()
    var dylanFrames: [SKTexture] = []
    
    var customBackgroundColor = UIColor(red: 0.74, green: 0.80, blue: 1.0, alpha: 1)
    
    override func didMove(to view: SKView){
        
        self.backgroundColor = customBackgroundColor
        
        let green = SKSpriteNode(imageNamed: "greenRectangle")
        green.position = CGPoint(x: self.size.width*0.20, y: self.size.height*0.55)
        green.scaleTo(screenWidthPercentage: 0.20)
        green.zPosition = 1
        self.addChild(green)
        
        let pink = SKSpriteNode(imageNamed: "pinkRectangle")
        pink.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.55)
        pink.scaleTo(screenWidthPercentage: 0.20)
        pink.zPosition = 1
        self.addChild(pink)
        
        let yellow = SKSpriteNode(imageNamed: "yellowRectangle")
        yellow.position = CGPoint(x: self.size.width*0.8, y: self.size.height*0.55)
        yellow.scaleTo(screenWidthPercentage: 0.20)
        yellow.zPosition = 1
        self.addChild(yellow)
        
        let DYLAN = SKSpriteNode(imageNamed: "DYLAN")
        DYLAN.position = CGPoint(x: self.size.width*0.20, y: self.size.height*0.2)
        DYLAN.scaleTo(screenWidthPercentage: 0.20)
        DYLAN.zPosition = 1
        self.addChild(DYLAN)
        
        let HAEMI = SKSpriteNode(imageNamed: "HAEMI")
        HAEMI.position = CGPoint(x: self.size.width*0.50, y: self.size.height*0.2)
        HAEMI.scaleTo(screenWidthPercentage: 0.20)
        HAEMI.zPosition = 1
        self.addChild(HAEMI)
        
        let DEKA = SKSpriteNode(imageNamed: "DEKA")
        DEKA.position = CGPoint(x: self.size.width*0.80, y: self.size.height*0.2)
        DEKA.scaleTo(screenWidthPercentage: 0.18)
        DEKA.zPosition = 1
        self.addChild(DEKA)
        
        let BacktoMain = SKSpriteNode(imageNamed: "backmainmenutxt")
        BacktoMain.position = CGPoint(x: self.size.width*0.13, y: self.size.height*0.88)
        BacktoMain.scaleTo(screenWidthPercentage: 0.12)
        BacktoMain.zPosition = 2
        BacktoMain.name = "BacktoMain"
        self.addChild(BacktoMain)
        
        let BacktoMainButton = SKSpriteNode(imageNamed: "backmainmenubutton")
        BacktoMainButton.position = CGPoint(x: self.size.width*0.13, y: self.size.height*0.87)
        BacktoMainButton.scaleTo(screenWidthPercentage: 0.18)
        BacktoMainButton.zPosition = 1
        BacktoMainButton.name = "BacktoMainButton"
        self.addChild(BacktoMainButton)
        
        haemiGIF()
        animateHaemi()
        
        dekaGIF()
        animateDeka()

        dylanGIF()
        animateDylan()
        
      
    }
    
    //https://www.raywenderlich.com/144-spritekit-animations-and-texture-atlases-in-swift
    func haemiGIF(){
        let haemiAtlas = SKTextureAtlas(named: "haemi")
        var haemiArray: [SKTexture] = []
        
        let numImages = haemiAtlas.textureNames.count
        for i in 0...numImages-1{
            let name = "frame_\(i)_delay-0.1s.png"
            haemiArray.append(haemiAtlas.textureNamed(name))
        }
        haemiFrames = haemiArray
        
        let firstFrameTexture = haemiFrames[0]
        haemi = SKSpriteNode(texture: firstFrameTexture)
        haemi.scaleTo(screenWidthPercentage: 0.25)
        haemi.zPosition = 2
        haemi.position = CGPoint(x: self.size.width*0.50, y: self.size.height*0.5)
        addChild(haemi)
    }
    
    func animateHaemi() {
        haemi.run(SKAction.repeatForever(
        SKAction.animate(with: haemiFrames,
                         timePerFrame: 0.2,
                         resize: false,
                         restore: true)),
        withKey:"haemi")
    }
    
    func dekaGIF(){
        let dekaAtlas = SKTextureAtlas(named: "deka")
        var dekaArray: [SKTexture] = []
        
        let numImages = dekaAtlas.textureNames.count
        for i in 0...numImages-1{
            let name = "frame_\(i)_delay-0.1s.png"
            dekaArray.append(dekaAtlas.textureNamed(name))
        }
        dekaFrames = dekaArray
        
        let firstFrameTexture = dekaFrames[0]
        deka = SKSpriteNode(texture: firstFrameTexture)
        deka.scaleTo(screenWidthPercentage: 0.25)
        deka.zPosition = 2
        deka.position = CGPoint(x: self.size.width*0.80, y: self.size.height*0.5)
        addChild(deka)
    }
    
    func animateDeka() {
        deka.run(SKAction.repeatForever(
        SKAction.animate(with: dekaFrames,
                         timePerFrame: 0.2,
                         resize: false,
                         restore: true)),
        withKey:"deka")
    }
    
    func dylanGIF(){
        let dylanAtlas = SKTextureAtlas(named: "dylan")
        var dylanArray: [SKTexture] = []
        
        let numImages = dylanAtlas.textureNames.count
        for i in 0...numImages-1{
            let name = "frame_\(i)_delay-0.1s.png"
            dylanArray.append(dylanAtlas.textureNamed(name))
        }
        dylanFrames = dylanArray
        
        let firstFrameTexture = dylanFrames[0]
        dylan = SKSpriteNode(texture: firstFrameTexture)
        dylan.scaleTo(screenWidthPercentage: 0.25)
        dylan.zPosition = 2
        dylan.position = CGPoint(x: self.size.width*0.20, y: self.size.height*0.5)
        addChild(dylan)
    }
    
    func animateDylan() {
        dylan.run(SKAction.repeatForever(
        SKAction.animate(with: dylanFrames,
                         timePerFrame: 0.2,
                         resize: false,
                         restore: true)),
        withKey:"dylan")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{

            let pointOfTouch = touch.location(in: self)
            let nodeTapped = atPoint(pointOfTouch)

            if nodeTapped.name == "BacktoMain"{
                if(UserDefaults().bool(forKey: "sound") == true){
                    MusicPlayer.shared.playSoundEffect(soundEffect: "champagne_pop")
                }
                let sceneToMoveTo = MainMenuScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
        }
    }
    
}
