import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    @State private var showShop = false
    @State private var coins = 142
    
    var body: some View {
        TabView(selection: $selectedTab) {
            GameView(coins: $coins, onOpenShop: { showShop = true })
                .tabItem {
                    Label("Game", systemImage: "gamecontroller.fill")
                }
                .tag(0)
            
            FriendsView()
                .tabItem {
                    Label("Friends", systemImage: "person.2.fill")
                }
                .tag(1)
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
                .tag(2)
        }
        .sheet(isPresented: $showShop) {
            ShopView(coins: $coins)
        }
    }
}

