import SwiftUI
import SpriteKit

struct GameView: View {
    @Binding var coins: Int
    var onOpenShop: () -> Void
    
    @State private var score = 0
    @State private var isGameOver = false
    
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: 380, height: 600)
        scene.scaleMode = .resizeFill
        return scene
    }
    
    var body: some View {
        ZStack {
            SpriteView(scene: scene)
                .ignoresSafeArea()
            
            // HUD Overlay
            VStack {
                HStack(spacing: 12) {
                    // Score Display
                    HStack(spacing: 6) {
                        Text("SCORE")
                            .font(.system(size: 10, weight: .bold, design: .rounded))
                            .foregroundColor(.secondary)
                        Text("\(score)")
                            .font(.system(size: 18, weight: .bold, design: .monospaced))
                    }
                    .padding(.horizontal, 14)
                    .padding(.vertical, 8)
                    .glassEffect(in: Capsule())
                    
                    Spacer()
                    
                    // Coins counter
                    HStack(spacing: 4) {
                        Image(systemName: "centsign.circle.fill")
                            .foregroundColor(.amber)
                        Text("\(coins)")
                            .font(.system(size: 14, weight: .bold, design: .monospaced))
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .glassEffect(in: Capsule())
                    
                    // Shop Button
                    Button(action: onOpenShop) {
                        Image(systemName: "bag.fill")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(.primary)
                            .padding(10)
                    }
                    .glassEffect(.prominent, in: Circle())
                }
                .padding(.horizontal, 16)
                .padding(.top, 52)
                
                Spacer()
            }
        }
    }
}

