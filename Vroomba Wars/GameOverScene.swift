//
//  GameOverScene.swift
//  Vroomba Wars
//
//  Created by Haemi Lee on 3/29/21.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene{
    var Rvroomba = SKSpriteNode()
    var RvroombaFrames: [SKTexture] = []
    
    var customBackgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1)
//    var customBackgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
    
    override func didMove(to view: SKView){
        if UserDefaults().bool(forKey: "sound") == true{
            MusicPlayer.shared.startBackgroundMusic(backgroundMusicFileName:"menuMusic")
        }
        
        self.backgroundColor = customBackgroundColor
        
        rotateVroombaGIF()
        animateRotatingVroomba()
        
        let txt1 = SKLabelNode(fontNamed: "PressStart2P-Regular")
        txt1.text = "GAME OVER"
        txt1.fontSize = 30
        txt1.fontColor = SKColor.white
        txt1.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.75)
        txt1.zPosition = 5
        self.addChild(txt1)
        
        let restart = SKSpriteNode(imageNamed: "restartleveltxt")
        restart.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.23)
        restart.scaleTo(screenWidthPercentage: 0.25)
        restart.zPosition = 3
        restart.name = "restart"
        self.addChild(restart)
        
        let restartButton = SKSpriteNode(imageNamed: "restartlevelbutton")
        restartButton.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.23)
        restartButton.scaleTo(screenWidthPercentage: 0.3)
        restartButton.zPosition = 2
        self.addChild(restartButton)
        
        
        
        
        //backToLevels
        let backToLevels = SKSpriteNode(imageNamed: "backToLevels")
        backToLevels.position = CGPoint(x: self.size.width*0.13, y: self.size.height*0.88)
        backToLevels.scaleTo(screenWidthPercentage: 0.09)
        backToLevels.zPosition = 2
        backToLevels.name = "backToLevels"
        self.addChild(backToLevels)
        
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

            if nodeTapped.name == "backToLevels"{
                if(UserDefaults().bool(forKey: "sound") == true){
                    MusicPlayer.shared.playSoundEffect(soundEffect: "champagne_pop")
                }
                let sceneToMoveTo = LevelScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
            if nodeTapped.name == "restart"{
                if(UserDefaults().bool(forKey: "sound") == true){
                    MusicPlayer.shared.playSoundEffect(soundEffect: "champagne_pop")
                }
                if (UserDefaults().integer(forKey: "currlevel") == 1){
                    let sceneToMoveTo = Level1_GameScene(size: self.size)
                    sceneToMoveTo.scaleMode = self.scaleMode
                    let myTransition = SKTransition.fade(withDuration: 0.5)
                    self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                }
                if (UserDefaults().integer(forKey: "currlevel") == 2){
                    let sceneToMoveTo = Level2_GameScene(size: self.size)
                    sceneToMoveTo.scaleMode = self.scaleMode
                    let myTransition = SKTransition.fade(withDuration: 0.5)
                    self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                }
                if (UserDefaults().integer(forKey: "currlevel") == 3){
                    let sceneToMoveTo = Level3_GameScene(size: self.size)
                    sceneToMoveTo.scaleMode = self.scaleMode
                    let myTransition = SKTransition.fade(withDuration: 0.5)
                    self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                }
                if (UserDefaults().integer(forKey: "currlevel") == 4){
                    let sceneToMoveTo = Level4_GameScene(size: self.size)
                    sceneToMoveTo.scaleMode = self.scaleMode
                    let myTransition = SKTransition.fade(withDuration: 0.5)
                    self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                }
                if (UserDefaults().integer(forKey: "currlevel") == 5){
                    let sceneToMoveTo = Level5_GameScene(size: self.size)
                    sceneToMoveTo.scaleMode = self.scaleMode
                    let myTransition = SKTransition.fade(withDuration: 0.5)
                    self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                }
                if (UserDefaults().integer(forKey: "currlevel") == 6){
                    let sceneToMoveTo = Level6_GameScene(size: self.size)
                    sceneToMoveTo.scaleMode = self.scaleMode
                    let myTransition = SKTransition.fade(withDuration: 0.5)
                    self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                }
                if (UserDefaults().integer(forKey: "currlevel") == 7){
                    let sceneToMoveTo = Level7_GameScene(size: self.size)
                    sceneToMoveTo.scaleMode = self.scaleMode
                    let myTransition = SKTransition.fade(withDuration: 0.5)
                    self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                }
                if (UserDefaults().integer(forKey: "currlevel") == 8){
                    let sceneToMoveTo = Level8_GameScene(size: self.size)
                    sceneToMoveTo.scaleMode = self.scaleMode
                    let myTransition = SKTransition.fade(withDuration: 0.5)
                    self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                }
                if (UserDefaults().integer(forKey: "currlevel") == 9){
                    let sceneToMoveTo = Level9_GameScene(size: self.size)
                    sceneToMoveTo.scaleMode = self.scaleMode
                    let myTransition = SKTransition.fade(withDuration: 0.5)
                    self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                }
                if (UserDefaults().integer(forKey: "currlevel") == 10){
                    let sceneToMoveTo = Level10_GameScene(size: self.size)
                    sceneToMoveTo.scaleMode = self.scaleMode
                    let myTransition = SKTransition.fade(withDuration: 0.5)
                    self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                }
            }
        }
    }
}
