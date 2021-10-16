//
//  MainMenuScene.swift
//  Vroomba Wars
//
//  Created by Haemi Lee on 3/15/21.
//

import Foundation
import SpriteKit

class MainMenuScene: SKScene{
    
    var roamingVroomba = SKSpriteNode()
    var roamingVroombaFrames: [SKTexture] = []
    var sound = UserDefaults().bool(forKey: "sound")
    var volume = true
    
    lazy var singleToggle: SKSpriteNode = {
        var sprite = SKSpriteNode(imageNamed: "singletoggle")
        sprite.position = CGPoint(x: self.size.width*0.48, y: self.size.height*0.35)
        sprite.scaleTo(screenWidthPercentage: 0.16)
        sprite.zPosition = 2
        sprite.name = "singleToggle"
        return sprite
    }()
    
    lazy var doubleToggle: SKSpriteNode = {
        var sprite = SKSpriteNode(imageNamed: "doubletoggle")
        sprite.position = CGPoint(x: self.size.width*0.62, y: self.size.height*0.35)
        sprite.scaleTo(screenWidthPercentage: 0.16)
        sprite.zPosition = 2
        sprite.name = "doubleToggle"
        return sprite
    }()
    
    lazy var volumeOn: SKSpriteNode = {
        let sprite = SKSpriteNode(imageNamed: "volumeon")
        sprite.position = CGPoint(x: self.size.width*0.6, y: self.size.height*0.54)
        sprite.scaleTo(screenWidthPercentage: 0.02)
        sprite.zPosition = 3
        sprite.name = "volumeOn"
        return sprite
    }()
    
    lazy var volumeOff: SKSpriteNode = {
        let sprite = SKSpriteNode(imageNamed: "volumeoff")
        sprite.position = CGPoint(x: self.size.width*0.6, y: self.size.height*0.54)
        sprite.scaleTo(screenWidthPercentage: 0.02)
        sprite.zPosition = 3
        sprite.name = "volumeOff"
        return sprite
    }()
    
    
    var single = true //single player
    var double = false //double player
    
    //var volume = true //volume on or off
    
    
    override func didMove(to view: SKView){
        print("sound is on", UserDefaults().bool(forKey: "sound"))
        if UserDefaults().bool(forKey: "sound") == true{
            MusicPlayer.shared.startBackgroundMusic(backgroundMusicFileName:"menuMusic")
        }
        
        let background = SKSpriteNode(imageNamed: "tileFloor")
        background.size = self.size
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.scaleTo(screenWidthPercentage: 1.0)
        background.zPosition = -1
        self.addChild(background)
        
        vroombaGIF()
        animateVroomba()
        
        let vroombawars1 = SKSpriteNode(imageNamed: "backvroombawars")
        vroombawars1.position = CGPoint(x: self.size.width*0.345, y: self.size.height*0.655)
        vroombawars1.scaleTo(screenWidthPercentage: 0.5)
        vroombawars1.zPosition = 1
        self.addChild(vroombawars1)
        
        let vroombawars2 = SKSpriteNode(imageNamed: "vroombawarstxt")
        vroombawars2.position = CGPoint(x: self.size.width*0.35, y: self.size.height*0.67)
        vroombawars2.scaleTo(screenWidthPercentage: 0.5)
        vroombawars2.zPosition = 2
        self.addChild(vroombawars2)
        
        let StartGameBack = SKSpriteNode(imageNamed: "backstart")
        StartGameBack.position = CGPoint(x: self.size.width*0.24, y: self.size.height*0.33)
        StartGameBack.scaleTo(screenWidthPercentage: 0.2)
        StartGameBack.zPosition = 1
        self.addChild(StartGameBack)

        let StartGameButton = SKSpriteNode(imageNamed: "startbutton")
        StartGameButton.position = CGPoint(x: self.size.width*0.25, y: self.size.height*0.355)
        StartGameButton.scaleTo(screenWidthPercentage: 0.2)
        StartGameButton.zPosition = 2
        StartGameButton.name = "StartGameButton"
        self.addChild(StartGameButton)

        let StartGame = SKSpriteNode(imageNamed: "starttxt")
        StartGame.position = CGPoint(x: self.size.width*0.25, y: self.size.height*0.355)
        StartGame.scaleTo(screenWidthPercentage: 0.12)
        StartGame.zPosition = 3
        StartGame.name = "StartGame"
        self.addChild(StartGame)
        
        let GameInstrTxt = SKSpriteNode(imageNamed: "gameinstructions")
        GameInstrTxt.position = CGPoint(x: self.size.width*0.54, y: self.size.height*0.54)
        GameInstrTxt.scaleTo(screenWidthPercentage: 0.02)
        GameInstrTxt.zPosition = 3
        GameInstrTxt.name = "GameInstrTxt"
        self.addChild(GameInstrTxt)
        
        let GameInstrButton = SKSpriteNode(imageNamed: "gameinstructionsbutton")
        GameInstrButton.position = CGPoint(x: self.size.width*0.54, y: self.size.height*0.54)
        GameInstrButton.scaleTo(screenWidthPercentage: 0.04)
        GameInstrButton.zPosition = 2
        GameInstrButton.name = "GameInstrButton"
        self.addChild(GameInstrButton)

        let GameInstrBack = SKSpriteNode(imageNamed: "gameinstructionsback")
        GameInstrBack.position = CGPoint(x: self.size.width*0.535, y: self.size.height*0.53)
        GameInstrBack.scaleTo(screenWidthPercentage: 0.04)
        GameInstrBack.zPosition = 1
        GameInstrBack.name = "GameInstrBack"
        self.addChild(GameInstrBack)
        
        self.addChild(volumeOn)
        if(UserDefaults().bool(forKey: "sound") == false){
            volumeOn.removeFromParent()
            addChild(volumeOff)
            volume = false
        }
        

        let volumeButton = SKSpriteNode(imageNamed: "volumebutton")
        volumeButton.position = CGPoint(x: self.size.width*0.6, y: self.size.height*0.54)
        volumeButton.scaleTo(screenWidthPercentage: 0.04)
        volumeButton.zPosition = 2
        volumeButton.name = "volumeButton"
        self.addChild(volumeButton)

        let volumeBack = SKSpriteNode(imageNamed: "volumebuttonback")
        volumeBack.position = CGPoint(x: self.size.width*0.594, y: self.size.height*0.53)
        volumeBack.scaleTo(screenWidthPercentage: 0.04)
        volumeBack.zPosition = 1
        volumeBack.name = "volumeBack"
        self.addChild(volumeBack)
        
//        let HighScoresBack = SKSpriteNode(imageNamed: "backhighscores")
//        HighScoresBack.position = CGPoint(x: self.size.width*0.28, y: self.size.height*0.147)
//        HighScoresBack.scaleTo(screenWidthPercentage: 0.28)
//        HighScoresBack.zPosition = 1
//        self.addChild(HighScoresBack)

//        let HighScoresButton = SKSpriteNode(imageNamed: "highscoresbutton")
//        HighScoresButton.position = CGPoint(x: self.size.width*0.29, y: self.size.height*0.17)
//        HighScoresButton.scaleTo(screenWidthPercentage: 0.28)
//        HighScoresButton.zPosition = 2
//        HighScoresButton.name = "HighScoresButton"
//        self.addChild(HighScoresButton)
//
//        let HighScores = SKSpriteNode(imageNamed: "highscorestxt")
//        HighScores.position = CGPoint(x: self.size.width*0.29, y: self.size.height*0.17)
//        HighScores.scaleTo(screenWidthPercentage: 0.23)
//        HighScores.zPosition = 3
//        HighScores.name = "HighScores"
//        self.addChild(HighScores)

        let AboutUsButtonBack = SKSpriteNode(imageNamed: "backaboutus")
        AboutUsButtonBack.position = CGPoint(x: self.size.width*0.245, y: self.size.height*0.145)
        AboutUsButtonBack.scaleTo(screenWidthPercentage: 0.21)
        AboutUsButtonBack.zPosition = 1
        self.addChild(AboutUsButtonBack)

        let AboutUsButton = SKSpriteNode(imageNamed: "aboutusbutton")
        AboutUsButton.position = CGPoint(x: self.size.width*0.255, y: self.size.height*0.17)
        AboutUsButton.scaleTo(screenWidthPercentage: 0.21)
        AboutUsButton.zPosition = 2
        AboutUsButton.name = "AboutUsButton"
        self.addChild(AboutUsButton)

        let AboutUs = SKSpriteNode(imageNamed: "aboutustxt")
        AboutUs.position = CGPoint(x: self.size.width*0.255, y: self.size.height*0.17)
        AboutUs.scaleTo(screenWidthPercentage: 0.17)
        AboutUs.zPosition = 3
        AboutUs.name = "AboutUs"
        self.addChild(AboutUs)
        
        let BackToggle = SKSpriteNode(imageNamed: "backtoggle")
        BackToggle.position = CGPoint(x: self.size.width*0.55, y: self.size.height*0.35)
        BackToggle.scaleTo(screenWidthPercentage: 0.3)
        BackToggle.zPosition = 1
        self.addChild(BackToggle)
        
        
        self.addChild(singleToggle)
        
        let singleToggletxt = SKSpriteNode(imageNamed: "singletxt")
        singleToggletxt.position = CGPoint(x: self.size.width*0.48, y: self.size.height*0.36)
        singleToggletxt.scaleTo(screenWidthPercentage: 0.09)
        singleToggletxt.zPosition = 3
        singleToggletxt.name = "singleToggletxt"
        self.addChild(singleToggletxt)
        
        let doubleToggletxt = SKSpriteNode(imageNamed: "doubletxt")
        doubleToggletxt.position = CGPoint(x: self.size.width*0.62, y: self.size.height*0.36)
        doubleToggletxt.scaleTo(screenWidthPercentage: 0.09)
        doubleToggletxt.zPosition = 3
        doubleToggletxt.name = "doubleToggletxt"
        self.addChild(doubleToggletxt)
        

        
        
        
        
        
        
//        let gameTitle = SKLabelNode(fontNamed: "PressStart2P-Regular")
//        gameTitle.text = "VROOMBA WARS"
//        gameTitle.fontSize = 50
//        gameTitle.fontColor = SKColor.white
//        gameTitle.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
//        gameTitle.zPosition = 1
//        self.addChild(gameTitle)
        
        //check for font names
//        for family in UIFont.familyNames.sorted() {
//            let names = UIFont.fontNames(forFamilyName: family)
//            print("Family: \(family) Font names: \(names)")
//        }
    }
    
    //https://www.raywenderlich.com/144-spritekit-animations-and-texture-atlases-in-swift
    func vroombaGIF(){
        let vroombaAtlas = SKTextureAtlas(named: "vaccummingVroomba")
        var vroombaFrames: [SKTexture] = []
        
        let numImages = vroombaAtlas.textureNames.count
        print(numImages)
        for i in 0...numImages-1{
            let name = "frame_\(i)_delay-0.1s.png"
            
            vroombaFrames.append(vroombaAtlas.textureNamed(name))
        }
        roamingVroombaFrames = vroombaFrames
        
        let firstFrameTexture = roamingVroombaFrames[0]
        roamingVroomba = SKSpriteNode(texture: firstFrameTexture)
        roamingVroomba.scaleTo(screenWidthPercentage: 0.85)
        roamingVroomba.zPosition = 0
        roamingVroomba.position = CGPoint(x: self.size.width*2.1/3, y: self.size.height*2.7/4)
        addChild(roamingVroomba)
    }
    
    func animateVroomba() {
        roamingVroomba.run(SKAction.repeatForever(
        SKAction.animate(with: roamingVroombaFrames,
                         timePerFrame: 0.2,
                         resize: false,
                         restore: true)),
        withKey:"roamingVroomba")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            
            let pointOfTouch = touch.location(in: self)
            let nodeTapped = atPoint(pointOfTouch)
            
            if nodeTapped.name == "StartGameButton"{
                if(UserDefaults().bool(forKey: "sound") == true){
                    MusicPlayer.shared.playSoundEffect(soundEffect: "champagne_pop")
                }
                if single{
//                    let sceneToMoveTo = GameScene(size: self.size)
                    let sceneToMoveTo = LevelScene(size: self.size)
                    sceneToMoveTo.scaleMode = self.scaleMode
                    let myTransition = SKTransition.fade(withDuration: 0.5)
                    self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                }
                //double toggle -> double player
                else{
                    let sceneToMoveTo = Multiplayer(size: self.size) //move to multiplayerGameScene
                    sceneToMoveTo.scaleMode = self.scaleMode
                    let myTransition = SKTransition.fade(withDuration: 0.5)
                    self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                }
            }
            
            if nodeTapped.name == "StartGame"{
                if(UserDefaults().bool(forKey: "sound") == true){
                    MusicPlayer.shared.playSoundEffect(soundEffect: "champagne_pop")
                }
                //single toggle -> single player
                if single{
//                    let sceneToMoveTo = GameScene(size: self.size)
                    let sceneToMoveTo = LevelScene(size: self.size)
                    sceneToMoveTo.scaleMode = self.scaleMode
                    let myTransition = SKTransition.fade(withDuration: 0.5)
                    self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                }
                //double toggle -> double player
                else{
                    let sceneToMoveTo = Multiplayer(size: self.size) //move to multiplayerGameScene
                    sceneToMoveTo.scaleMode = self.scaleMode
                    let myTransition = SKTransition.fade(withDuration: 0.5)
                    self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                }
                
//                self.view!.presentScene(sceneToMoveTo)
            }
            
            if nodeTapped.name == "AboutUsButton"{
                if(UserDefaults().bool(forKey: "sound") == true){
                    MusicPlayer.shared.playSoundEffect(soundEffect: "champagne_pop")
                }
                let sceneToMoveTo = AboutUsScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
//                self.view!.presentScene(sceneToMoveTo)
            }
            if nodeTapped.name == "AboutUs"{
                if(UserDefaults().bool(forKey: "sound") == true){
                    MusicPlayer.shared.playSoundEffect(soundEffect: "champagne_pop")
                }
                let sceneToMoveTo = AboutUsScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
//                self.view!.presentScene(sceneToMoveTo)
            }
            
            if nodeTapped.name == "singleToggletxt"{
                if(UserDefaults().bool(forKey: "sound") == true){
                    MusicPlayer.shared.playSoundEffect(soundEffect: "champagne_pop")
                }
                if double{
                    single = true
                    double = false
                    doubleToggle.removeFromParent()
                    addChild(singleToggle)
                }
            }
            
            if nodeTapped.name == "doubleToggletxt"{
                if(UserDefaults().bool(forKey: "sound") == true){
                    MusicPlayer.shared.playSoundEffect(soundEffect: "champagne_pop")
                }
                if single{
                    single = false
                    double = true
                    self.singleToggle.removeFromParent()
                    addChild(doubleToggle)
                }
            }
            
            if nodeTapped.name == "volumeOn"{
                if(UserDefaults().bool(forKey: "sound") == true){
                    MusicPlayer.shared.playSoundEffect(soundEffect: "champagne_pop")
                }
                if volume{
                    volume = false
                    MusicPlayer.shared.stopBackgroundMusic()
                    nodeTapped.removeFromParent()
                    UserDefaults.standard.set(false, forKey: "sound")
                    //MusicPlayer.shared.stopBackgroundMusic()
                    addChild(volumeOff)
                    
                }
            }
            if nodeTapped.name == "volumeOff"{
                if(UserDefaults().bool(forKey: "sound") == true){
                    MusicPlayer.shared.playSoundEffect(soundEffect: "champagne_pop")
                }
                if !volume{
                    volume = true
                    nodeTapped.removeFromParent()
                    UserDefaults.standard.set(true, forKey: "sound")
                    if UserDefaults().bool(forKey: "sound") == true{
                        MusicPlayer.shared.startBackgroundMusic(backgroundMusicFileName:"menuMusic")
                    }
                    addChild(volumeOn)
                }
            }
            if nodeTapped.name == "GameInstrTxt"{
                if(UserDefaults().bool(forKey: "sound") == true){
                    MusicPlayer.shared.playSoundEffect(soundEffect: "champagne_pop")
                }
                let sceneToMoveTo = GameInstructions(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
            if nodeTapped.name == "HighScores"{
                if(UserDefaults().bool(forKey: "sound") == true){
                    MusicPlayer.shared.playSoundEffect(soundEffect: "champagne_pop")
                }
                let sceneToMoveTo = highScoreScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
        }
    }
    
//    //https://www.raywenderlich.com/144-spritekit-animations-and-texture-atlases-in-swift
//    func vroombaGIF(){
//        let vroombaAtlas = SKTextureAtlas(named: "roamingVroomba")
//        var vroombaFrames: [SKTexture] = []
//
//        let numImages = vroombaAtlas.textureNames.count
//        print(numImages)
//        for i in 0...numImages-1{
//            let name = "frame_\(i)_delay-0.1s.png"
//
//            vroombaFrames.append(vroombaAtlas.textureNamed(name))
//        }
//        roamingVroombaFrames = vroombaFrames
//
//        let firstFrameTexture = roamingVroombaFrames[0]
//        roamingVroomba = SKSpriteNode(texture: firstFrameTexture)
//        roamingVroomba.scaleTo(screenWidthPercentage: 1.0)
//        roamingVroomba.zPosition = 0
//        roamingVroomba.position = CGPoint(x: self.size.width/3, y: self.size.height/2)
//        addChild(roamingVroomba)
//    }
//
//    func animateVroomba() {
//        roamingVroomba.run(SKAction.repeatForever(
//        SKAction.animate(with: roamingVroombaFrames,
//                         timePerFrame: 0.2,
//                         resize: false,
//                         restore: true)),
//        withKey:"roamingVroomba")
//    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch: AnyObject in touches{
//
//            let pointOfTouch = touch.location(in: self)
//            let nodeTapped = atPoint(pointOfTouch)
//
//            if nodeTapped.name == "StartGameButton"{
//                let sceneToMoveTo = GameScene(size: self.size)
//                sceneToMoveTo.scaleMode = self.scaleMode
//                let myTransition = SKTransition.fade(withDuration: 0.5)
//                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
////                self.view!.presentScene(sceneToMoveTo)
//            }
//
//            if nodeTapped.name == "StartGame"{
//                let sceneToMoveTo = GameScene(size: self.size)
//                sceneToMoveTo.scaleMode = self.scaleMode
//                let myTransition = SKTransition.fade(withDuration: 0.5)
//                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
////                self.view!.presentScene(sceneToMoveTo)
//            }
//
//            if nodeTapped.name == "AboutUsButton"{
//                let sceneToMoveTo = AboutUsScene(size: self.size)
//                sceneToMoveTo.scaleMode = self.scaleMode
//                let myTransition = SKTransition.fade(withDuration: 0.5)
//                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
////                self.view!.presentScene(sceneToMoveTo)
//            }
//            if nodeTapped.name == "AboutUs"{
//                let sceneToMoveTo = AboutUsScene(size: self.size)
//                sceneToMoveTo.scaleMode = self.scaleMode
//                let myTransition = SKTransition.fade(withDuration: 0.5)
//                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
////                self.view!.presentScene(sceneToMoveTo)
//            }
//        }
//    }
    
}
