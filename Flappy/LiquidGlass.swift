import SwiftUI

extension Color {
    public static let amber = Color(red: 1.0, green: 0.75, blue: 0.0)
}

// MARK: - Liquid Glass Specification Components

public struct Glass {
    public var isInteractive: Bool
    public var tintColor: Color?
    
    public init(isInteractive: Bool = false, tintColor: Color? = nil) {
        self.isInteractive = isInteractive
        self.tintColor = tintColor
    }
    
    public static var regular: Glass {
        Glass(isInteractive: false)
    }

    public static var prominent: Glass {
        Glass(isInteractive: true)
    }
    
    public func interactive(_ enabled: Bool = true) -> Glass {
        var copy = self
        copy.isInteractive = enabled
        return copy
    }

    public func tint(_ color: Color) -> Glass {
        var copy = self
        copy.tintColor = color
        return copy
    }
}

public struct GlassEffectContainer<Content: View>: View {
    public var spacing: CGFloat
    public var content: Content

    public init(spacing: CGFloat = 20.0, @ViewBuilder content: () -> Content) {
        self.spacing = spacing
        self.content = content()
    }

    public var body: some View {
        content
    }
}

public struct LiquidGlassCardStyle<S: Shape>: ViewModifier {
    var shape: S
    var isInteractive: Bool
    var tintColor: Color?
    
    public init(shape: S, isInteractive: Bool = true, tintColor: Color? = nil) {
        self.shape = shape
        self.isInteractive = isInteractive
        self.tintColor = tintColor
    }
    
    public func body(content: Content) -> some View {
        content
            .background(
                Group {
                    if let tint = tintColor {
                        shape.fill(tint.opacity(0.2))
                            .background(.ultraThinMaterial, in: shape)
                    } else {
                        shape.fill(.ultraThinMaterial)
                    }
                }
            )
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
    public func liquidGlass<S: Shape>(in shape: S = RoundedRectangle(cornerRadius: 20, style: .continuous), interactive: Bool = true, tint: Color? = nil) -> some View {
        modifier(LiquidGlassCardStyle(shape: shape, isInteractive: interactive, tintColor: tint))
    }
    
    @ViewBuilder
    public func glassEffect(_ glass: Glass = .regular) -> some View {
        liquidGlass(interactive: glass.isInteractive, tint: glass.tintColor)
    }

    @ViewBuilder
    public func glassEffect<S: Shape>(_ glass: Glass = .regular, in shape: S) -> some View {
        liquidGlass(in: shape, interactive: glass.isInteractive, tint: glass.tintColor)
    }

    @ViewBuilder
    public func glassEffect<S: Shape>(in shape: S) -> some View {
        liquidGlass(in: shape)
    }
}



