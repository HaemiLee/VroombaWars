//
//  Level2_GameScene.swift
//  Vroomba Wars
//
//  Created by Haemi Lee on 4/6/21.
//

import SpriteKit
import GameplayKit
import AudioToolbox.AudioServices


class Level2_GameScene: SKScene, SKPhysicsContactDelegate  {
    
    
    //GLOBAL DECLARATION -- prevents lag
    var gameScore = 0
    var charging = false;
    var health: CGFloat = 1.0 ; // testing charger
    var HealthBar = SKSpriteNode(imageNamed: "HealthBar_g")
    let scoreLabel = SKLabelNode(fontNamed: "PressStart2P-Regular")
    let highscoreLabel = SKLabelNode(fontNamed: "PressStart2P-Regular")
    let vroomba = SKSpriteNode(imageNamed: "Vroomba")
    var velocityMultiplier: CGFloat = 0.075 //changes speed of Vroomba
    
    let None: UInt32 = 0
    let vroombaCategory:UInt32 = 0b1 //1
    let cleanUpCategory:UInt32 = 0b10 //2
    let obstacleCategory: UInt32 = 0b100 //4
    let chargerCategory: UInt32 = 0b1000 //6 if charge is in contact with vroomba, then increase
    var TimerNode: Int = 45
    var TimerLabel = SKLabelNode(fontNamed: "PressStart2P-Regular")
    var timer = true
    var clean = 0
    var gameOver = false
    var time = 0
   
    
    

    

//    var locationsArray = [CGPoint]()
   
    func saveHighScore() {
       // UserDefaults.standard.set(self.gameScore, forKey: "HIGHSCORE")
        UserDefaults.standard.set(self.gameScore, forKey: "HIGHSCORE2")
    }

    //helped functions to helpd randomize
    func random() -> CGFloat{
        return CGFloat(Float(arc4random())/0xFFFFFFFF)
    }
    func random(min: CGFloat, max: CGFloat) -> CGFloat{
        return random() * (max - min) + min
    }
    
   
    
    enum NodesZPosition: CGFloat {
      case background, vroomba, joystick, cleanUp
    }
    
    lazy var analogJoystick: AnalogJoystick = {
        let js = AnalogJoystick(diameter: ScreenSize.width/9, colors: nil, images: (substrate: #imageLiteral(resourceName: "jSubstrate"), stick: #imageLiteral(resourceName: "jStick")))
        js.setScale(1.5)
        js.position = CGPoint(x: ScreenSize.width * -0.5 + js.radius + 900, y: ScreenSize.height * -0.5 + js.radius - 500)
        js.zPosition = NodesZPosition.joystick.rawValue
        return js
        }()
    
    func SquareCheck(p1:CGPoint, p2:CGPoint, point:CGPoint) -> Bool {
        if point.x > p1.x{
            if point.x < p2.x{
                if point.y > p1.y{
                    if point.y < p2.y{
                        return true
                    }
                }
            }
        }
        return false
    }
    
    func RandPoint(tot_arr: [CGPoint]) -> CGPoint {
        let bad6 = CGPoint(x:2,y:5)
        let bad7 = CGPoint(x:0,y:2.5)
        let bad = CGPoint(x: 0.5, y: 0)
        let bad2 = CGPoint(x: 7, y: 2)
        let bad3 = CGPoint(x: 7, y: 0)
        let bad4 = CGPoint(x: 8.5, y: 4)
        let pos = CGPoint(x: random(min: 1, max: 9), y: random(min: 1, max: 5))
        if SquareCheck(p1: bad3, p2: bad4, point: pos){
            return RandPoint(tot_arr: tot_arr)
        }
        if SquareCheck(p1: bad7, p2: bad6, point: pos){
            return RandPoint(tot_arr: tot_arr)
        }
        if SquareCheck(p1: bad, p2: bad2, point: pos){
            return RandPoint(tot_arr: tot_arr)
        }
        if tot_arr.contains(pos){
            return RandPoint(tot_arr: tot_arr)
        }
        return pos
    }
    
    func randomLocations(num: Int, tot_arr: [CGPoint])->[CGPoint]{
        //attempt at randomizing location using xy grid
        var loc_arr = [CGPoint]()
        var tot_arr1 = tot_arr
        for i in 1...num {
            let new_pos = RandPoint(tot_arr: tot_arr1)
            loc_arr.append(new_pos)
            tot_arr1.append(new_pos)
            }
            
        for i in loc_arr.indices{
            loc_arr[i] = CGPoint(x: random(min:(ScreenSize.width/10) * loc_arr[i].x, max:(ScreenSize.width/10) * loc_arr[i].x+1), y: random(min:((ScreenSize.height*3/5)/5) * loc_arr[i].y, max:((ScreenSize.height*3/5)/5) * loc_arr[i].y+1))
        }
        return loc_arr
    }
    
    func spawnObstacle(location:CGPoint){
        
        //choose a random cleanUp object
        let obstacle_array = ["blue_thumbtck", "bluescissor","blueKnife", "electricalcord", "greenscissor","green_thumbtck","greenKnife", "red_thumbtck", "redScissor", "redknife"]
        let countArray = UInt32(obstacle_array.count)
        let pickOneObstacle = arc4random_uniform(countArray)
        let randomElement = Int(pickOneObstacle)
        
        let obstacle = SKSpriteNode(imageNamed: obstacle_array[randomElement])

        obstacle.position = location
        obstacle.scaleTo(screenWidthPercentage: 0.05)
        obstacle.zPosition = 1
        obstacle.physicsBody = SKPhysicsBody(texture: obstacle.texture!,
                                            size: CGSize(width: obstacle.size.width, height: obstacle.size.height))
        //obstacle.physicsBody!.affectedByGravity = false
        obstacle.physicsBody?.isDynamic = true
        obstacle.physicsBody!.categoryBitMask = obstacleCategory
        obstacle.physicsBody!.collisionBitMask = vroombaCategory
        obstacle.physicsBody!.contactTestBitMask = vroombaCategory
         
        self.addChild(obstacle)
    }
    
    func spawnCleanUp(location:CGPoint){
        
        //choose a random cleanUp object
        let cleanUp_array = ["crumbs", "dustbunny", "waterspill", "greensock", "brg_sock", "pinksock", "redSock", "yellowSock"]
        let countArray = UInt32(cleanUp_array.count)
        let pickOneCleanUp = arc4random_uniform(countArray)
        let randomElement = Int(pickOneCleanUp)
        
        let cleanUp = SKSpriteNode(imageNamed: cleanUp_array[randomElement])

        cleanUp.position = location
        cleanUp.scaleTo(screenWidthPercentage: 0.07)
        cleanUp.zPosition = 1

        cleanUp.physicsBody = SKPhysicsBody(texture: cleanUp.texture!,
                                            size: CGSize(width: cleanUp.size.width, height: cleanUp.size.height))
        //cleanUp.physicsBody!.affectedByGravity = false
        cleanUp.physicsBody!.categoryBitMask = cleanUpCategory
        cleanUp.physicsBody!.collisionBitMask = None
        cleanUp.physicsBody!.contactTestBitMask = vroombaCategory
        clean += 1
        
        self.addChild(cleanUp)
    }
    
    func add_score(){
        self.gameScore += 1
        clean -= 1
        print("cleanup:", clean)
        print(self.TimerNode)
        scoreLabel.text = "SCORE:\(gameScore)"
    }
    
    func subtract_score(){
        scoreLabel.text = "SCORE:\(gameScore)"
        self.gameScore -= 1
    }
    
    
    override func didMove(to view: SKView) {
        
        UserDefaults.standard.set(2, forKey: "currlevel")
        self.physicsWorld.contactDelegate = self
       
        
    
        
        //shows the outline of physics body size
        let skView = self.view as! SKView
        skView.showsFPS = false
        skView.showsNodeCount = true
        skView.showsPhysics = false
        self.physicsWorld.gravity = CGVector(dx: 0,dy: 0)
        
        let scalingFactor = min(self.size.width / 250, self.size.height / 20)
        TimerLabel.fontSize = 3.5*scalingFactor
        TimerLabel.position = CGPoint(x: self.size.width*0.365, y: self.size.height*0.12)
        TimerLabel.zPosition = 100
        TimerLabel.fontColor = UIColor.black
        self.addChild(TimerLabel)
        
       
        TimerLabel.run(SKAction.repeatForever(SKAction.sequence([SKAction.run {
            self.TimerNode -= 1
            //self.time = self.TimerNode

            if self.TimerNode <= 0 {

                self.timer = false
                self.TimerNode = 1
                    }
                    },SKAction.wait(forDuration: 1)])))
        
        //if gameOver == false{
        //}
        
        //score Label
        scoreLabel.text = "SCORE:0"
        let scalingFactor_l = min(self.size.width / 200, self.size.height / 100)
        scoreLabel.fontSize = 3.25*scalingFactor_l
        scoreLabel.fontColor = UIColor.black
        scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        scoreLabel.position = CGPoint(x: self.size.width*0.53, y: self.size.height*0.117)
        scoreLabel.zPosition = 100
        
//        highscoreLabel.text = "High Score: \(self.highScore2) "
//        highscoreLabel.fontSize = 15
//        highscoreLabel.fontColor = UIColor.black
//        highscoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
//        highscoreLabel.position = CGPoint(x: self.size.width*0.75, y: self.size.height*0.85)
//        highscoreLabel.zPosition = 100
        
        
        
        self.addChild(scoreLabel)
        self.addChild(highscoreLabel)

        
        
        // Easy
        var tot_arr = [CGPoint]()
        var loc_arr = randomLocations(num: 14, tot_arr: tot_arr)
        tot_arr = loc_arr
        for i in 1...14{
            spawnCleanUp(location: loc_arr[i-1])
        }
        loc_arr = randomLocations(num: 8, tot_arr: tot_arr)
        for i in 1...8{
            spawnObstacle(location: loc_arr[i-1])
        }
        
        
        
        let background = SKSpriteNode(imageNamed: "SunRoom")
//        let background = SKSpriteNode(imageNamed: "Background")
        
        background.size = self.size
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.scaleTo(screenWidthPercentage: 1.0)
        background.zPosition = 0
        
        self.addChild(background)
        
//        let BacktoMain = SKSpriteNode(imageNamed: "backmainmenutxt")
//        BacktoMain.position = CGPoint(x: self.size.width*0.13, y: self.size.height*0.88)
//        BacktoMain.scaleTo(screenWidthPercentage: 0.12)
//        BacktoMain.zPosition = 2
//        BacktoMain.name = "BacktoMain"
//        self.addChild(BacktoMain)
        
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
        
        let restartButton = SKSpriteNode(imageNamed: "restartButton")
        restartButton.position = CGPoint(x: self.size.width*0.93, y: self.size.height*0.87)
        restartButton.scaleTo(screenWidthPercentage: 0.07)
        restartButton.zPosition = 1
        restartButton.name = "restartButton"
        self.addChild(restartButton)
        
        let scoreFrame = SKSpriteNode(imageNamed: "score_container")
        scoreFrame.position = CGPoint(x: self.size.width*0.45, y: self.size.height*0.13)
        scoreFrame.scaleTo(screenWidthPercentage: 0.45)
        scoreFrame.zPosition = 5
        scoreFrame.name = "scoreFrame"
        self.addChild(scoreFrame)
        
        
        let batteryFrame = SKSpriteNode(imageNamed: "HealthBar")
        batteryFrame.position = CGPoint(x: self.size.width*0.02, y: self.size.height*0.01)
        batteryFrame.anchorPoint = CGPoint(x:0.0, y:0.0)
        batteryFrame.scaleTo(screenWidthPercentage: 0.2)
        batteryFrame.zPosition = 11

        self.addChild(batteryFrame)

        
        HealthBar.position = CGPoint(x: self.size.width*0.02, y: self.size.height*0.01)
        HealthBar.anchorPoint = CGPoint(x:0.0, y:0.0)
        HealthBar.scaleTo(screenWidthPercentage: 0.2)
        HealthBar.zPosition = 10
        
    
        self.addChild(HealthBar)
        
        
        let charger = SKSpriteNode(imageNamed: "charger")
        charger.scaleTo(screenWidthPercentage: 0.15)
        charger.zPosition = 1
        charger.position = CGPoint(x: self.size.width*0.1, y: self.size.height*0.65)
        
        charger.physicsBody = SKPhysicsBody(texture: charger.texture!,
                                            size: CGSize(width: charger.size.width, height: charger.size.height))
        charger.physicsBody!.affectedByGravity = false
        charger.physicsBody!.categoryBitMask = chargerCategory
        charger.physicsBody!.collisionBitMask = None
        charger.physicsBody!.contactTestBitMask = vroombaCategory
        
        self.addChild(charger)
        
//        let vroomba = SKSpriteNode(imageNamed: "Vroomba")
//        vroomba.setScale(1)
        vroomba.scaleTo(screenWidthPercentage: 0.1)
        vroomba.anchorPoint = CGPoint(x: 0.5, y: 0.385)
        vroomba.position = CGPoint(x: self.size.width*0.105, y: self.size.height*0.5)
        vroomba.zPosition = 2
//        vroomba.physicsBody = SKPhysicsBody(circleOfRadius: 40)
        vroomba.physicsBody = SKPhysicsBody(circleOfRadius: vroomba.size.width/2.2)
        //vroomba.physicsBody!.affectedByGravity = false
        vroomba.physicsBody!.categoryBitMask = vroombaCategory
        vroomba.physicsBody!.collisionBitMask = None
        vroomba.physicsBody!.contactTestBitMask = cleanUpCategory
        vroomba.physicsBody!.contactTestBitMask = obstacleCategory
        
        self.addChild(vroomba)
        
        analogJoystick.position = CGPoint(x: self.size.width*0.78, y: self.size.height/4.25)

        self.addChild(analogJoystick)
        
        var chargingArea = SKShapeNode(rectOf: CGSize(width: charger.size.width, height: charger.size.height))
        chargingArea.name = "bar"
        chargingArea.strokeColor = SKColor.clear
        //chargingArea.fillColor = SKColor.white
        chargingArea.zPosition = 5
        chargingArea.position = CGPoint(x: self.size.width*0.1, y: self.size.height*0.65)

        self.addChild(chargingArea)
    
        
        
        
        analogJoystick.trackingHandler = { [unowned self] data in
            // Changes speed of vroomba
            if (health == 0 || timer == false || clean == 0){
                //velocityMultiplier = 0.00
                //print("gamescore", self.gameScore)
            }
            
            
          vroomba.position = CGPoint(x: vroomba.position.x + (data.velocity.x * velocityMultiplier),
                                       y: vroomba.position.y + (data.velocity.y * velocityMultiplier))
            if (chargingArea.position.x - charger.size.width/2 < vroomba.position.x + vroomba.position.x/14 &&  chargingArea.position.x + charger.size.width/2 > vroomba.position.x - vroomba.position.x/14 && chargingArea.position.y - charger.size.height/2 < vroomba.position.y + vroomba.position.y/14 && chargingArea.position.y + charger.size.height/2 > vroomba.position.y - vroomba.position.y/14 ){
                //print("IN CHARGE RANGE")
                charging = true
            }
            else{
                //print("OUT OF CHARGE RANGE")
                charging = false
            }
//            print(vroomba.position)
        
          vroomba.zRotation = data.angular
        }
        
        //prevents from going out of screen
        let xRange = SKRange(lowerLimit:vroomba.size.height/6,upperLimit:ScreenSize.width-vroomba.size.height/6)
        let yRange = SKRange(lowerLimit:vroomba.size.height/6,upperLimit:ScreenSize.height*3/5-vroomba.size.height/6)
        vroomba.constraints = [SKConstraint.positionX(xRange,y:yRange)]  // iOS 10
        if UserDefaults().bool(forKey: "sound") == true{
            MusicPlayer.shared.startBackgroundMusic(backgroundMusicFileName:"gameMusic")
        }
        
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        print("highscore", UserDefaults().integer(forKey: "HIGHSCORE1"))
        
        
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
            if(UserDefaults().bool(forKey: "sound") == true){
                MusicPlayer.shared.playSoundEffect(soundEffect: "champagne_pop")
            }
            //if vroomba hit cleanUp
            print("hit cleanup")
            if (body2.node?.parent != nil){
                body2.node?.removeFromParent()
                add_score()
            }
           
            
            
        }
        
        if body1.categoryBitMask == vroombaCategory && body2.categoryBitMask == obstacleCategory{
            //if vroomba hit obstacle
            //body2.node?.removeFromParent()
            //subtract_score()
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            health -= 0.002
            HealthBar.xScale = health
            print("health decreased")
//            print(health)
        }
        
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        if gameOver == false{
            self.TimerLabel.text = "TIME REMAINING:\(self.TimerNode)"
            if charging == false{
                health -= 0.0005
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
//              print("CHARGING...", health)
            
                if health < 0 {
                    health = 0
                }
                if health > 1.0{
                    health = 1.0
                }
            }
            
            
            if (clean == 0 && timer == true){
                UserDefaults.standard.set(true, forKey: "level3")
                self.gameScore += self.TimerNode
                scoreLabel.text = "SCORE:\(gameScore)"
                //self.TimerLabel.text = "Seconds Remaining: \(time)"
                if self.gameScore > UserDefaults().integer(forKey: "HIGHSCORE2") {
                            saveHighScore()
                    print("New high score!!!")
                    highscoreLabel.text = "High Score: \(UserDefaults().integer(forKey: "HIGHSCORE2")) "
                        }
                MusicPlayer.shared.stopBackgroundMusic()
                self.gameOver = true
                let sceneToMoveTo = NextLevelScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                
            }
            
            if (health == 0 && clean == 0 || timer == false && clean == 0){
                if self.gameScore > UserDefaults().integer(forKey: "HIGHSCORE2") {
                            saveHighScore()
                    print("New high score!!!")
                    highscoreLabel.text = "High Score: \(UserDefaults().integer(forKey: "HIGHSCORE2")) "
                        }
                //self.TimerLabel.text = "Seconds Remaining: \(time)"
                MusicPlayer.shared.stopBackgroundMusic()
                self.gameOver = true
                let sceneToMoveTo = NextLevelScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
            if (health == 0 && clean > 0 || timer == false && clean > 0){
                MusicPlayer.shared.stopBackgroundMusic()
                self.gameOver = true
                let sceneToMoveTo = GameOverScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
            
        }
        
//        print(health)
        //print(charging)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{

            let pointOfTouch = touch.location(in: self)
            let nodeTapped = atPoint(pointOfTouch)

//            if nodeTapped.name == "BacktoMain"{
//                let sceneToMoveTo = MainMenuScene(size: self.size)
//                sceneToMoveTo.scaleMode = self.scaleMode
//                let myTransition = SKTransition.fade(withDuration: 0.5)
//                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
//            }
            if nodeTapped.name == "backToLevels"{
                if(UserDefaults().bool(forKey: "sound") == true){
                    MusicPlayer.shared.playSoundEffect(soundEffect: "champagne_pop")
                }
                MusicPlayer.shared.stopBackgroundMusic()
                let sceneToMoveTo = LevelScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
            if nodeTapped.name == "restartButton"{
                if(UserDefaults().bool(forKey: "sound") == true){
                    MusicPlayer.shared.playSoundEffect(soundEffect: "champagne_pop")
                }
                let sceneToMoveTo = Level2_GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
            if nodeTapped.name == "ResetHighScore" {
                if(UserDefaults().bool(forKey: "sound") == true){
                    MusicPlayer.shared.playSoundEffect(soundEffect: "champagne_pop")
                }
                UserDefaults.standard.set(0, forKey: "HIGHSCORE2")
                highscoreLabel.text = "High Score: \(UserDefaults().integer(forKey: "HIGHSCORE2")) "
            }
        }
    }
    
    
    
}

