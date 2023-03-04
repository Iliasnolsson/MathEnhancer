MathEnhancerKit
===============

MathEnhancerKit is a Swift package that provides extensions to the Swift math library. It includes a range of useful math functions and utility methods that expand upon the functionality of the Swift core library.

Features
--------

*   Interpolation functions for `CGFloat` and `Double`.
*   Clamping functions for `CGFloat` and `Double`.
*   Trimming and normalizing functions for `CGLine`.
*   Convenience methods for manipulating `CGSize`, including addition, subtraction, multiplication, and division.
*   Additional functionality for `CGPoint`, including distance calculations, colinearity checks, and arithmetic operations.

CGPoint Extension
-----------------

This extension adds several useful methods to `CGPoint`, including:

### `distanceTo(_:) -> CGFloat`

This method returns the distance between the receiver and the given point.

### `distanceXYTo(_:) -> CGPoint`

This method returns a `CGPoint` that represents the distance between the receiver and the given point along the x and y axes.

### `translation(to:) -> CGPoint`

This method returns a `CGPoint` that represents the translation from the receiver to the given point.

### `vectorLength -> CGFloat`

This property returns the length between the receiver and the point at the origin (`CGPoint.zero`).

### `rounded(decimal:) -> CGPoint`

This method returns a `CGPoint` whose x and y values are rounded to the specified number of decimal places.

### `colinear(_:_:) -> Bool`

This method returns `true` if the three points are collinear with a certain margin of error.

### `subtract(_:) -> CGPoint`

This method returns the result of subtracting the given point from the receiver.

### `add(_:) -> CGPoint`

This method returns the result of adding the given point to the receiver.

### `isZero -> Bool`

This property returns `true` if both x and y values of the receiver are zero.

### Operators

The extension also adds several operator overloads for `CGPoint`, including:

*   `/`: Divide a point by a CGFloat
*   `*`: Multiply a point by a CGFloat
*   `+`: Add two points
*   `-`: Subtract two points
*   `+|`: Add a CGFloat to the y-coordinate of a point
*   `+-`: Add a CGFloat to the x-coordinate of a point

---

> Make it a lot shorter & use code blocks to show examples

---

`CGPoint` Extension
-------------------

This extension adds useful methods and operator overloads to `CGPoint`.

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

---

Installation
------------

MathEnhancerKit can be installed in your project using Swift Package Manager. To install it, simply add the following line to your `Package.swift` file:

swift

```swift
dependencies: [
    .package(url: "https://github.com/<username>/<repo>.git", from: "1.0.0")
]
```

Replace `<username>` and `<repo>` with your GitHub username and the name of your MathEnhancerKit repository.

Requirements
------------

*   iOS 11.0+ / macOS 10.12+ / tvOS 11.0+ / watchOS 4.0+
*   Xcode 12.0+
*   Swift 5.0+

Author
------

MathEnhancerKit was developed by Ilias Nikolaidis Olsson.
