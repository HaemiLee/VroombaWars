//
//  Multiplayer.swift
//  Vroomba Wars
//
//  Created by Haemi Lee on 3/25/21.
//

import Foundation
import SpriteKit

class Multiplayer: SKScene{
    var Rvroomba = SKSpriteNode()
    var RvroombaFrames: [SKTexture] = []
    
    var customBackgroundColor = UIColor(red: 0.84, green: 1.0, blue: 0.86, alpha: 1)
    
    override func didMove(to view: SKView){
        self.backgroundColor = customBackgroundColor
        
        rotateVroombaGIF()
        animateRotatingVroomba()
        
        let txt1 = SKLabelNode(fontNamed: "PressStart2P-Regular")
        txt1.text = "DOUBLE PLAYER"
        txt1.fontSize = 25
        txt1.fontColor = SKColor.black
        txt1.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.75)
        txt1.zPosition = 5
                self.addChild(txt1)
        
        let txt2 = SKLabelNode(fontNamed: "PressStart2P-Regular")
        txt2.text = "COMING SOON..."
        txt2.fontSize = 25
        txt2.fontColor = SKColor.black
        txt2.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.2)
        txt2.zPosition = 5
        self.addChild(txt2)
        
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
        
        
        
    }
    
    //https://www.raywenderlich.com/144-spritekit-animations-and-texture-atlases-in-swift
    func rotateVroombaGIF(){
        let RvroombaAtlas = SKTextureAtlas(named: "rotatingVroomba")
        var RvroombaArray: [SKTexture] = []
        
        let numImages = RvroombaAtlas.textureNames.count
        for i in 0...numImages-1{
            let name = "frame_\(i)_delay-0.1s.png"
            RvroombaArray.append(RvroombaAtlas.textureNamed(name))
        }
        RvroombaFrames = RvroombaArray
        
        let firstFrameTexture = RvroombaFrames[0]
        Rvroomba = SKSpriteNode(texture: firstFrameTexture)
        Rvroomba.scaleTo(screenWidthPercentage: 0.25)
        Rvroomba.zPosition = 2
        Rvroomba.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.5)
        addChild(Rvroomba)
        
        
    }
    
    func animateRotatingVroomba() {
        Rvroomba.run(SKAction.repeatForever(
        SKAction.animate(with: RvroombaFrames,
                         timePerFrame: 0.1,
                         resize: false,
                         restore: true)),
        withKey:"Rvroomba")
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
