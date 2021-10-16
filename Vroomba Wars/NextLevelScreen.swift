//
//  NextLevelScreen.swift
//  Vroomba Wars
//
//  Created by Haemi Lee on 4/6/21.
//

import Foundation
import SpriteKit

class NextLevelScene: SKScene{
//    var Rvroomba = SKSpriteNode()
//    var RvroombaFrames: [SKTexture] = []
    
    //var highScore_level1 = UserDefaults().integer(forKey: "HIGHSCORE1")
    let txt1 = SKLabelNode(fontNamed: "PressStart2P-Regular")
    
    var customBackgroundColor = UIColor(red: 1.0, green: 0.93, blue: 0.84, alpha: 1)
//    var customBackgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
    
    override func didMove(to view: SKView){
        
        if UserDefaults().bool(forKey: "sound") == true{
            MusicPlayer.shared.startBackgroundMusic(backgroundMusicFileName:"menuMusic")
        }
        
        print("curr level", UserDefaults().integer(forKey: "currlevel"))
        self.backgroundColor = customBackgroundColor
        
        
        let nextLevelMessage = SKSpriteNode(imageNamed: "nextLevelMessage")
        nextLevelMessage.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.65)
        nextLevelMessage.scaleTo(screenWidthPercentage: 0.6)
        nextLevelMessage.zPosition = 2
        self.addChild(nextLevelMessage)
        
        
        //"High Score: \(self.highScore1) "
        //self.highScore_level1 =
        if (UserDefaults().integer(forKey: "currlevel") == 1){
            txt1.text = "YOUR HIGHSCORE IS: \(UserDefaults().integer(forKey: "HIGHSCORE1"))"
        }
        if (UserDefaults().integer(forKey: "currlevel") == 2){
            txt1.text = "YOUR HIGHSCORE IS: \(UserDefaults().integer(forKey: "HIGHSCORE2"))"
        }
        if (UserDefaults().integer(forKey: "currlevel") == 3){
            txt1.text = "YOUR HIGHSCORE IS: \(UserDefaults().integer(forKey: "HIGHSCORE3"))"
        }
        if (UserDefaults().integer(forKey: "currlevel") == 4){
            txt1.text = "YOUR HIGHSCORE IS: \(UserDefaults().integer(forKey: "HIGHSCORE4"))"
        }
        if (UserDefaults().integer(forKey: "currlevel") == 5){
            txt1.text = "YOUR HIGHSCORE IS: \(UserDefaults().integer(forKey: "HIGHSCORE5"))"
        }
        if (UserDefaults().integer(forKey: "currlevel") == 6){
            txt1.text = "YOUR HIGHSCORE IS: \(UserDefaults().integer(forKey: "HIGHSCORE6"))"
        }
        if (UserDefaults().integer(forKey: "currlevel") == 7){
            txt1.text = "YOUR HIGHSCORE IS: \(UserDefaults().integer(forKey: "HIGHSCORE7"))"
        }
        if (UserDefaults().integer(forKey: "currlevel") == 8){
            txt1.text = "YOUR HIGHSCORE IS: \(UserDefaults().integer(forKey: "HIGHSCORE8"))"
        }
        if (UserDefaults().integer(forKey: "currlevel") == 9){
            txt1.text = "YOUR HIGHSCORE IS: \(UserDefaults().integer(forKey: "HIGHSCORE9"))"
        }
        if (UserDefaults().integer(forKey: "currlevel") == 10){
            txt1.text = "YOUR HIGHSCORE IS: \(UserDefaults().integer(forKey: "HIGHSCORE10"))"
        }
        txt1.fontSize = 20
        txt1.fontColor = SKColor.black
//        txt1.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
        txt1.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.35)
        txt1.zPosition = 5
        self.addChild(txt1)
        
        let nextLevelButton = SKSpriteNode(imageNamed: "nextLevelButton")
        nextLevelButton.position = CGPoint(x: self.size.width*0.7, y: self.size.height*0.22)
        nextLevelButton.scaleTo(screenWidthPercentage: 0.35)
        nextLevelButton.zPosition = 2
        nextLevelButton.name = "nextLevelButton"
        self.addChild(nextLevelButton)
        
        let restart = SKSpriteNode(imageNamed: "restartleveltxt")
        restart.position = CGPoint(x: self.size.width*0.3, y: self.size.height*0.23)
        restart.scaleTo(screenWidthPercentage: 0.27)
        restart.zPosition = 3
        restart.name = "restart"
        self.addChild(restart)
        
        let restartButton = SKSpriteNode(imageNamed: "restartlevelbutton")
        restartButton.position = CGPoint(x: self.size.width*0.3, y: self.size.height*0.23)
        restartButton.scaleTo(screenWidthPercentage: 0.32)
        restartButton.zPosition = 2
        self.addChild(restartButton)
        
        
        
        
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
    
//    //https://www.raywenderlich.com/144-spritekit-animations-and-texture-atlases-in-swift
//    func rotateVroombaGIF(){
//        let RvroombaAtlas = SKTextureAtlas(named: "rotatingVroomba")
//        var RvroombaArray: [SKTexture] = []
//
//        let numImages = RvroombaAtlas.textureNames.count
//        for i in 0...numImages-1{
//            let name = "frame_\(i)_delay-0.1s.png"
//            RvroombaArray.append(RvroombaAtlas.textureNamed(name))
//        }
//        RvroombaFrames = RvroombaArray
//
//        let firstFrameTexture = RvroombaFrames[0]
//        Rvroomba = SKSpriteNode(texture: firstFrameTexture)
//        Rvroomba.scaleTo(screenWidthPercentage: 0.25)
//        Rvroomba.zPosition = 2
//        Rvroomba.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.5)
//        addChild(Rvroomba)
//
//
//    }
//
//    func animateRotatingVroomba() {
//        Rvroomba.run(SKAction.repeatForever(
//        SKAction.animate(with: RvroombaFrames,
//                         timePerFrame: 0.1,
//                         resize: false,
//                         restore: true)),
//        withKey:"Rvroomba")
//    }
//
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
            if nodeTapped.name == "nextLevelButton"{
                if(UserDefaults().bool(forKey: "sound") == true){
                    MusicPlayer.shared.playSoundEffect(soundEffect: "champagne_pop")
                }
                if UserDefaults().bool(forKey: "level10") == true && UserDefaults().integer(forKey: "currlevel") == 9 {
                    let sceneToMoveTo = Level10_GameScene(size: self.size)
                    sceneToMoveTo.scaleMode = self.scaleMode
                    let myTransition = SKTransition.fade(withDuration: 0.5)
                    self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                }
                else if UserDefaults().bool(forKey: "level9") == true && UserDefaults().integer(forKey: "currlevel") == 8 {
                    let sceneToMoveTo = Level9_GameScene(size: self.size)
                    sceneToMoveTo.scaleMode = self.scaleMode
                    let myTransition = SKTransition.fade(withDuration: 0.5)
                    self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                }
                else if UserDefaults().bool(forKey: "level8") == true && UserDefaults().integer(forKey: "currlevel") == 7 {
                    let sceneToMoveTo = Level8_GameScene(size: self.size)
                    sceneToMoveTo.scaleMode = self.scaleMode
                    let myTransition = SKTransition.fade(withDuration: 0.5)
                    self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                }
                else if UserDefaults().bool(forKey: "level7") == true && UserDefaults().integer(forKey: "currlevel") == 6 {
                    let sceneToMoveTo = Level7_GameScene(size: self.size)
                    sceneToMoveTo.scaleMode = self.scaleMode
                    let myTransition = SKTransition.fade(withDuration: 0.5)
                    self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                }
                else if UserDefaults().bool(forKey: "level6") == true && UserDefaults().integer(forKey: "currlevel") == 5 {
                    let sceneToMoveTo = Level6_GameScene(size: self.size)
                    sceneToMoveTo.scaleMode = self.scaleMode
                    let myTransition = SKTransition.fade(withDuration: 0.5)
                    self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                }
                else if UserDefaults().bool(forKey: "level5") == true && UserDefaults().integer(forKey: "currlevel") == 4 {
                    let sceneToMoveTo = Level5_GameScene(size: self.size)
                    sceneToMoveTo.scaleMode = self.scaleMode
                    let myTransition = SKTransition.fade(withDuration: 0.5)
                    self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                }
                else if UserDefaults().bool(forKey: "level4") == true && UserDefaults().integer(forKey: "currlevel") == 3{
                    let sceneToMoveTo = Level4_GameScene(size: self.size)
                    sceneToMoveTo.scaleMode = self.scaleMode
                    let myTransition = SKTransition.fade(withDuration: 0.5)
                    self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                }
                else if UserDefaults().bool(forKey: "level3") == true && UserDefaults().integer(forKey: "currlevel") == 2{
                    let sceneToMoveTo = Level3_GameScene(size: self.size)
                    sceneToMoveTo.scaleMode = self.scaleMode
                    let myTransition = SKTransition.fade(withDuration: 0.5)
                    self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                }
                else if UserDefaults().bool(forKey: "level2") == true && UserDefaults().integer(forKey: "currlevel") == 1{
                    let sceneToMoveTo = Level2_GameScene(size: self.size)
                    sceneToMoveTo.scaleMode = self.scaleMode
                    let myTransition = SKTransition.fade(withDuration: 0.5)
                    self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                }
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
