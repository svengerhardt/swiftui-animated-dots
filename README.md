# AnimatedDotsView - SwiftUI Loading Animations

A SwiftUI component that displays animated dots to indicate loading or background activity, with customizable styles, colors, and animations.

## Features

- Multiple animation styles:
  - Elastic
  - Pulse
  - Flashing
  - Collision
  - Typing
  - Falling
  - Stretching
  
- Customizable parameters:
  - Number of dots
  - Dot size
  - Dot color
  - Animation duration
  - Dot spacing
  
  
## Installation

In your `Package.swift` Swift Package Manager manifest, add the following dependency to your `dependencies` argument:

```swift
.package(url: "https://github.com/svengerhardt/swiftui-animated-dots.git", branch: "main")
```  
  
## Usage

### Basic Usage

To display the `AnimatedDotsView`, simply create an instance and include it in your SwiftUI view hierarchy.

```swift
AnimatedDotsView(
    dotCount: 3,
    animationStyle: .flashing,
    dotSize: 10,
    dotSpacing: 5,
    animationDuration: 0.6,
    dotColor: .black
)
```

### Parameters

The number of dots to display

- `dotCount: Int`

The animation style to apply

- `animationStyle: DotAnimationStyle`

    Available options:

    - `.elastic`
    - `.pulse`
    - `.flashing`
    - `.collision`
    - `.typing`
    - `.falling`
    - `.stretching`

The size (width and height) of each dot

- `dotSize: CGFloat`

The horizontal spacing between dots

- `dotSpacing: CGFloat`

The duration of the animation in seconds

- `animationDuration: Double`

The color of the dots

- `dotColor: Color`


## Example Integration

Here’s how you might integrate AnimatedDotsView into an existing SwiftUI view.

```swift
import SwiftUI
import AnimatedDots

struct LoadingView: View {
    var body: some View {
        VStack {
            Text("Loading...")
                .font(.headline)
            AnimatedDotsView(
                dotCount: 3,
                animationStyle: .flashing,
                dotSize: 10,
                dotSpacing: 5,
                animationDuration: 0.8,
                dotColor: .gray
            )
        }
    }
}
```

## License

This code is available under the MIT License.

## Acknowledgments

Inspired by various CSS loading animations and adapted for SwiftUI.
