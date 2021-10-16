//
//  LevelScene.swift
//  Vroomba Wars
//
//  Created by Haemi Lee on 4/5/21.
//

import Foundation
import SpriteKit

class LevelScene: SKScene{
    
    var highscore1 = UserDefaults().integer(forKey: "HIGHSCORE1")
    var highscore2 = UserDefaults().integer(forKey: "HIGHSCORE2")
    var highscore3 = UserDefaults().integer(forKey: "HIGHSCORE3")
    var highscore4 = UserDefaults().integer(forKey: "HIGHSCORE4")
    var highscore5 = UserDefaults().integer(forKey: "HIGHSCORE5")
    var level2 = UserDefaults().bool(forKey: "level2")
    var level3 = UserDefaults().bool(forKey: "level3")
    var level4 = UserDefaults().bool(forKey: "level4")
    var level5 = UserDefaults().bool(forKey: "level5")
    let lockedLevel2 = SKSpriteNode(imageNamed: "lockedLevel")
    let lockedLevel3 = SKSpriteNode(imageNamed: "lockedLevel")
    let lockedLevel4 = SKSpriteNode(imageNamed: "lockedLevel")
    let lockedLevel5 = SKSpriteNode(imageNamed: "lockedLevel")
    let levtxt1hs = SKLabelNode(fontNamed: "PressStart2P-Regular")
    let levtxt2hs = SKLabelNode(fontNamed: "PressStart2P-Regular")
    let levtxt3hs = SKLabelNode(fontNamed: "PressStart2P-Regular")
    let levtxt4hs = SKLabelNode(fontNamed: "PressStart2P-Regular")
    let levtxt5hs = SKLabelNode(fontNamed: "PressStart2P-Regular")
    let lockedlevels = UserDefaults().bool(forKey: "unlocked")
    

    
    var customBackgroundColor = UIColor(red: 0.76, green: 0.90, blue: 1.0, alpha: 1)
//    var customBackgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
    
    override func didMove(to view: SKView){
        print("level 2 unlocked", UserDefaults().bool(forKey: "level2"))
        self.backgroundColor = customBackgroundColor
        
        
//        let txt1 = SKLabelNode(fontNamed: "PressStart2P-Regular")
//        txt1.text = "HIGH SCORES: "
//        txt1.fontSize = 35
//        txt1.fontColor = SKColor.black
//        txt1.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
//        txt1.position = CGPoint(x: self.size.width*0.25, y: self.size.height*0.64)
//        txt1.zPosition = 5
//        self.addChild(txt1)
        
        let levels_title = SKSpriteNode(imageNamed: "LEVELS")
        levels_title.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.83)
        levels_title.scaleTo(screenWidthPercentage: 0.3)
        levels_title.zPosition = 1
        self.addChild(levels_title)
        
        let levels_back = SKSpriteNode(imageNamed: "levels_back")
        levels_back.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.45)
        levels_back.scaleTo(screenWidthPercentage: 0.8)
        levels_back.zPosition = 1
        self.addChild(levels_back)
        
        let next_arrow = SKSpriteNode(imageNamed: "next_arrow")
        next_arrow.position = CGPoint(x: self.size.width*0.92, y: self.size.height*0.47)
        next_arrow.scaleTo(screenWidthPercentage: 0.025)
        next_arrow.zPosition = 2
        next_arrow.name = "nextPageArrow"
        self.addChild(next_arrow)
        
        let restartLevelsButton = SKSpriteNode(imageNamed: "restartLevelsButton")
        restartLevelsButton.position = CGPoint(x: self.size.width*0.25, y: self.size.height*0.1)
        restartLevelsButton.scaleTo(screenWidthPercentage: 0.3)
        restartLevelsButton.zPosition = 1
        restartLevelsButton.name = "restartLevelsButton"
        self.addChild(restartLevelsButton)
        
        //locked levels
//        let lockedLevel1 = SKSpriteNode(imageNamed: "lockedLevel")
//        lockedLevel1.position = CGPoint(x: self.size.width*0.23, y: self.size.height*0.47)
//        lockedLevel1.scaleTo(screenWidthPercentage: 0.12)
//        lockedLevel1.zPosition = 2
//        lockedLevel1.name = "lockedLevel1"
//        self.addChild(lockedLevel1)
        
        
        //unlocked Levels
        let unlockedLevel1 = SKSpriteNode(imageNamed: "unlockedLevel")
        unlockedLevel1.position = CGPoint(x: self.size.width*0.23, y: self.size.height*0.47)
        unlockedLevel1.scaleTo(screenWidthPercentage: 0.12)
        unlockedLevel1.zPosition = 2
        unlockedLevel1.name = "unlockedLevel1"
        self.addChild(unlockedLevel1)

        let unlockedLevel2 = SKSpriteNode(imageNamed: "unlockedLevel")
        unlockedLevel2.position = CGPoint(x: self.size.width*0.37, y: self.size.height*0.47)
        unlockedLevel2.scaleTo(screenWidthPercentage: 0.12)
        unlockedLevel2.zPosition = 2
        unlockedLevel2.name = "unlockedLevel2"
        self.addChild(unlockedLevel2)

        let unlockedLevel3 = SKSpriteNode(imageNamed: "unlockedLevel")
        unlockedLevel3.position = CGPoint(x: self.size.width*0.51, y: self.size.height*0.47)
        unlockedLevel3.scaleTo(screenWidthPercentage: 0.12)
        unlockedLevel3.zPosition = 2
        unlockedLevel3.name = "unlockedLevel3"
        self.addChild(unlockedLevel3)

        let unlockedLevel4 = SKSpriteNode(imageNamed: "unlockedLevel")
        unlockedLevel4.position = CGPoint(x: self.size.width*0.65, y: self.size.height*0.47)
        unlockedLevel4.scaleTo(screenWidthPercentage: 0.12)
        unlockedLevel4.zPosition = 2
        unlockedLevel4.name = "unlockedLevel4"
        self.addChild(unlockedLevel4)

        let unlockedLevel5 = SKSpriteNode(imageNamed: "unlockedLevel")
        unlockedLevel5.position = CGPoint(x: self.size.width*0.79, y: self.size.height*0.47)
        unlockedLevel5.scaleTo(screenWidthPercentage: 0.12)
        unlockedLevel5.zPosition = 2
        unlockedLevel5.name = "unlockedLevel5"
        self.addChild(unlockedLevel5)
        
        let levtxt1 = SKLabelNode(fontNamed: "PressStart2P-Regular")
        levtxt1.text = "LEVEL 1"
        let scalingFactor = min(self.size.width / levtxt1.frame.width, self.size.height / levtxt1.frame.height)
//        levtxt1.fontSize = 15*scalingFactor
        levtxt1.fontSize = 3.75*scalingFactor
        levtxt1.fontColor = SKColor.black
//        txt1.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        levtxt1.position = CGPoint(x: self.size.width*0.23, y: unlockedLevel3.position.y + unlockedLevel3.size.width*0.6)
        levtxt1.zPosition = 5
        self.addChild(levtxt1)
        
        let highscorescrown1 = SKSpriteNode(imageNamed: "highscorecrown")
        highscorescrown1.position = CGPoint(x: self.size.width*0.205, y: unlockedLevel3.position.y - unlockedLevel3.size.width*0.7)
        highscorescrown1.scaleTo(screenWidthPercentage: 0.03)
        highscorescrown1.zPosition = 3
        self.addChild(highscorescrown1)
        
        //let levtxt1hs = SKLabelNode(fontNamed: "PressStart2P-Regular")
        levtxt1hs.text = " \(UserDefaults().integer(forKey: "HIGHSCORE1"))"
        levtxt1hs.fontSize = 4*scalingFactor
        levtxt1hs.fontColor = SKColor.black
        levtxt1hs.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
//        levtxt1hs.position = CGPoint(x: self.size.width*0.26, y: self.size.height*0.27)
        levtxt1hs.position = CGPoint(x: self.size.width*0.26  , y: unlockedLevel3.position.y - unlockedLevel3.size.width*0.8)
        levtxt1hs.zPosition = 5
        self.addChild(levtxt1hs)
        
        let levtxt2 = SKLabelNode(fontNamed: "PressStart2P-Regular")
        levtxt2.text = "LEVEL 2"
        levtxt2.fontSize = 3.75*scalingFactor
        levtxt2.fontColor = SKColor.black
//        txt1.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        levtxt2.position = CGPoint(x: self.size.width*0.37, y: unlockedLevel3.position.y + unlockedLevel3.size.width*0.6)
        levtxt2.zPosition = 5
        self.addChild(levtxt2)
        
        let highscorescrown2 = SKSpriteNode(imageNamed: "highscorecrown")
        highscorescrown2.position = CGPoint(x: self.size.width*0.345, y: unlockedLevel3.position.y - unlockedLevel3.size.width*0.7)
        highscorescrown2.scaleTo(screenWidthPercentage: 0.03)
        highscorescrown2.zPosition = 3
        self.addChild(highscorescrown2)
    
        levtxt2hs.text = " \(UserDefaults().integer(forKey: "HIGHSCORE2"))"
        levtxt2hs.fontSize = 4*scalingFactor
        levtxt2hs.fontColor = SKColor.black
        levtxt2hs.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        levtxt2hs.position = CGPoint(x: self.size.width*0.40, y: unlockedLevel3.position.y - unlockedLevel3.size.width*0.8)
        levtxt2hs.zPosition = 5
        self.addChild(levtxt2hs)
        
        let levtxt3 = SKLabelNode(fontNamed: "PressStart2P-Regular")
        levtxt3.text = "LEVEL 3"
        levtxt3.fontSize = 3.75*scalingFactor
        levtxt3.fontColor = SKColor.black
        levtxt3.position = CGPoint(x: self.size.width*0.51, y: unlockedLevel3.position.y + unlockedLevel3.size.width*0.6)
        levtxt3.zPosition = 5
        self.addChild(levtxt3)
        
        let highscorescrown3 = SKSpriteNode(imageNamed: "highscorecrown")
        highscorescrown3.position = CGPoint(x: self.size.width*0.485, y: unlockedLevel3.position.y - unlockedLevel3.size.width*0.7)
        highscorescrown3.scaleTo(screenWidthPercentage: 0.03)
        highscorescrown3.zPosition = 3
        self.addChild(highscorescrown3)
        
        levtxt3hs.text = " \(UserDefaults().integer(forKey: "HIGHSCORE3"))"
        levtxt3hs.fontSize = 4*scalingFactor
        levtxt3hs.fontColor = SKColor.black
        levtxt3hs.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        levtxt3hs.position = CGPoint(x: self.size.width*0.54, y: unlockedLevel3.position.y - unlockedLevel3.size.width*0.8)
        levtxt3hs.zPosition = 5
        self.addChild(levtxt3hs)
        
        let levtxt4 = SKLabelNode(fontNamed: "PressStart2P-Regular")
        levtxt4.text = "LEVEL 4"
        levtxt4.fontSize = 3.75*scalingFactor
        levtxt4.fontColor = SKColor.black
        levtxt4.position = CGPoint(x: self.size.width*0.65, y: unlockedLevel3.position.y + unlockedLevel3.size.width*0.6)
        levtxt4.zPosition = 5
        self.addChild(levtxt4)
        
        let highscorescrown4 = SKSpriteNode(imageNamed: "highscorecrown")
        highscorescrown4.position = CGPoint(x: self.size.width*0.625, y: unlockedLevel3.position.y - unlockedLevel3.size.width*0.7)
        highscorescrown4.scaleTo(screenWidthPercentage: 0.03)
        highscorescrown4.zPosition = 3
        self.addChild(highscorescrown4)
        
        levtxt4hs.text = " \(UserDefaults().integer(forKey: "HIGHSCORE4"))"
        levtxt4hs.fontSize = 4*scalingFactor
        levtxt4hs.fontColor = SKColor.black
        levtxt4hs.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        levtxt4hs.position = CGPoint(x: self.size.width*0.68, y: unlockedLevel3.position.y - unlockedLevel3.size.width*0.8)
        levtxt4hs.zPosition = 5
        self.addChild(levtxt4hs)
        
        let levtxt5 = SKLabelNode(fontNamed: "PressStart2P-Regular")
        levtxt5.text = "LEVEL 5"
        levtxt5.fontSize = 3.75*scalingFactor
        levtxt5.fontColor = SKColor.black
        levtxt5.position = CGPoint(x: self.size.width*0.79, y: unlockedLevel3.position.y + unlockedLevel3.size.width*0.6)
        levtxt5.zPosition = 5
        self.addChild(levtxt5)
        
        let highscorescrown5 = SKSpriteNode(imageNamed: "highscorecrown")
        highscorescrown5.position = CGPoint(x: self.size.width*0.765, y: unlockedLevel3.position.y - unlockedLevel3.size.width*0.7)
        highscorescrown5.scaleTo(screenWidthPercentage: 0.03)
        highscorescrown5.zPosition = 3
        self.addChild(highscorescrown5)
        
        
        levtxt5hs.text = " \(UserDefaults().integer(forKey: "HIGHSCORE5"))"
        levtxt5hs.fontSize = 4*scalingFactor
        levtxt5hs.fontColor = SKColor.black
        levtxt5hs.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        levtxt5hs.position = CGPoint(x: self.size.width*0.82, y: unlockedLevel3.position.y - unlockedLevel3.size.width*0.8)
        levtxt5hs.zPosition = 5
        self.addChild(levtxt5hs)
        
        
        

//        let lockedLevel2 = SKSpriteNode(imageNamed: "lockedLevel")
        lockedLevel2.position = CGPoint(x: self.size.width*0.37, y: self.size.height*0.47)
        lockedLevel2.scaleTo(screenWidthPercentage: 0.12)
        lockedLevel2.zPosition = 3
        lockedLevel2.name = "lockedLevel2"
        self.addChild(lockedLevel2)
        if (UserDefaults().bool(forKey: "level2") == true){
            lockedLevel2.removeFromParent()
            
        }
        
//        let lockedLevel3 = SKSpriteNode(imageNamed: "lockedLevel")
        lockedLevel3.position = CGPoint(x: self.size.width*0.51, y: self.size.height*0.47)
        lockedLevel3.scaleTo(screenWidthPercentage: 0.12)
        lockedLevel3.zPosition = 3
        lockedLevel3.name = "lockedLevel3"
        self.addChild(lockedLevel3)
        if (UserDefaults().bool(forKey: "level3") == true){
            lockedLevel3.removeFromParent()
        }
        
//        let lockedLevel4 = SKSpriteNode(imageNamed: "lockedLevel")
        lockedLevel4.position = CGPoint(x: self.size.width*0.65, y: self.size.height*0.47)
        lockedLevel4.scaleTo(screenWidthPercentage: 0.12)
        lockedLevel4.zPosition = 3
        lockedLevel4.name = "lockedLevel4"
        self.addChild(lockedLevel4)
        if (UserDefaults().bool(forKey: "level4") == true){
            lockedLevel4.removeFromParent()
        }
        
//        let lockedLevel5 = SKSpriteNode(imageNamed: "lockedLevel")
        lockedLevel5.position = CGPoint(x: self.size.width*0.79, y: self.size.height*0.47)
        lockedLevel5.scaleTo(screenWidthPercentage: 0.12)
        lockedLevel5.zPosition = 3
        lockedLevel5.name = "lockedLevel5"
        self.addChild(lockedLevel5)
        if (UserDefaults().bool(forKey: "level5") == true){
            lockedLevel5.removeFromParent()
        }
        
//        //unlocked Levels
//        let unlockedLevel1 = SKSpriteNode(imageNamed: "unlockedLevel")
//        unlockedLevel1.position = CGPoint(x: self.size.width*0.23, y: self.size.height*0.47)
//        unlockedLevel1.scaleTo(screenWidthPercentage: 0.12)
//        unlockedLevel1.zPosition = 2
//        unlockedLevel1.name = "unlockedLevel1"
//        self.addChild(unlockedLevel1)
//
//        let unlockedLevel2 = SKSpriteNode(imageNamed: "unlockedLevel")
//        unlockedLevel2.position = CGPoint(x: self.size.width*0.37, y: self.size.height*0.47)
//        unlockedLevel2.scaleTo(screenWidthPercentage: 0.12)
//        unlockedLevel2.zPosition = 2
//        unlockedLevel2.name = "unlockedLevel2"
//        self.addChild(unlockedLevel2)
//
//        let unlockedLevel3 = SKSpriteNode(imageNamed: "unlockedLevel")
//        unlockedLevel3.position = CGPoint(x: self.size.width*0.51, y: self.size.height*0.47)
//        unlockedLevel3.scaleTo(screenWidthPercentage: 0.12)
//        unlockedLevel3.zPosition = 2
//        unlockedLevel3.name = "unlockedLevel3"
//        self.addChild(unlockedLevel3)
//
//        let unlockedLevel4 = SKSpriteNode(imageNamed: "unlockedLevel")
//        unlockedLevel4.position = CGPoint(x: self.size.width*0.65, y: self.size.height*0.47)
//        unlockedLevel4.scaleTo(screenWidthPercentage: 0.12)
//        unlockedLevel4.zPosition = 2
//        unlockedLevel4.name = "unlockedLevel4"
//        self.addChild(unlockedLevel4)
//
//        let unlockedLevel5 = SKSpriteNode(imageNamed: "unlockedLevel")
//        unlockedLevel5.position = CGPoint(x: self.size.width*0.79, y: self.size.height*0.47)
//        unlockedLevel5.scaleTo(screenWidthPercentage: 0.12)
//        unlockedLevel5.zPosition = 2
//        unlockedLevel5.name = "unlockedLevel5"
//        self.addChild(unlockedLevel5)
        
        
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
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{

            let pointOfTouch = touch.location(in: self)
            let nodeTapped = atPoint(pointOfTouch)
            
            if nodeTapped.name == "nextPageArrow"{
                if(UserDefaults().bool(forKey: "sound") == true){
                    MusicPlayer.shared.playSoundEffect(soundEffect: "champagne_pop")
                }
                let sceneToMoveTo = LevelScene2(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }

            if nodeTapped.name == "BacktoMain"{
                if(UserDefaults().bool(forKey: "sound") == true){
                    MusicPlayer.shared.playSoundEffect(soundEffect: "champagne_pop")
                }
                let sceneToMoveTo = MainMenuScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
            if nodeTapped.name == "unlockedLevel1"{
                if(UserDefaults().bool(forKey: "sound") == true){
                    MusicPlayer.shared.playSoundEffect(soundEffect: "champagne_pop")
                }
                let sceneToMoveTo = Level1_GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
            if nodeTapped.name == "unlockedLevel2"{
                if(UserDefaults().bool(forKey: "sound") == true){
                    MusicPlayer.shared.playSoundEffect(soundEffect: "champagne_pop")
                }
                let sceneToMoveTo = Level2_GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
            if nodeTapped.name == "unlockedLevel3"{
                if(UserDefaults().bool(forKey: "sound") == true){
                    MusicPlayer.shared.playSoundEffect(soundEffect: "champagne_pop")
                }
                let sceneToMoveTo = Level3_GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
            if nodeTapped.name == "unlockedLevel4"{
                if(UserDefaults().bool(forKey: "sound") == true){
                    MusicPlayer.shared.playSoundEffect(soundEffect: "champagne_pop")
                }
                let sceneToMoveTo = Level4_GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
            if nodeTapped.name == "unlockedLevel5"{
                if(UserDefaults().bool(forKey: "sound") == true){
                    MusicPlayer.shared.playSoundEffect(soundEffect: "champagne_pop")
                }
                let sceneToMoveTo = Level5_GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
            
            //reset all LEVELS
            if nodeTapped.name == "restartLevelsButton"{
                UserDefaults.standard.set(false, forKey: "unlocked")
                UserDefaults.standard.set(false, forKey: "level6")
                UserDefaults.standard.set(false, forKey: "level7")
                UserDefaults.standard.set(false, forKey: "level8")
                UserDefaults.standard.set(false, forKey: "level9")
                UserDefaults.standard.set(false, forKey: "level10")
                UserDefaults.standard.set(0, forKey: "HIGHSCORE6")
                UserDefaults.standard.set(0, forKey: "HIGHSCORE7")
                UserDefaults.standard.set(0, forKey: "HIGHSCORE8")
                UserDefaults.standard.set(0, forKey: "HIGHSCORE9")
                UserDefaults.standard.set(0, forKey: "HIGHSCORE10")
                if(UserDefaults().bool(forKey: "sound") == true){
                    MusicPlayer.shared.playSoundEffect(soundEffect: "champagne_pop")
                }
                //ADD if statements
                levtxt1hs.removeFromParent()
                //lockedLevel2.removeFromParent()
                UserDefaults.standard.set(0, forKey: "HIGHSCORE1")
                levtxt1hs.text = ":\(UserDefaults().integer(forKey: "HIGHSCORE1"))"
                self.addChild(levtxt1hs)
                
                if (UserDefaults().bool(forKey: "level2") == true){
                    levtxt2hs.removeFromParent()
                    UserDefaults.standard.set(0, forKey: "HIGHSCORE2")
                    UserDefaults.standard.set(false, forKey: "level2")
                    levtxt2hs.text = ":\(UserDefaults().integer(forKey: "HIGHSCORE2"))"
                    self.addChild(levtxt2hs)
                    self.addChild(lockedLevel2)
                }
                if (UserDefaults().bool(forKey: "level3") == true){
                    levtxt3hs.removeFromParent()
                    UserDefaults.standard.set(0, forKey: "HIGHSCORE3")
                    UserDefaults.standard.set(false, forKey: "level3")
                    levtxt3hs.text = ":\(UserDefaults().integer(forKey: "HIGHSCORE3"))"
                    self.addChild(levtxt3hs)
                    self.addChild(lockedLevel3)
                }
                if (UserDefaults().bool(forKey: "level4") == true){
                    levtxt4hs.removeFromParent()
                    UserDefaults.standard.set(false, forKey: "level4")
                    UserDefaults.standard.set(0, forKey: "HIGHSCORE4")
                    levtxt4hs.text = ":\(UserDefaults().integer(forKey: "HIGHSCORE4"))"
                    self.addChild(levtxt4hs)
                    self.addChild(lockedLevel4)
                }
                if (UserDefaults().bool(forKey: "level5") == true){
                    levtxt5hs.removeFromParent()
                    UserDefaults.standard.set(false, forKey: "level5")
                    UserDefaults.standard.set(0, forKey: "HIGHSCORE5")
                    levtxt5hs.text = ":\(UserDefaults().integer(forKey: "HIGHSCORE5"))"
                    self.addChild(levtxt5hs)
                    self.addChild(lockedLevel5)
                }

            }
        }
    }
}
