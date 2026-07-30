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
                HStack {
                    Text("Score: \(score)")
                        .font(.system(.title3, design: .monospaced))
                        .bold()
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .glassEffect(in: Capsule())
                    
                    Spacer()
                    
                    HStack(spacing: 4) {
                        Image(systemName: "centsign.circle.fill")
                        Text("\(coins)")
                            .font(.system(.body, design: .monospaced))
                            .bold()
                    }
                    .padding(.horizontal, 14)
                    .padding(.vertical, 8)
                    .background(Color.amber)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                }
                .padding(.horizontal, 20)
                .padding(.top, 50)
                
                Spacer()
            }
        }
    }
}
