import SwiftUI

struct ShopView: View {
    @Binding var coins: Int
    @Environment(\.dismiss) var dismiss
    @State private var selectedCategory = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Category", selection: $selectedCategory) {
                    Text("Birds").tag(0)
                    Text("World Themes").tag(1)
                }
                .pickerStyle(.segmented)
                .padding()
                
                ScrollView {
                    VStack(spacing: 12) {
                        // Shop Cards with Liquid Glass Styling
                        ForEach(0..<4, id: \.self) { item in
                            HStack {
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 44, height: 44)
                                VStack(alignment: .leading) {
                                    Text("Pixel Bird #\(item + 1)")
                                        .font(.headline)
                                    Text("Equipped with high aerodynamics")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                Button("Equip") {}
                                    .buttonStyle(.borderedProminent)
                            }
                            .padding()
                            .liquidGlass()
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Pixel Store")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}
