//
//  Animation.swift
//  SpriteKit Demo
//
//  Created by Raghav Prakash on 8/6/18.
//  Copyright © 2018 Raghav Prakash. All rights reserved.
//

import SpriteKit

class Animation: SKScene {
	
	//MARK: - Declare an image frame from the sprite atlas as a sprite node
	let dogAnimationFrame = SKSpriteNode(imageNamed: "Run0")
	
	//MARK: - Declare an array for the dog frame images as an array of SKTexture nodes.
	var dogAnimationFrames = [SKTexture]()
	
	//MARK: - Declare a reference to the sprite atlas
	let spriteAtlas = SKTextureAtlas(named: "Dog Frames")
	
	//MARK: - When scene is created
	override func didMove(to view: SKView) {
		
		dogAnimationFrame.position = CGPoint(x: frame.midX, y: frame.midY)
		self.addChild(dogAnimationFrame)
		
		// Iterate through the sprite atlas to get each SKTexture and append to the array
		for index in 0..<spriteAtlas.textureNames.count {
			let textureName = "Run\(index)"
			let texture = spriteAtlas.textureNamed(textureName)
			dogAnimationFrames.append(texture)
		}
	}
	
	//MARK: - When user touches anywhere on the screen
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		if let _ = dogAnimationFrame.action(forKey: "run animation") {
			dogAnimationFrame.removeAction(forKey: "run animation")
		} else {
			dogAnimationFrame.run(SKAction.repeatForever(SKAction.animate(with: dogAnimationFrames, timePerFrame: 0.1)), withKey: "run animation")
		}
	}
}
