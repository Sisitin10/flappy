import SwiftUI

struct FriendsView: View {
    @State private var searchText = ""
    @State private var selectedSegment = 0
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                // Liquid Glass Native SwiftUI Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search username...", text: $searchText)
                }
                .padding(12)
                .glassEffect(in: RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
                
                Picker("Filter", selection: $selectedSegment) {
                    Text("Friends").tag(0)
                    Text("Pending").tag(1)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                List {
                    Section {
                        HStack {
                            Circle().fill(Color.blue).frame(width: 40, height: 40)
                            VStack(alignment: .leading) {
                                Text("@AlexFlyer")
                                    .font(.headline)
                                Text("High Score: 24 pts")
                                    .font(.caption)
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }
                .listStyle(.insetGrouped)
            }
            .navigationTitle("Friends")
            .background(Color(uiColor: .systemGroupedBackground))
        }
    }
}
