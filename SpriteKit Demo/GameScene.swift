//
//  GameScene.swift
//  SpriteKit Demo
//
//  Created by Raghav Prakash on 8/5/18.
//  Copyright © 2018 Raghav Prakash. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
	
	//MARK: - Declare node and spriteNodes
	let node = SKNode()
	let spriteNode = SKSpriteNode(color: UIColor.cyan, size: CGSize(width: 200.0, height: 200.0))
	let childSpriteNode = SKSpriteNode(color: UIColor.yellow, size: CGSize(width: 100.0, height: 100.0))
	
	let spaceShipSpriteNode = SKSpriteNode(imageNamed: "spaceship")
	
	//MARK: - When the game scene has its components loaded onto the scene
    override func didMove(to view: SKView) {
		addChild(node)
		
		spriteNode.position = CGPoint(x: frame.midX, y: frame.midY)
		spriteNode.anchorPoint = CGPoint.zero
		spriteNode.zPosition = 1
		addChild(spriteNode)
		
		childSpriteNode.zPosition = 2
		childSpriteNode.position = CGPoint(x: spriteNode.size.width/2, y: spriteNode.size.height/2)
		spriteNode.addChild(childSpriteNode)
		
		spaceShipSpriteNode.position = CGPoint(x: frame.midX, y: frame.midY)
		spaceShipSpriteNode.size = CGSize(width: 100.0, height: 100.0)
		self.addChild(spaceShipSpriteNode)
		
		setUpPhysics()
    }
	
	//MARK: - SKActions when user touches anywhere on the screen
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		/*if !childSpriteNode.hasActions() {
			childSpriteNode.run(SKAction.move(to: CGPoint(x: spriteNode.size.width, y: spriteNode.size.height), duration: 2.0)) {
				self.childSpriteNode.run(SKAction.move(to: CGPoint(x: self.spriteNode.size.width/2, y: self.spriteNode.size.height/2), duration: 2.0))
			}
			childSpriteNode.run(SKAction.sequence([SKAction.repeatForever((SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 2.0))),SKAction.scale(to: 0.9, duration: 2.0)]))
		} else {
			childSpriteNode.removeAllActions()
		}*/
		
		if let _ = childSpriteNode.action(forKey: "rotate forever") {
			childSpriteNode.removeAction(forKey: "rotate forever")
		} else {
			childSpriteNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 2.0)), withKey: "rotate forever")
		}
		
		if let _ = childSpriteNode.action(forKey: "move to top right edge") {
			childSpriteNode.run(SKAction.move(to: CGPoint(x: spriteNode.size.width/2, y:spriteNode.size.height/2), duration: 2.0))
			childSpriteNode.removeAction(forKey: "move to top right edge")
		} else {
			childSpriteNode.run(SKAction.move(to: CGPoint(x: spriteNode.size.width,y: spriteNode.size.height), duration: 2.0), withKey: "move to top right edge")
		}
	}
	
	//MARK: - SKPhysics demo
	func setUpPhysics() {
		// Set up the scene view to have gravity
		self.physicsWorld.gravity = CGVector(dx: -1.0, dy: -2.0) // default for dy = -9.8 (free fall)
		
		// Set up an edge (Static Physics body with no interaction) onto the frame for the spaceship to fall on.
		self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
		
		// Set up a volume (Dynamic Physics body) which is a circle around the spaceship to fall onto the frame edge.
		spaceShipSpriteNode.physicsBody = SKPhysicsBody(circleOfRadius: spaceShipSpriteNode.size.width/2)
		
		// Allow the spaceship to rotate after colliding
		spaceShipSpriteNode.physicsBody!.allowsRotation = true
		
		// Make the spaceship bounce after collision by retaining all the energy after collision
		spaceShipSpriteNode.physicsBody!.restitution = CGFloat(1.0)
		
		// Do the same stuff for the childSpriteNode as well
		childSpriteNode.physicsBody = SKPhysicsBody(rectangleOf: childSpriteNode.size)
		childSpriteNode.physicsBody!.allowsRotation = true
		childSpriteNode.physicsBody!.restitution = CGFloat(1.0)
	}
}
