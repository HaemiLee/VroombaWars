//
//  highScoreScene.swift
//  Vroomba Wars
//
//  Created by Haemi Lee on 3/29/21.
//

import Foundation
import SpriteKit

class highScoreScene: SKScene{
    var Rvroomba = SKSpriteNode()
    var RvroombaFrames: [SKTexture] = []
    
    var customBackgroundColor = UIColor(red: 0.93, green: 0.76, blue: 1.0, alpha: 1)
//    var customBackgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
    
    override func didMove(to view: SKView){
        self.backgroundColor = customBackgroundColor
        
        
        let txt1 = SKLabelNode(fontNamed: "PressStart2P-Regular")
        txt1.text = "HIGH SCORES: "
        txt1.fontSize = 35
        txt1.fontColor = SKColor.black
        txt1.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        txt1.position = CGPoint(x: self.size.width*0.25, y: self.size.height*0.64)
        txt1.zPosition = 5
        self.addChild(txt1)
        
        let highscorescrown = SKSpriteNode(imageNamed: "highscorecrown")
        highscorescrown.position = CGPoint(x: self.size.width*0.16, y: self.size.height*0.70)
        highscorescrown.scaleTo(screenWidthPercentage: 0.1)
        highscorescrown.zPosition = 3
        self.addChild(highscorescrown)
        
        
        let score1 = SKLabelNode(fontNamed: "PressStart2P-Regular")
        var scoreint1 = 503 //REPLACE THIS VALUE WITH HIGH SCORE
        score1.text = "1." + String(scoreint1) + " PTS."
        score1.fontSize = 25
        score1.fontColor = SKColor.black
        score1.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        score1.position = CGPoint(x: self.size.width*0.25, y: self.size.height*0.5)
        score1.zPosition = 5
        self.addChild(score1)
        
        let score2 = SKLabelNode(fontNamed: "PressStart2P-Regular")
        var scoreint2 = 405 //REPLACE THIS VALUE WITH HIGH SCORE
        score2.text = "2." + String(scoreint2) + " PTS."
        score2.fontSize = 25
        score2.fontColor = SKColor.black
        score2.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        score2.position = CGPoint(x: self.size.width*0.25, y: self.size.height*0.41)
        score2.zPosition = 5
        self.addChild(score2)
        
        let score3 = SKLabelNode(fontNamed: "PressStart2P-Regular")
        var scoreint3 = 389 //REPLACE THIS VALUE WITH HIGH SCORE
        score3.text = "3." + String(scoreint3) + " PTS."
        score3.fontSize = 25
        score3.fontColor = SKColor.black
        score3.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        score3.position = CGPoint(x: self.size.width*0.25, y: self.size.height*0.33)
        score3.zPosition = 5
        self.addChild(score3)
        
        let score4 = SKLabelNode(fontNamed: "PressStart2P-Regular")
        var scoreint4 = 356 //REPLACE THIS VALUE WITH HIGH SCORE
        score4.text = "4." + String(scoreint4) + " PTS."
        score4.fontSize = 25
        score4.fontColor = SKColor.black
        score4.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        score4.position = CGPoint(x: self.size.width*0.25, y: self.size.height*0.25)
        score4.zPosition = 5
        self.addChild(score4)
        
        let score5 = SKLabelNode(fontNamed: "PressStart2P-Regular")
        var scoreint5 = 332 //REPLACE THIS VALUE WITH HIGH SCORE
        score5.text = "5." + String(scoreint5) + " PTS."
        score5.fontSize = 25
        score5.fontColor = SKColor.black
        score5.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        score5.position = CGPoint(x: self.size.width*0.25, y: self.size.height*0.17)
        score5.zPosition = 5
        self.addChild(score5)
        
        let score6 = SKLabelNode(fontNamed: "PressStart2P-Regular")
        var scoreint6 = 300 //REPLACE THIS VALUE WITH HIGH SCORE
        score6.text = "6." + String(scoreint6) + " PTS."
        score6.fontSize = 25
        score6.fontColor = SKColor.black
        score6.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        score6.position = CGPoint(x: self.size.width*0.6, y: self.size.height*0.5)
        score6.zPosition = 5
        self.addChild(score6)
        
        let score7 = SKLabelNode(fontNamed: "PressStart2P-Regular")
        var scoreint7 = 298 //REPLACE THIS VALUE WITH HIGH SCORE
        score7.text = "7." + String(scoreint7) + " PTS."
        score7.fontSize = 25
        score7.fontColor = SKColor.black
        score7.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        score7.position = CGPoint(x: self.size.width*0.6, y: self.size.height*0.41)
        score7.zPosition = 5
        self.addChild(score7)

        let score8 = SKLabelNode(fontNamed: "PressStart2P-Regular")
        var scoreint8 = 268 //REPLACE THIS VALUE WITH HIGH SCORE
        score8.text = "8." + String(scoreint8) + " PTS."
        score8.fontSize = 25
        score8.fontColor = SKColor.black
        score8.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        score8.position = CGPoint(x: self.size.width*0.6, y: self.size.height*0.33)
        score8.zPosition = 5
        self.addChild(score8)

        let score9 = SKLabelNode(fontNamed: "PressStart2P-Regular")
        var scoreint9 = 226 //REPLACE THIS VALUE WITH HIGH SCORE
        score9.text = "9." + String(scoreint9) + " PTS."
        score9.fontSize = 25
        score9.fontColor = SKColor.black
        score9.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        score9.position = CGPoint(x: self.size.width*0.6, y: self.size.height*0.25)
        score9.zPosition = 5
        self.addChild(score9)

        let score10 = SKLabelNode(fontNamed: "PressStart2P-Regular")
        var scoreint10 = 179 //REPLACE THIS VALUE WITH HIGH SCORE
        score10.text = "10." + String(scoreint10) + " PTS."
        score10.fontSize = 25
        score10.fontColor = SKColor.black
        score10.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        score10.position = CGPoint(x: self.size.width*0.6, y: self.size.height*0.17)
        score10.zPosition = 5
        self.addChild(score10)

        
        
        
        
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

            if nodeTapped.name == "BacktoMain"{
                let sceneToMoveTo = MainMenuScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
        }
    }
}
