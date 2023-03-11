# MathEnhancer

MathEnhancer is a Swift package that provides extensions to the Swift math library. It includes a range of useful math functions and utility methods that expand upon the functionality of the Swift core library.

Features
--------

*   Interpolation functions for `CGFloat` and `Double`.
*   Clamping functions for `CGFloat` and `Double`.
*   Trimming and normalizing functions for `CGLine`.
*   Convenience methods for manipulating `CGSize`, including addition, subtraction, multiplication, and division.
*   Additional functionality for `CGPoint`, including distance calculations, colinearity checks, and arithmetic operations.


Installation
------------

To use MathEnhancer in your Swift project, simply add it as a dependency in your `Package.swift` file:

swift

```swift
dependencies: [
    .package(url: "https://github.com/username/MathEnhancer", from: "1.0.0")
]
```

After adding the package, you can import it into your Swift file and use it with the standard `CGPoint`, `CGSize`, and `CGFloat` types:

swift

```swift
import MathEnhancer

// Using the `+` operator on a `CGPoint`
let pointA = CGPoint(x: 10, y: 20)
let pointB = CGPoint(x: 5, y: 10)
let sum = pointA + pointB // CGPoint(x: 15, y: 30)

// Using the `*` operator on a `CGSize`
let sizeA = CGSize(width: 10, height: 20)
let sizeB = CGSize(width: 2, height: 3)
let product = sizeA * sizeB // CGSize(width: 20, height: 60)

// Using the `-` operator on a `CGFloat`
let floatA: CGFloat = 10.0
let floatB: CGFloat = 5.0
let difference = floatA - floatB // 5.0
```

Requirements
------------

*   iOS 11.0+ / macOS 10.12+ / tvOS 11.0+ / watchOS 4.0+
*   Xcode 12.0+
*   Swift 5.6+

-------------------
Usage
-----

MathEnhancer adds the `Operable` protocol and several extensions to common types, including:

*   `Int`
*   `CGFloat`
*   `Float`
*   `Double`
*   `CGPoint`
*   `CGSize`

MathEnhancer makes it easy to perform mathematical operations on `CGPoint`, `CGSize`, and `CGFloat` types. Here are some examples of how you can use the package to simplify your code:

```swift
import MathEnhancer

// Interpolating between two `CGPoint` values
let pointA = CGPoint(x: 10, y: 20)
let pointB = CGPoint(x: 50, y: 100)
let interpolatedPoint = pointA.interpolateTo(pointB, amount: 0.5) // CGPoint(x: 30, y: 60)

// Scaling a `CGSize` to fit inside another `CGSize`
let sizeA = CGSize(width: 100, height: 200)
let sizeB = CGSize(width: 50, height: 50)
let scale = sizeA.scaleThatFits(sizeB) // 0.25

// Adding a `CGFloat` to a `CGSize` or `CGPoint`
let pointA = CGPoint(x: 10, y: 20)
let sizeA = CGSize(width: 50, height: 100)
let addedPoint = pointA +| 5 // CGPoint(x: 10, y: 25)
let addedSize = sizeA +| 10 // CGSize(width: 50, height: 110)

// Subtracting a `CGFloat` from a `CGSize` or `CGPoint`
let pointA = CGPoint(x: 10, y: 20)
let sizeA = CGSize(width: 50, height: 100)
let subtractedPoint = pointA +- 5 // CGPoint(x: 15, y: 20)
let subtractedSize = sizeA *- 0.5 // CGSize(width: 25, height: 50)
```

In addition to the above examples, MathEnhancer also provides an `Operable` protocol, which allows you to perform mathematical operations on custom types as well. Here's an example of how you can use `Operable` to extend

Conforming to `Operable`
--------

MathEnhancer can be extended to support additional types as well. For example, let's say you have a custom `Vector2D` struct:

```swift
struct Vector2D {
    var x: CGFloat
    var y: CGFloat
}
```

You can make `Vector2D` operable by extending it to conform to `Operable`:


```swift
extension Vector2D: Operable {
    static func +(left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
    
    static func -(left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x - right.x, y: left.y - right.y)
    }
    
    static func *(left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x * right.x, y: left.y * right.y)
    }
    
    static func /(left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x / right.x, y: left.y / right.y)
    }
}
```

You can now use `+`, `-`, `*`, and `/` on `Vector2D` objects:


```swift
let vectorA = Vector2D(x: 2.0, y: 4.0)
let vectorB = Vector2D(x: 3.0, y: 6.0)
let vectorC = vectorA + vectorB 
```

Extending `Operable`
--------------------

In addition to the standard mathematical operations provided by `Operable`, you can also extend it to add custom operations. Here's an example of how you can create an extension to add a `pow` function to `Operable`, which raises a value to a given power:


```swift
public extension Operable {
    
    /// Raises the value to the given power
    static func pow(_ value: Self, power: Int) -> Self {
        var result = value
        for _ in 1..<power {
            result = result * value
        }
        return result
    }
    
}
```

With this extension, you can now use the `pow` function on any type that conforms to `Operable`. Here's an example of how you can use it on both `CGFloat` and `CGPoint`:


```swift
import MathEnhancer

let floatA: CGFloat = 2.0
let floatB = CGFloat.pow(floatA, power: 3) // 8.0

let pointA = CGPoint(x: 2, y: 3)
let pointB = CGPoint.pow(pointA, power: 2) // CGPoint(x: 4, y: 9)
```

In the example above, `pow` is used to raise a `CGFloat` value to the power of 3, and a `CGPoint` to the power of 2. Since both types conform to `Operable`, the `pow` function can be used on them.

`CGPoint` Extension
-------------------

This extension adds useful methods and operator overloads to `CGPoint`. Most of these extension methods are also available for `CGSize`

### `distanceTo(_:)`

Returns the distance between the receiver and the given point.


```swift
let pointA = CGPoint(x: 1, y: 1)
let pointB = CGPoint(x: 4, y: 5)
let distance = pointA.distanceTo(pointB)
// distance == 5.0
```

### `distanceXYTo(_:)`

Returns the distance between the receiver and the given point in x and y components.

```swift
let pointA = CGPoint(x: 1, y: 1)
let pointB = CGPoint(x: 4, y: 5)
let distance = pointA.distanceXYTo(pointB)
// distance == CGPoint(x: 3, y: 4)
```

### `vectorLength`

Returns the length between the receiver and _CGPoint.zero_.


```swift
let pointA = CGPoint(x: 3, y: 4)
let length = pointA.vectorLength
// length == 5.0
```

### `rounded(decimal:)`

Returns a new `CGPoint` that has its x and y coordinates rounded to the given number of decimal places.


```swift
let pointA = CGPoint(x: 3.14159, y: 2.71828)
let roundedPoint = pointA.rounded(decimal: 2)
// roundedPoint == CGPoint(x: 3.14, y: 2.72)
```

### `colinear(_:_:)`

Returns a Boolean indicating whether the three points are collinear.


```swift
let pointA = CGPoint(x: 1, y: 1)
let pointB = CGPoint(x: 2, y: 2)
let pointC = CGPoint(x: 3, y: 3)
let collinear = pointA.colinear(pointB, pointC)
// collinear == true
```

### Additional Functionality

*   Rotation of a point around another point: `rotate(around:byDegrees:)` and `rotate(around:byAngle:)`
*   Calculation of the angle between two points and the center of a circle: `angle(inCircleWithCenter:center:toPointOnCircle:)`
*   Scaling of a point: `scale(from:by:)` and `scale(forReaching:byScalingFrom:)`
*   Mathematical operations on points, such as adding or subtracting values from the x or y component: `add(x:)`, `add(y:)`, `subtract(x:)`, `subtract(y:)`, `divide(xBy:)`, `divide(yBy:)`, and `multiply(xBy:)`, `multiply(yBy:)`

Here are some examples of how these methods can be used:


```swift
let point1 = CGPoint(x: 10, y: 10)
let point2 = CGPoint(x: 20, y: 20)

// Calculate the distance between two points
let distance = point1.distanceTo(point2)

// Rotate a point around another point
let center = CGPoint(x: 15, y: 15)
let rotatedPoint = point1.rotate(around: center, byDegrees: 45)

// Scale a point to reach a target point from another point
let target = CGPoint(x: 30, y: 30)
let scaledPoint = point1.scale(forReaching: target, byScalingFrom: center)

// Add or subtract values to/from the x or y component of a point
let point3 = point1.add(x: 5).subtract(y: 2)

// Divide or multiply the x or y component of a point by a value
let point4 = point1.multiply(xBy: 2).divide(yBy: 3)

// Convert a point to a size
let size = CGPoint(x: 100, y: 200).sizeValue
```

---

Author
------

MathEnhancer was developed by Ilias Nikolaidis Olsson.


Contributing
------------

If you'd like to contribute to MathEnhancer, feel free to submit a pull request or open an issue. Your contributions are always welcome!

License
-------

MathEnhancer is released under the MIT license. See [LICENSE](LICENSE.md) for details.
