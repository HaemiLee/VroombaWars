//
//  GameInstructions.swift
//  Vroomba Wars
//
//  Created by Haemi Lee on 3/26/21.
//


import SpriteKit
import GameplayKit


class GameInstructions: SKScene, SKPhysicsContactDelegate {
    
    //Game Instructions:
    //Move the vroomba around with your joystick!
    //Yay! Now pick up the dirt and avoid the scissor!
        //if hit scissor, say ouch! (battery decreases)
        //if battery dies -> restart button
    //Great! Now, go to the charger to recharge!
    //That's better :)
    //Cleanup the house while avoiding the obstacles before the timer runs out!
    //Now you're ready to play!
    
    let vroomba = SKSpriteNode(imageNamed: "Vroomba")
    let velocityMultiplier: CGFloat = 0.05 //changes speed of Vroomba
    
    let None: UInt32 = 0
    let vroombaCategory:UInt32 = 0b1 //1
    let cleanUpCategory:UInt32 = 0b10 //2
    let obstacleCategory: UInt32 = 0b100 //4
    let chargerCategory: UInt32 = 0b1000 //6 if charge is in contact with vroomba, then increase
    
    var gameScore = 0
    var charging = true;
    var health: CGFloat = 1.0 ; // testing charger
    var HealthBar = SKSpriteNode(imageNamed: "HealthBar_g")
    
    
    lazy var analogJoystick: AnalogJoystick = {
        let js = AnalogJoystick(diameter: ScreenSize.width/10, colors: nil, images: (substrate: #imageLiteral(resourceName: "jSubstrate"), stick: #imageLiteral(resourceName: "jStick")))
        js.setScale(1.5)
        js.position = CGPoint(x: ScreenSize.width * -0.5 + js.radius + 900, y: ScreenSize.height * -0.5 + js.radius - 500)
        js.zPosition = NodesZPosition.joystick.rawValue
        return js
        }()
    enum NodesZPosition: CGFloat {
      case background, vroomba, joystick, cleanUp
    }
    
    
    var customBackgroundColor = UIColor(red: 1, green: 0.945, blue: 0.749, alpha: 1)
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        
        //shows the outline of physics body size
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.showsPhysics = true
        
        self.backgroundColor = customBackgroundColor
        
//        let BacktoMain = SKSpriteNode(imageNamed: "BACK TO MAIN MENU")
//        BacktoMain.position = CGPoint(x: self.size.width*0.15, y: self.size.height*0.93)
//        BacktoMain.scaleTo(screenWidthPercentage: 0.25)
//        BacktoMain.zPosition = 5
//        BacktoMain.name = "BacktoMain"
//        self.addChild(BacktoMain)
        
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
        
        //Game Instructions:
        
        let gameTitle = SKSpriteNode(imageNamed: "gameinstructionsTitle")
        gameTitle.position = CGPoint(x: self.size.width*0.27, y: self.size.height*0.73)
        gameTitle.scaleTo(screenWidthPercentage: 0.4)
        gameTitle.zPosition = 2
        self.addChild(gameTitle)
        
        let gameinstructions = SKSpriteNode(imageNamed: "instructions")
        gameinstructions.position = CGPoint(x: self.size.width*0.27, y: self.size.height*0.45)
        gameinstructions.scaleTo(screenWidthPercentage: 0.4)
        gameinstructions.zPosition = 2
        self.addChild(gameinstructions)
        
        
//        let gameTitle = SKLabelNode(fontNamed: "PressStart2P-Regular")
//        gameTitle.text = "GAME INSTRUCTIONS:"
//        gameTitle.fontSize = 19
//        gameTitle.fontColor = SKColor.black
//        gameTitle.position = CGPoint(x: self.size.width*0.2, y: self.size.height*0.75)
//        gameTitle.zPosition = 5
//        self.addChild(gameTitle)
        
//        let instr1 = SKLabelNode(fontNamed: "PressStart2P-Regular")
//        instr1.text = "MOVE THE VROOMBA"
//        instr1.fontSize = 15
//        instr1.fontColor = SKColor.black
//        instr1.position = CGPoint(x: self.size.width*0.15, y: self.size.height*0.65)
//        instr1.zPosition = 5
//        self.addChild(instr1)
//        let instr11 = SKLabelNode(fontNamed: "PressStart2P-Regular")
//        instr11.text = "AROUND WITH YOUR JOYSTICK!"
//        instr11.fontSize = 15
//        instr11.fontColor = SKColor.black
//        instr11.position = CGPoint(x: self.size.width*0.2, y: self.size.height*0.60)
//        instr11.zPosition = 5
//        self.addChild(instr11)
//        let instr2 = SKLabelNode(fontNamed: "PressStart2P-Regular")
//        instr2.text = "CLEAN UP THE HOUSE"
//        instr2.fontSize = 15
//        instr2.fontColor = SKColor.black
//        instr2.position = CGPoint(x: self.size.width*0.2, y: self.size.height*0.55)
//        instr2.zPosition = 5
//        self.addChild(instr2)
//        let instr22 = SKLabelNode(fontNamed: "PressStart2P-Regular")
//        instr22.text = "AND AVOID OBSTACLES"
//        instr22.fontSize = 15
//        instr22.fontColor = SKColor.black
//        instr22.position = CGPoint(x: self.size.width*0.23, y: self.size.height*0.5)
//        instr22.zPosition = 5
//        self.addChild(instr22)
//
        
        //Yay! Now pick up the dirt and avoid the scissor!
        let crumbs = SKSpriteNode(imageNamed: "crumbs")
        crumbs.position = CGPoint(x: self.size.width*2/3, y: self.size.height*5/6)
        crumbs.scaleTo(screenWidthPercentage: 0.1)
        crumbs.zPosition = 1
        crumbs.physicsBody = SKPhysicsBody(texture: crumbs.texture!,
                                            size: CGSize(width: crumbs.size.width, height: crumbs.size.height))
        crumbs.physicsBody!.affectedByGravity = false
        crumbs.physicsBody!.categoryBitMask = cleanUpCategory
        crumbs.physicsBody!.collisionBitMask = None
        crumbs.physicsBody!.contactTestBitMask = vroombaCategory
        self.addChild(crumbs)
        
        let dustbunny = SKSpriteNode(imageNamed: "dustbunny")
        dustbunny.position = CGPoint(x: self.size.width*0.80, y: self.size.height*0.5)
        dustbunny.scaleTo(screenWidthPercentage: 0.1)
        dustbunny.zPosition = 1
        dustbunny.physicsBody = SKPhysicsBody(texture: dustbunny.texture!,
                                            size: CGSize(width: dustbunny.size.width, height: dustbunny.size.height))
        dustbunny.physicsBody!.affectedByGravity = false
        dustbunny.physicsBody!.categoryBitMask = cleanUpCategory
        dustbunny.physicsBody!.collisionBitMask = None
        dustbunny.physicsBody!.contactTestBitMask = vroombaCategory
        self.addChild(dustbunny)
        
        let waterspill = SKSpriteNode(imageNamed: "waterspill")
        waterspill.position = CGPoint(x: self.size.width*0.65, y: self.size.height*0.6)
        waterspill.scaleTo(screenWidthPercentage: 0.08)
        waterspill.zPosition = 1
        waterspill.physicsBody = SKPhysicsBody(texture: waterspill.texture!,
                                            size: CGSize(width: waterspill.size.width, height: waterspill.size.height))
        waterspill.physicsBody!.affectedByGravity = false
        waterspill.physicsBody!.categoryBitMask = cleanUpCategory
        waterspill.physicsBody!.collisionBitMask = None
        waterspill.physicsBody!.contactTestBitMask = vroombaCategory
        self.addChild(waterspill)
        
        let greensock = SKSpriteNode(imageNamed: "greensock")
        greensock.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.5)
        greensock.scaleTo(screenWidthPercentage: 0.08)
        greensock.zPosition = 1
        greensock.physicsBody = SKPhysicsBody(texture: greensock.texture!,
                                            size: CGSize(width: greensock.size.width, height: greensock.size.height))
        greensock.physicsBody!.affectedByGravity = false
        greensock.physicsBody!.categoryBitMask = cleanUpCategory
        greensock.physicsBody!.collisionBitMask = None
        greensock.physicsBody!.contactTestBitMask = vroombaCategory
        self.addChild(greensock)
        
        
        
        
        let greenscissor = SKSpriteNode(imageNamed: "greenscissor")
        greenscissor.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.8)
        greenscissor.scaleTo(screenWidthPercentage: 0.08)
        greenscissor.zPosition = 1
        greenscissor.physicsBody = SKPhysicsBody(texture: greenscissor.texture!,
                                            size: CGSize(width: greenscissor.size.width, height: greenscissor.size.height))
        greenscissor.physicsBody!.affectedByGravity = false
        greenscissor.physicsBody!.categoryBitMask = obstacleCategory
        greenscissor.physicsBody!.collisionBitMask = None
        greenscissor.physicsBody!.contactTestBitMask = vroombaCategory
//        greenscissor.physicsBody!.restitution = 0.0
        
        self.addChild(greenscissor)
        
        let blue_thumbtck = SKSpriteNode(imageNamed: "blue_thumbtck")
        blue_thumbtck.position = CGPoint(x: self.size.width*0.65, y: self.size.height*0.3)
        blue_thumbtck.scaleTo(screenWidthPercentage: 0.05)
        blue_thumbtck.zPosition = 1
        blue_thumbtck.physicsBody = SKPhysicsBody(texture: blue_thumbtck.texture!,
                                            size: CGSize(width: blue_thumbtck.size.width, height: blue_thumbtck.size.height))
        blue_thumbtck.physicsBody!.affectedByGravity = false
        blue_thumbtck.physicsBody!.categoryBitMask = obstacleCategory
        blue_thumbtck.physicsBody!.collisionBitMask = None
        blue_thumbtck.physicsBody!.contactTestBitMask = vroombaCategory
        self.addChild(blue_thumbtck)
        
        let blue_thumbtck2 = SKSpriteNode(imageNamed: "blue_thumbtck")
        blue_thumbtck2.position = CGPoint(x: self.size.width*0.9, y: self.size.height*0.5)
        blue_thumbtck2.scaleTo(screenWidthPercentage: 0.05)
        blue_thumbtck2.zPosition = 1
        blue_thumbtck2.physicsBody = SKPhysicsBody(texture: blue_thumbtck.texture!,
                                            size: CGSize(width: blue_thumbtck.size.width, height: blue_thumbtck.size.height))
        blue_thumbtck2.physicsBody!.affectedByGravity = false
        blue_thumbtck2.physicsBody!.categoryBitMask = obstacleCategory
        blue_thumbtck2.physicsBody!.collisionBitMask = None
        blue_thumbtck2.physicsBody!.contactTestBitMask = vroombaCategory
        self.addChild(blue_thumbtck2)
        
        let redknife = SKSpriteNode(imageNamed: "redknife")
        redknife.position = CGPoint(x: self.size.width*0.6, y: self.size.height*0.15)
        redknife.scaleTo(screenWidthPercentage: 0.08)
        redknife.zPosition = 1
        redknife.physicsBody = SKPhysicsBody(texture: redknife.texture!,
                                            size: CGSize(width: redknife.size.width, height: redknife.size.height))
        redknife.physicsBody!.affectedByGravity = false
        redknife.physicsBody!.categoryBitMask = obstacleCategory
        redknife.physicsBody!.collisionBitMask = None
        redknife.physicsBody!.contactTestBitMask = vroombaCategory
        self.addChild(redknife)
        
        let charger = SKSpriteNode(imageNamed: "charger")
        charger.scaleTo(screenWidthPercentage: 0.15)
        charger.zPosition = 1
        charger.position = CGPoint(x: self.size.width*0.8, y: self.size.height*0.8)
        charger.physicsBody = SKPhysicsBody(texture: charger.texture!,
                                            size: CGSize(width: charger.size.width, height: charger.size.height))
        charger.physicsBody!.affectedByGravity = false
        charger.physicsBody!.categoryBitMask = chargerCategory
        charger.physicsBody!.collisionBitMask = None
        charger.physicsBody!.contactTestBitMask = vroombaCategory
        self.addChild(charger)
        
        let batteryFrame = SKSpriteNode(imageNamed: "HealthBar")
        batteryFrame.position = CGPoint(x: self.size.width*0.05, y: self.size.height*0.02)
        batteryFrame.anchorPoint = CGPoint(x:0.0, y:0.0)
        batteryFrame.scaleTo(screenWidthPercentage: 0.2)
        batteryFrame.zPosition = 11

        self.addChild(batteryFrame)

        
        HealthBar.position = CGPoint(x: self.size.width*0.05, y: self.size.height*0.02)
        HealthBar.anchorPoint = CGPoint(x:0.0, y:0.0)
        HealthBar.scaleTo(screenWidthPercentage: 0.2)
        HealthBar.zPosition = 10
        
    
        self.addChild(HealthBar)
        
        var chargingArea = SKShapeNode(rectOf: CGSize(width: charger.size.width*0.6, height: charger.size.height*0.6))
        chargingArea.name = "bar"
        chargingArea.strokeColor = SKColor.clear
//        chargingArea.alpha = 1
        //chargingArea.fillColor = SKColor.white
        chargingArea.zPosition = 5
        chargingArea.position = CGPoint(x: self.size.width*0.8, y: self.size.height*0.77)

        self.addChild(chargingArea)
        
        //Move the vroomba around with your joystick!
        vroomba.scaleTo(screenWidthPercentage: 0.1)
        vroomba.anchorPoint = CGPoint(x: 0.5, y: 0.385)
        vroomba.position = CGPoint(x: self.size.width*0.8, y: self.size.height*0.7)
        vroomba.zPosition = 2
//        vroomba.physicsBody = SKPhysicsBody(circleOfRadius: 40)
        vroomba.physicsBody = SKPhysicsBody(circleOfRadius: vroomba.size.width/2.2)
        vroomba.physicsBody!.affectedByGravity = false
        vroomba.physicsBody!.usesPreciseCollisionDetection = true
        vroomba.physicsBody!.categoryBitMask = vroombaCategory
        vroomba.physicsBody!.collisionBitMask = None
        vroomba.physicsBody!.contactTestBitMask = cleanUpCategory
        vroomba.physicsBody!.contactTestBitMask = obstacleCategory
        
        
        self.addChild(vroomba)
        
        analogJoystick.position = CGPoint(x: self.size.width*0.8, y: self.size.height/4.25)

        self.addChild(analogJoystick)
        
        analogJoystick.trackingHandler = { [unowned self] data in
          vroomba.position = CGPoint(x: vroomba.position.x + (data.velocity.x * velocityMultiplier),
                                       y: vroomba.position.y + (data.velocity.y * velocityMultiplier))
            if (chargingArea.position.x - charger.size.width/2 < vroomba.position.x + vroomba.position.x/14 &&  chargingArea.position.x + charger.size.width/2 > vroomba.position.x - vroomba.position.x/14 && chargingArea.position.y - charger.size.height/2 < vroomba.position.y + vroomba.position.y/14 && chargingArea.position.y + charger.size.height/2 > vroomba.position.y - vroomba.position.y/14 ){
                charging = true
            }
            else{
                charging = false
            }
          vroomba.zRotation = data.angular
        }
        
        //prevents from going out of screen
        let xRange = SKRange(lowerLimit:vroomba.size.height/6,upperLimit:ScreenSize.width-vroomba.size.height/6)
        let yRange = SKRange(lowerLimit:vroomba.size.height/6,upperLimit:ScreenSize.height-vroomba.size.height/6)
        vroomba.constraints = [SKConstraint.positionX(xRange,y:yRange)]  // iOS 10
        
            //if hit scissor, say ouch! (battery decreases)
            //if battery dies -> restart button
        //Great! Now, go to the charger to recharge!
        //That's better :)
        //Cleanup the house while avoiding the obstacles before the timer runs out!
        //Now you're ready to play!
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        var body1 = SKPhysicsBody()
        var body2 = SKPhysicsBody()
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask{
            body1 = contact.bodyA
            body2 = contact.bodyB
        }
        else{
            body1 = contact.bodyB
            body2 = contact.bodyA
        }
        
        if body1.categoryBitMask == vroombaCategory && body2.categoryBitMask == cleanUpCategory{
            //if vroomba hit cleanUp
            body2.node?.removeFromParent()
        }
        
        if body1.categoryBitMask == vroombaCategory && body2.categoryBitMask == obstacleCategory{
            //if vroomba hit obstacle
//            body2.node?.removeFromParent()
            health -= 0.01
            HealthBar.xScale = health
            print("ouch")
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        if charging == false{
            health -= 0.001
            HealthBar.xScale = health
            if health < 0 {
                health = 0
            }
            if health > 1.0{
                health = 1.0
            }
        }
        if charging == true{
            health += 0.001
            HealthBar.xScale = health
            
            if health < 0 {
                health = 0
            }
            if health > 1.0{
                health = 1.0
            }
        }
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
