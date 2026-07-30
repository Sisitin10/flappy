import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .game
    @State private var showShop = false
    @State private var coins = 142
    
    enum Tab {
        case game, friends, settings
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Screen View Routing
            Group {
                switch selectedTab {
                case .game:
                    GameView(coins: $coins, onOpenShop: { showShop = true })
                case .friends:
                    FriendsView()
                case .settings:
                    SettingsView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // TabBar with Circular Liquid Glass Button on Right Side
            HStack(spacing: 12) {
                HStack {
                    tabButton(title: "Game", icon: "gamecontroller.fill", tab: .game)
                    Spacer()
                    tabButton(title: "Friends", icon: "person.2.fill", tab: .friends)
                    Spacer()
                    tabButton(title: "Settings", icon: "gearshape.fill", tab: .settings)
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 14)
                .glassEffect(in: Capsule())
                
                // Native Circular Liquid Glass Button for Store
                Button {
                    showShop = true
                } label: {
                    Image(systemName: "bag.fill")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.amber)
                        .frame(width: 56, height: 56)
                }
                .buttonStyle(.glass)
                .glassEffect(in: Circle())
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
        }
        .ignoresSafeArea(.all, edges: .top)
        .sheet(isPresented: $showShop) {
            ShopView(coins: $coins)
        }
    }
    
    @ViewBuilder
    private func tabButton(title: String, icon: String, tab: Tab) -> some View {
        Button {
            selectedTab = tab
        } label: {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 18, weight: .bold))
                Text(title)
                    .font(.caption2)
                    .fontWeight(.bold)
            }
            .foregroundColor(selectedTab == tab ? .blue : .gray)
        }
    }
}
