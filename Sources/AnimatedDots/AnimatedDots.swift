import SwiftUI

/// Enum representing different dot animation styles.
enum DotAnimationStyle {
    case elastic
    case pulse
    case flashing
    case collision
    case typing
    case falling
    case stretching
}

/// A view that displays a series of animated dots.
///
/// - Parameters:
///   - dotCount: The number of dots to display.
///   - animationStyle: The style of the animation.
///   - dotSize: The size of each dot.
///   - dotSpacing: The spacing between dots.
///   - animationDuration: The duration of the animation.
///   - dotColor: The color of the dots.
struct AnimatedDotsView: View {
    let dotCount: Int
    let animationStyle: DotAnimationStyle
    let dotSize: CGFloat
    let dotSpacing: CGFloat
    let animationDuration: Double
    let dotColor: Color

    var body: some View {
        HStack(spacing: dotSpacing) {
            ForEach(0..<dotCount, id: \.self) { index in
                SingleDotView(
                    index: index,
                    animationStyle: animationStyle,
                    animationDuration: animationDuration,
                    dotSize: dotSize,
                    dotCount: dotCount,
                    dotSpacing: dotSpacing,
                    dotColor: dotColor
                )
            }
        }
    }
}

/// A view representing a single animated dot.
///
/// This view handles the animation logic for a single dot based on the specified animation style.
struct SingleDotView: View {
    let index: Int
    let animationStyle: DotAnimationStyle
    let animationDuration: Double
    let dotSize: CGFloat
    let dotCount: Int
    let dotSpacing: CGFloat
    let dotColor: Color
    
    @State private var isAnimating = false

    var body: some View {
        Circle()
            .fill(dotColor)
            .frame(width: dotSize, height: dotSize)
            .scaleEffect(scaleEffect)
            .opacity(opacity)
            .offset(x: offsetX, y: offsetY)
            .animation(
                animation.delay(animationDelay),
                value: isAnimating
            )
            .onAppear {
                isAnimating = true
            }
    }

    /// Calculates the animation delay based on the animation style and dot index.
    private var animationDelay: Double {
        switch animationStyle {
        case .collision:
            return Double(dotCount - index - 1) * animationDuration / Double(dotCount)
        default:
            return Double(index) * animationDuration / Double(dotCount)
        }
    }

    /// Defines the animation to be applied based on the animation style.
    private var animation: Animation {
        switch animationStyle {
        case .elastic:
            return Animation.interpolatingSpring(stiffness: 50, damping: 1)
                .repeatForever(autoreverses: true)
        case .pulse:
            return Animation.easeInOut(duration: animationDuration)
                .repeatForever(autoreverses: true)
        case .flashing:
            return Animation.linear(duration: animationDuration)
                .repeatForever(autoreverses: true)
        case .collision:
            return Animation.easeInOut(duration: animationDuration)
                .repeatForever(autoreverses: true)
        case .typing:
            return Animation.easeInOut(duration: animationDuration)
                .repeatForever(autoreverses: false)
        case .falling:
            return Animation.interpolatingSpring(stiffness: 50, damping: 5)
                .repeatForever(autoreverses: false)
        case .stretching:
            return Animation.easeInOut(duration: animationDuration)
                .repeatForever(autoreverses: true)
        }
    }

    /// Determines the scale effect based on the animation style.
    private var scaleEffect: CGFloat {
        switch animationStyle {
        case .elastic:
            return isAnimating ? 1.2 : 0.8
        case .pulse:
            return isAnimating ? 1.0 : 0.5
        case .stretching:
            return isAnimating ? 1.5 : 1.0
        case .typing:
            return isAnimating ? 1.0 : 0.0
        default:
            return 1.0
        }
    }

    /// Determines the opacity based on the animation style.
    private var opacity: Double {
        switch animationStyle {
        case .flashing:
            return isAnimating ? 1.0 : 0.3
        case .typing:
            return isAnimating ? 1.0 : 0.0
        default:
            return 1.0
        }
    }

    /// Determines the horizontal offset based on the animation style.
    private var offsetX: CGFloat {
        switch animationStyle {
        case .collision:
            let middleIndex = dotCount / 2
            let distance = CGFloat(index - middleIndex) * (dotSize + dotSpacing)
            return isAnimating ? -distance : 0
        default:
            return 0
        }
    }

    /// Determines the vertical offset based on the animation style.
    private var offsetY: CGFloat {
        switch animationStyle {
        case .elastic:
            return isAnimating ? -10 : 10
        case .falling:
            return isAnimating ? 10 : -10
        default:
            return 0
        }
    }
}
