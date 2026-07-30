import SwiftUI

public struct LiquidGlassCardStyle<S: Shape>: ViewModifier {
    var shape: S
    var isInteractive: Bool
    
    public init(shape: S, isInteractive: Bool = true) {
        self.shape = shape
        self.isInteractive = isInteractive
    }
    
    public func body(content: Content) -> some View {
        content
            .glassEffect(in: shape)
            .interactive(isInteractive)
    }
}

extension View {
    public func liquidGlass<S: Shape>(in shape: S = RoundedRectangle(cornerRadius: 20, style: .continuous), interactive: Bool = true) -> some View {
        modifier(LiquidGlassCardStyle(shape: shape, isInteractive: interactive))
    }
}
