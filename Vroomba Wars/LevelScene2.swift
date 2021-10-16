//
//  LevelScene2.swift
//  Vroomba Wars
//
//  Created by Haemi Lee on 5/5/21.
//

import Foundation
import SpriteKit

class LevelScene2: SKScene{
    
    var highscore6 = UserDefaults().integer(forKey: "HIGHSCORE6")
    var highscore7 = UserDefaults().integer(forKey: "HIGHSCORE7")
    var highscore8 = UserDefaults().integer(forKey: "HIGHSCORE8")
    var highscore9 = UserDefaults().integer(forKey: "HIGHSCORE9")
    var highscore10 = UserDefaults().integer(forKey: "HIGHSCORE10")
    
    var level6 = UserDefaults().bool(forKey: "level6")
    var level7 = UserDefaults().bool(forKey: "level7")
    var level8 = UserDefaults().bool(forKey: "level8")
    var level9 = UserDefaults().bool(forKey: "level9")
    var level10 = UserDefaults().bool(forKey: "level10")
    
    let lockedLevel6 = SKSpriteNode(imageNamed: "lockedLevel")
    let lockedLevel7 = SKSpriteNode(imageNamed: "lockedLevel")
    let lockedLevel8 = SKSpriteNode(imageNamed: "lockedLevel")
    let lockedLevel9 = SKSpriteNode(imageNamed: "lockedLevel")
    let lockedLevel10 = SKSpriteNode(imageNamed: "lockedLevel")
    
    let levtxt6hs = SKLabelNode(fontNamed: "PressStart2P-Regular")
    let levtxt7hs = SKLabelNode(fontNamed: "PressStart2P-Regular")
    let levtxt8hs = SKLabelNode(fontNamed: "PressStart2P-Regular")
    let levtxt9hs = SKLabelNode(fontNamed: "PressStart2P-Regular")
    let levtxt10hs = SKLabelNode(fontNamed: "PressStart2P-Regular")
    

    
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
        
        let next_arrow = SKSpriteNode(imageNamed: "back_arrow")
        next_arrow.position = CGPoint(x: self.size.width*0.08, y: self.size.height*0.47)
        next_arrow.scaleTo(screenWidthPercentage: 0.025)
        next_arrow.zPosition = 2
        next_arrow.name = "backPageArrow"
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
        let unlockedLevel6 = SKSpriteNode(imageNamed: "unlockedLevel")
        unlockedLevel6.position = CGPoint(x: self.size.width*0.23, y: self.size.height*0.47)
        unlockedLevel6.scaleTo(screenWidthPercentage: 0.12)
        unlockedLevel6.zPosition = 2
        unlockedLevel6.name = "unlockedLevel6"
        self.addChild(unlockedLevel6)

        let unlockedLevel7 = SKSpriteNode(imageNamed: "unlockedLevel")
        unlockedLevel7.position = CGPoint(x: self.size.width*0.37, y: self.size.height*0.47)
        unlockedLevel7.scaleTo(screenWidthPercentage: 0.12)
        unlockedLevel7.zPosition = 2
        unlockedLevel7.name = "unlockedLevel7"
        self.addChild(unlockedLevel7)

        let unlockedLevel8 = SKSpriteNode(imageNamed: "unlockedLevel")
        unlockedLevel8.position = CGPoint(x: self.size.width*0.51, y: self.size.height*0.47)
        unlockedLevel8.scaleTo(screenWidthPercentage: 0.12)
        unlockedLevel8.zPosition = 2
        unlockedLevel8.name = "unlockedLevel8"
        self.addChild(unlockedLevel8)

        let unlockedLevel9 = SKSpriteNode(imageNamed: "unlockedLevel")
        unlockedLevel9.position = CGPoint(x: self.size.width*0.65, y: self.size.height*0.47)
        unlockedLevel9.scaleTo(screenWidthPercentage: 0.12)
        unlockedLevel9.zPosition = 2
        unlockedLevel9.name = "unlockedLevel9"
        self.addChild(unlockedLevel9)

        let unlockedLevel10 = SKSpriteNode(imageNamed: "unlockedLevel")
        unlockedLevel10.position = CGPoint(x: self.size.width*0.79, y: self.size.height*0.47)
        unlockedLevel10.scaleTo(screenWidthPercentage: 0.12)
        unlockedLevel10.zPosition = 2
        unlockedLevel10.name = "unlockedLevel10"
        self.addChild(unlockedLevel10)
        
        let levtxt6 = SKLabelNode(fontNamed: "PressStart2P-Regular")
        levtxt6.text = "LEVEL 6"
        let scalingFactor = min(self.size.width / levtxt6.frame.width, self.size.height / levtxt6.frame.height)
//        levtxt1.fontSize = 15*scalingFactor
        levtxt6.fontSize = 3.75*scalingFactor
        levtxt6.fontColor = SKColor.black
//        txt1.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        levtxt6.position = CGPoint(x: self.size.width*0.23, y: unlockedLevel8.position.y + unlockedLevel8.size.width*0.6)
        levtxt6.zPosition = 5
        self.addChild(levtxt6)
        
        let highscorescrown6 = SKSpriteNode(imageNamed: "highscorecrown")
        highscorescrown6.position = CGPoint(x: self.size.width*0.205, y: unlockedLevel8.position.y - unlockedLevel8.size.width*0.7)
        highscorescrown6.scaleTo(screenWidthPercentage: 0.03)
        highscorescrown6.zPosition = 3
        self.addChild(highscorescrown6)
        
        //let levtxt1hs = SKLabelNode(fontNamed: "PressStart2P-Regular")
        levtxt6hs.text = " \(UserDefaults().integer(forKey: "HIGHSCORE6"))"
        levtxt6hs.fontSize = 4*scalingFactor
        levtxt6hs.fontColor = SKColor.black
        levtxt6hs.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
//        levtxt1hs.position = CGPoint(x: self.size.width*0.26, y: self.size.height*0.27)
        levtxt6hs.position = CGPoint(x: self.size.width*0.26  , y: unlockedLevel8.position.y - unlockedLevel8.size.width*0.8)
        levtxt6hs.zPosition = 5
        self.addChild(levtxt6hs)
        
        let levtxt7 = SKLabelNode(fontNamed: "PressStart2P-Regular")
        levtxt7.text = "LEVEL 7"
        levtxt7.fontSize = 3.75*scalingFactor
        levtxt7.fontColor = SKColor.black
//        txt1.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        levtxt7.position = CGPoint(x: self.size.width*0.37, y: unlockedLevel8.position.y + unlockedLevel8.size.width*0.6)
        levtxt7.zPosition = 5
        self.addChild(levtxt7)
        
        let highscorescrown7 = SKSpriteNode(imageNamed: "highscorecrown")
        highscorescrown7.position = CGPoint(x: self.size.width*0.345, y: unlockedLevel8.position.y - unlockedLevel8.size.width*0.7)
        highscorescrown7.scaleTo(screenWidthPercentage: 0.03)
        highscorescrown7.zPosition = 3
        self.addChild(highscorescrown7)
    
        levtxt7hs.text = " \(UserDefaults().integer(forKey: "HIGHSCORE7"))"
        levtxt7hs.fontSize = 4*scalingFactor
        levtxt7hs.fontColor = SKColor.black
        levtxt7hs.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        levtxt7hs.position = CGPoint(x: self.size.width*0.40, y: unlockedLevel8.position.y - unlockedLevel8.size.width*0.8)
        levtxt7hs.zPosition = 5
        self.addChild(levtxt7hs)
        
        let levtxt8 = SKLabelNode(fontNamed: "PressStart2P-Regular")
        levtxt8.text = "LEVEL 8"
        levtxt8.fontSize = 3.75*scalingFactor
        levtxt8.fontColor = SKColor.black
        levtxt8.position = CGPoint(x: self.size.width*0.51, y: unlockedLevel8.position.y + unlockedLevel8.size.width*0.6)
        levtxt8.zPosition = 5
        self.addChild(levtxt8)
        
        let highscorescrown8 = SKSpriteNode(imageNamed: "highscorecrown")
        highscorescrown8.position = CGPoint(x: self.size.width*0.485, y: unlockedLevel8.position.y - unlockedLevel8.size.width*0.7)
        highscorescrown8.scaleTo(screenWidthPercentage: 0.03)
        highscorescrown8.zPosition = 3
        self.addChild(highscorescrown8)
        
        levtxt8hs.text = " \(UserDefaults().integer(forKey: "HIGHSCORE8"))"
        levtxt8hs.fontSize = 4*scalingFactor
        levtxt8hs.fontColor = SKColor.black
        levtxt8hs.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        levtxt8hs.position = CGPoint(x: self.size.width*0.54, y: unlockedLevel8.position.y - unlockedLevel8.size.width*0.8)
        levtxt8hs.zPosition = 5
        self.addChild(levtxt8hs)
        
        let levtxt9 = SKLabelNode(fontNamed: "PressStart2P-Regular")
        levtxt9.text = "LEVEL 9"
        levtxt9.fontSize = 3.75*scalingFactor
        levtxt9.fontColor = SKColor.black
        levtxt9.position = CGPoint(x: self.size.width*0.65, y: unlockedLevel8.position.y + unlockedLevel8.size.width*0.6)
        levtxt9.zPosition = 5
        self.addChild(levtxt9)
        
        let highscorescrown9 = SKSpriteNode(imageNamed: "highscorecrown")
        highscorescrown9.position = CGPoint(x: self.size.width*0.625, y: unlockedLevel8.position.y - unlockedLevel8.size.width*0.7)
        highscorescrown9.scaleTo(screenWidthPercentage: 0.03)
        highscorescrown9.zPosition = 3
        self.addChild(highscorescrown9)
        
        levtxt9hs.text = " \(UserDefaults().integer(forKey: "HIGHSCORE9"))"
        levtxt9hs.fontSize = 4*scalingFactor
        levtxt9hs.fontColor = SKColor.black
        levtxt9hs.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        levtxt9hs.position = CGPoint(x: self.size.width*0.68, y: unlockedLevel8.position.y - unlockedLevel8.size.width*0.8)
        levtxt9hs.zPosition = 5
        self.addChild(levtxt9hs)
        
        let levtxt10 = SKLabelNode(fontNamed: "PressStart2P-Regular")
        levtxt10.text = "LEVEL 10"
        levtxt10.fontSize = 3.75*scalingFactor
        levtxt10.fontColor = SKColor.black
        levtxt10.position = CGPoint(x: self.size.width*0.79, y: unlockedLevel8.position.y + unlockedLevel8.size.width*0.6)
        levtxt10.zPosition = 5
        self.addChild(levtxt10)
        
        let highscorescrown10 = SKSpriteNode(imageNamed: "highscorecrown")
        highscorescrown10.position = CGPoint(x: self.size.width*0.765, y: unlockedLevel8.position.y - unlockedLevel8.size.width*0.7)
        highscorescrown10.scaleTo(screenWidthPercentage: 0.03)
        highscorescrown10.zPosition = 3
        self.addChild(highscorescrown10)
        
        
        levtxt10hs.text = " \(UserDefaults().integer(forKey: "HIGHSCORE10"))"
        levtxt10hs.fontSize = 4*scalingFactor
        levtxt10hs.fontColor = SKColor.black
        levtxt10hs.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        levtxt10hs.position = CGPoint(x: self.size.width*0.82, y: unlockedLevel8.position.y - unlockedLevel8.size.width*0.8)
        levtxt10hs.zPosition = 5
        self.addChild(levtxt10hs)
        
        
        lockedLevel6.position = CGPoint(x: self.size.width*0.23, y: self.size.height*0.47)
        lockedLevel6.scaleTo(screenWidthPercentage: 0.12)
        lockedLevel6.zPosition = 3
        lockedLevel6.name = "lockedLevel6"
        self.addChild(lockedLevel6)
        if (UserDefaults().bool(forKey: "level6") == true){
            lockedLevel6.removeFromParent()
            
        }

//        let lockedLevel2 = SKSpriteNode(imageNamed: "lockedLevel")
        lockedLevel7.position = CGPoint(x: self.size.width*0.37, y: self.size.height*0.47)
        lockedLevel7.scaleTo(screenWidthPercentage: 0.12)
        lockedLevel7.zPosition = 3
        lockedLevel7.name = "lockedLevel7"
        self.addChild(lockedLevel7)
        if (UserDefaults().bool(forKey: "level7") == true){
            lockedLevel7.removeFromParent()
            
        }
        
//        let lockedLevel3 = SKSpriteNode(imageNamed: "lockedLevel")
        lockedLevel8.position = CGPoint(x: self.size.width*0.51, y: self.size.height*0.47)
        lockedLevel8.scaleTo(screenWidthPercentage: 0.12)
        lockedLevel8.zPosition = 3
        lockedLevel8.name = "lockedLevel8"
        self.addChild(lockedLevel8)
        if (UserDefaults().bool(forKey: "level8") == true){
            lockedLevel8.removeFromParent()
        }
        
//        let lockedLevel4 = SKSpriteNode(imageNamed: "lockedLevel")
        lockedLevel9.position = CGPoint(x: self.size.width*0.65, y: self.size.height*0.47)
        lockedLevel9.scaleTo(screenWidthPercentage: 0.12)
        lockedLevel9.zPosition = 3
        lockedLevel9.name = "lockedLevel9"
        self.addChild(lockedLevel9)
        if (UserDefaults().bool(forKey: "level9") == true){
            lockedLevel9.removeFromParent()
        }
        
//        let lockedLevel5 = SKSpriteNode(imageNamed: "lockedLevel")
        lockedLevel10.position = CGPoint(x: self.size.width*0.79, y: self.size.height*0.47)
        lockedLevel10.scaleTo(screenWidthPercentage: 0.12)
        lockedLevel10.zPosition = 3
        lockedLevel10.name = "lockedLevel10"
        self.addChild(lockedLevel10)
        if (UserDefaults().bool(forKey: "level10") == true){
            lockedLevel10.removeFromParent()
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
            
            if nodeTapped.name == "backPageArrow"{
                if(UserDefaults().bool(forKey: "sound") == true){
                    MusicPlayer.shared.playSoundEffect(soundEffect: "champagne_pop")
                }
                let sceneToMoveTo = LevelScene(size: self.size)
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
            if nodeTapped.name == "unlockedLevel6"{
                if(UserDefaults().bool(forKey: "sound") == true){
                    MusicPlayer.shared.playSoundEffect(soundEffect: "champagne_pop")
                }
                let sceneToMoveTo = Level6_GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
            if nodeTapped.name == "unlockedLevel7"{
                if(UserDefaults().bool(forKey: "sound") == true){
                    MusicPlayer.shared.playSoundEffect(soundEffect: "champagne_pop")
                }
                let sceneToMoveTo = Level7_GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
            if nodeTapped.name == "unlockedLevel8"{
                if(UserDefaults().bool(forKey: "sound") == true){
                    MusicPlayer.shared.playSoundEffect(soundEffect: "champagne_pop")
                }
                let sceneToMoveTo = Level8_GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
            if nodeTapped.name == "unlockedLevel9"{
                if(UserDefaults().bool(forKey: "sound") == true){
                    MusicPlayer.shared.playSoundEffect(soundEffect: "champagne_pop")
                }
                let sceneToMoveTo = Level9_GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
            if nodeTapped.name == "unlockedLevel10"{
                if(UserDefaults().bool(forKey: "sound") == true){
                    MusicPlayer.shared.playSoundEffect(soundEffect: "champagne_pop")
                }
                let sceneToMoveTo = Level10_GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
            if nodeTapped.name == "restartLevelsButton"{
                UserDefaults.standard.set(false, forKey: "unlocked")
                UserDefaults.standard.set(false, forKey: "level1")
                UserDefaults.standard.set(false, forKey: "level2")
                UserDefaults.standard.set(false, forKey: "level3")
                UserDefaults.standard.set(false, forKey: "level4")
                UserDefaults.standard.set(false, forKey: "level5")
                UserDefaults.standard.set(0, forKey: "HIGHSCORE1")
                UserDefaults.standard.set(0, forKey: "HIGHSCORE2")
                UserDefaults.standard.set(0, forKey: "HIGHSCORE3")
                UserDefaults.standard.set(0, forKey: "HIGHSCORE4")
                UserDefaults.standard.set(0, forKey: "HIGHSCORE5")
                if(UserDefaults().bool(forKey: "sound") == true){
                    MusicPlayer.shared.playSoundEffect(soundEffect: "champagne_pop")
                }
                //ADD if statements
                if (UserDefaults().bool(forKey: "level6") == true){
                    levtxt6hs.removeFromParent()
                    UserDefaults.standard.set(0, forKey: "HIGHSCORE6")
                    UserDefaults.standard.set(false, forKey: "level6")
                    levtxt6hs.text = ":\(UserDefaults().integer(forKey: "HIGHSCORE6"))"
                    self.addChild(levtxt6hs)
                    self.addChild(lockedLevel6)
                }
                
                if (UserDefaults().bool(forKey: "level7") == true){
                    levtxt7hs.removeFromParent()
                    UserDefaults.standard.set(0, forKey: "HIGHSCORE7")
                    UserDefaults.standard.set(false, forKey: "level7")
                    levtxt7hs.text = ":\(UserDefaults().integer(forKey: "HIGHSCORE7"))"
                    self.addChild(levtxt7hs)
                    self.addChild(lockedLevel7)
                }
                if (UserDefaults().bool(forKey: "level8") == true){
                    levtxt8hs.removeFromParent()
                    UserDefaults.standard.set(0, forKey: "HIGHSCORE8")
                    UserDefaults.standard.set(false, forKey: "level8")
                    levtxt8hs.text = ":\(UserDefaults().integer(forKey: "HIGHSCORE8"))"
                    self.addChild(levtxt8hs)
                    self.addChild(lockedLevel8)
                }
                if (UserDefaults().bool(forKey: "level9") == true){
                    levtxt9hs.removeFromParent()
                    UserDefaults.standard.set(false, forKey: "level9")
                    UserDefaults.standard.set(0, forKey: "HIGHSCORE9")
                    levtxt9hs.text = ":\(UserDefaults().integer(forKey: "HIGHSCORE9"))"
                    self.addChild(levtxt9hs)
                    self.addChild(lockedLevel9)
                }
                if (UserDefaults().bool(forKey: "level10") == true){
                    levtxt10hs.removeFromParent()
                    UserDefaults.standard.set(false, forKey: "level10")
                    UserDefaults.standard.set(0, forKey: "HIGHSCORE10")
                    levtxt10hs.text = ":\(UserDefaults().integer(forKey: "HIGHSCORE10"))"
                    self.addChild(levtxt10hs)
                    self.addChild(lockedLevel10)
                }

            }
              
        }
    }
}
