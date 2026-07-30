import SwiftUI

extension Color {
    public static let amber = Color(red: 1.0, green: 0.75, blue: 0.0)
}

public struct Glass {
    public var isInteractive: Bool = true
    
    public init(isInteractive: Bool = true) {
        self.isInteractive = isInteractive
    }
    
    public static var regular: Glass {
        Glass()
    }
    
    public func interactive(_ enabled: Bool = true) -> Glass {
        var copy = self
        copy.isInteractive = enabled
        return copy
    }
}

public struct GlassButtonStyle: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.94 : 1.0)
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
}

extension ButtonStyle where Self == GlassButtonStyle {
    public static var glass: GlassButtonStyle { GlassButtonStyle() }
}

public struct LiquidGlassCardStyle<S: Shape>: ViewModifier {
    var shape: S
    var isInteractive: Bool
    
    public init(shape: S, isInteractive: Bool = true) {
        self.shape = shape
        self.isInteractive = isInteractive
    }
    
    public func body(content: Content) -> some View {
        content
            .background(.ultraThinMaterial, in: shape)
            .overlay(
                shape.stroke(
                    LinearGradient(
                        colors: [.white.opacity(0.8), .white.opacity(0.2)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 1
                )
            )
            .shadow(color: .black.opacity(0.08), radius: 10, x: 0, y: 5)
    }
}

extension View {
    public func liquidGlass<S: Shape>(in shape: S = RoundedRectangle(cornerRadius: 20, style: .continuous), interactive: Bool = true) -> some View {
        modifier(LiquidGlassCardStyle(shape: shape, isInteractive: interactive))
    }
    
    @ViewBuilder
    public func glassEffect() -> some View {
        liquidGlass()
    }

    @ViewBuilder
    public func glassEffect(_ glass: Glass) -> some View {
        liquidGlass(interactive: glass.isInteractive)
    }
    
    @ViewBuilder
    public func glassEffect<S: Shape>(in shape: S) -> some View {
        liquidGlass(in: shape)
    }

    @ViewBuilder
    public func glassEffect<S: Shape>(_ glass: Glass, in shape: S) -> some View {
        liquidGlass(in: shape, interactive: glass.isInteractive)
    }

    @ViewBuilder
    public func interactive(_ enabled: Bool = true) -> some View {
        self
    }
}


