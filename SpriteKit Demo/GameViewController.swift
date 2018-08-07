//
//  GameViewController.swift
//  SpriteKit Demo
//
//  Created by Raghav Prakash on 8/5/18.
//  Copyright © 2018 Raghav Prakash. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
			//let scene = Animation(size: view.bounds.size)
			//let scene = GameScene(size: view.bounds.size)
			if let scene = SKScene(fileNamed: "TileMapScene") {
				
				// Set the scale mode to scale to fit the window
				scene.scaleMode = .aspectFill
				
				// Present the scene
				view.presentScene(scene)
				
				// View doesn't bother about the order of the nodes added to the game scene (parent-child or sibling relationships)
				view.ignoresSiblingOrder = true
				
				// Debug options to be shown
				view.showsFPS = true
				view.showsNodeCount = true
				view.showsPhysics = true
			}
        }
    }
}
