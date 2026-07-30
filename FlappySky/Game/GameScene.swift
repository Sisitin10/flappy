import SpriteKit
import SwiftUI

class GameScene: SKScene, SKPhysicsContactDelegate {
    var birdNode: SKSpriteNode!
    var isGameOver = false
    
    struct PhysicsCategory {
        static let none: UInt32 = 0
        static let bird: UInt32 = 0x1 << 0
        static let pipe: UInt32 = 0x1 << 1
        static let ground: UInt32 = 0x1 << 2
    }
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0, dy: -6.5)
        
        setupBird()
        startPipeSpawning()
    }
    
    func setupBird() {
        birdNode = SKSpriteNode(color: .red, size: CGSize(width: 32, height: 24))
        birdNode.position = CGPoint(x: frame.midX - 80, y: frame.midY)
        
        birdNode.physicsBody = SKPhysicsBody(rectangleOf: birdNode.size)
        birdNode.physicsBody?.isDynamic = true
        birdNode.physicsBody?.categoryBitMask = PhysicsCategory.bird
        birdNode.physicsBody?.contactTestBitMask = PhysicsCategory.pipe | PhysicsCategory.ground
        
        addChild(birdNode)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard !isGameOver else { return } // CRITICAL: Stop tapping random screen on game over!
        birdNode.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        birdNode.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 14))
    }
    
    func startPipeSpawning() {
        let spawn = SKAction.perform(#selector(spawnPipes), onTarget: self)
        let delay = SKAction.wait(forDuration: 2.2) // Not too close
        run(SKAction.repeatForever(SKAction.sequence([spawn, delay])))
    }
    
    @objc func spawnPipes() {
        // Spawns top/bottom pipes with random heights and gap
    }
}
