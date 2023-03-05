MathEnhancer
===============

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

MathEnhancer can be installed in your project using Swift Package Manager. To install it, simply add the following line to your `Package.swift` file:

swift

```swift
dependencies: [
    .package(url: "https://github.com/Iliasnolsson/MathEnhancer", from: "1.0.0")
]
```

Requirements
------------

*   iOS 11.0+ / macOS 10.12+ / tvOS 11.0+ / watchOS 4.0+
*   Xcode 12.0+
*   Swift 5.0+

-------------------
-------------------

`CGPoint` Extension
-------------------

This extension adds useful methods and operator overloads to `CGPoint`. Most of these extension methods are also available for `CGSize`

### `distanceTo(_:)`

Returns the distance between the receiver and the given point.

swift

```swift
let pointA = CGPoint(x: 1, y: 1)
let pointB = CGPoint(x: 4, y: 5)
let distance = pointA.distanceTo(pointB)
// distance == 5.0
```

### `distanceXYTo(_:)`

Returns the distance between the receiver and the given point in x and y components.

swift

```swift
let pointA = CGPoint(x: 1, y: 1)
let pointB = CGPoint(x: 4, y: 5)
let distance = pointA.distanceXYTo(pointB)
// distance == CGPoint(x: 3, y: 4)
```

### `vectorLength`

Returns the length between the receiver and _CGPoint.zero_.

swift

```swift
let pointA = CGPoint(x: 3, y: 4)
let length = pointA.vectorLength
// length == 5.0
```

### `rounded(decimal:)`

Returns a new `CGPoint` that has its x and y coordinates rounded to the given number of decimal places.

swift

```swift
let pointA = CGPoint(x: 3.14159, y: 2.71828)
let roundedPoint = pointA.rounded(decimal: 2)
// roundedPoint == CGPoint(x: 3.14, y: 2.72)
```

### `colinear(_:_:)`

Returns a Boolean indicating whether the three points are collinear.

swift

```swift
let pointA = CGPoint(x: 1, y: 1)
let pointB = CGPoint(x: 2, y: 2)
let pointC = CGPoint(x: 3, y: 3)
let collinear = pointA.colinear(pointB, pointC)
// collinear == true
```

### Operator overloads

The extension also provides operator overloads for `+`, `-`, `*`, and `/` for `CGPoint`.

swift

```swift
let pointA = CGPoint(x: 1, y: 1)
let pointB = CGPoint(x: 2, y: 2)
let sum = pointA + pointB
// sum == CGPoint(x: 3, y: 3)

let difference = pointA - pointB
// difference == CGPoint(x: -1, y: -1)

let product = pointA * 2
// product == CGPoint(x: 2, y: 2)

let quotient = pointA / 2
// quotient == CGPoint(x: 0.5, y: 0.5)
```

### Additional Functionality

*   Rotation of a point around another point: `rotate(around:byDegrees:)` and `rotate(around:byAngle:)`
*   Calculation of the angle between two points and the center of a circle: `angle(inCircleWithCenter:center:toPointOnCircle:)`
*   Scaling of a point: `scale(from:by:)` and `scale(forReaching:byScalingFrom:)`
*   Mathematical operations on points, such as adding or subtracting values from the x or y component: `add(x:)`, `add(y:)`, `subtract(x:)`, `subtract(y:)`, `divide(xBy:)`, `divide(yBy:)`, and `multiply(xBy:)`, `multiply(yBy:)`

Here are some examples of how these methods can be used:

swift

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
