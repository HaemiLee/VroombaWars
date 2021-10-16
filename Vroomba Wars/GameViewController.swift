//
//  GameViewController.swift
//  Vroomba Wars
//
//  Created by Haemi Lee on 2/17/21.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Load the SKScene from 'GameScene.sks'
//        let scene = NextLevelScene(size: CGSize(width: ScreenSize.width, height: ScreenSize.height))
//        let scene = GameScene(size: CGSize(width: ScreenSize.width, height: ScreenSize.height))
//        let scene = MainMenuScene(size: CGSize(width: ScreenSize.width, height: ScreenSize.height))
//        let scene = AboutUsScene(size: CGSize(width: ScreenSize.width, height: ScreenSize.height))
//        let scene = GameInstructions(size: CGSize(width: ScreenSize.width, height: ScreenSize.height))
//        let scene = Multiplayer(size: CGSize(width: ScreenSize.width, height: ScreenSize.height))
//        let scene = GameOverScene(size: CGSize(width: ScreenSize.width, height: ScreenSize.height))
//        let scene = highScoreScene(size: CGSize(width: ScreenSize.width, height: ScreenSize.height))
//        let scene = LevelScene(size: CGSize(width: ScreenSize.width, height: ScreenSize.height))
        let scene = MainMenuScene(size: CGSize(width: ScreenSize.width, height: ScreenSize.height))
//        let scene = MoreLevelsComingSoonScene(size: CGSize(width: ScreenSize.width, height: ScreenSize.height))
//        let scene = LevelScene2(size: CGSize(width: ScreenSize.width, height: ScreenSize.height))
        //Configure the view
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
            
        skView.ignoresSiblingOrder = true
            
        scene.scaleMode = .aspectFill
        
        skView.presentScene(scene)
        }
    

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
