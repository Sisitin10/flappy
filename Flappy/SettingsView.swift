import SwiftUI

struct SettingsView: View {
    @State private var soundEnabled = true
    @State private var hapticsEnabled = true
    
    var body: some View {
        NavigationStack {
            List {
                // Apple Account Profile Section (Matches user reference image)
                Section {
                    HStack(spacing: 16) {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 60, height: 60)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Danny Rico")
                                .font(.headline)
                            Text("Apple Account, iCloud+, and Game Stats")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 4)
                }
                
                Section("Customization") {
                    NavigationLink("Change Avatar & PFP", destination: Text("PFP Customizer"))
                    NavigationLink("Account Credentials", destination: Text("Account Editor"))
                }
                
                Section("Game Controls") {
                    Toggle("Sound FX", isOn: $soundEnabled)
                    Toggle("Haptic Feedback", isOn: $hapticsEnabled)
                }
                
                Section("App Information") {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.2.0 (Build 3)")
                            .foregroundColor(.gray)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Settings")
        }
    }
}
