//
//  Extensions for Math.swift
//  Final Animation
//
//  Created by Ilias Nikolaidis Olsson on 2021-06-18.
//

import Foundation
import CoreGraphics

public extension Int {
  var cgFloat: CGFloat {
    return CGFloat(self)
  }
}

public extension Double {
  var cgFloat: CGFloat {
    return CGFloat(self)
  }
}

public extension CGFloat {
  
  
  /**
   Interpolates the receiver to the given number by Amount.
   - Parameter toNumber: The number to interpolate to.
   - Parameter amount: The amount to interpolate from 0-1
   
   ```
   let number = 5
   let interpolated = number.interpolateTo(10, amount: 0.5)
   print(interpolated)
   // Result: 7.5
   ```
   
   1. The amount can be greater than one and less than zero. The interpolation will not be clipped.
   */
  
  /**
   Returns a value that is clamped between the two numbers
   
   1. The order of arguments does not matter.
   */
  func clamp(_ a: CGFloat, _ b: CGFloat) -> CGFloat {
    return CGFloat(Double(self).clamp(Double(a), Double(b)))
  }
  
  /**
   Returns the difference between the receiver and the given number.
   - Parameter absolute: If *true* (Default) the returned value will always be positive.
   */
  func diff(_ a: CGFloat, absolute: Bool = true) -> CGFloat {
    return absolute ? abs(a - self) : a - self
  }
  
  func toRadians() -> CGFloat { return self * .pi / 180 }
  func toDegrees() -> CGFloat { return self * 180 / .pi }
  
}

public extension Double {
  
  /**
   Interpolates the receiver to the given number by Amount.
   - Parameter toNumber: The number to interpolate to.
   - Parameter amount: The amount to interpolate from 0-1
   
   ```
   let number = 5
   let interpolated = number.interpolateTo(10, amount: 0.5)
   print(interpolated)
   // Result: 7.5
   ```
   
   1. The amount can be greater than one and less than zero. The interpolation will not be clipped.
   */
  
  func remap(fromLow: Double, fromHigh: Double, toLow: Double, toHigh: Double) -> Double {
    return toLow + (self - fromLow) * (toHigh - toLow) / (fromHigh - fromLow)
  }
  
  /**
   Returns a value that is clamped between the two numbers
   
   1. The order of arguments does not matter.
   */
  func clamp(_ a: Double, _ b: Double) -> Double {
    let minValue = a <= b ? a : b
    let maxValue = a <= b ? b : a
    return max(min(self, maxValue), minValue)
  }
  
}

public extension CGRect {
  
  /// Initializes a new CGRect with a center point and size.
  init(center: CGPoint, size: CGSize) {
    self.init(x: center.x - (size.width * 0.5),
              y: center.y - (size.height * 0.5),
              width: size.width,
              height: size.height)
  }
  
  /// Returns the total area of the rect.
  var area: CGFloat {
    return width * height
  }
  
  
  /// The center point of the rect. Settable.
  var center: CGPoint {
    get {
      return CGPoint(x: midX, y: midY)
    }
    set {
      origin = CGPoint(x: newValue.x - (size.width * 0.5),
                       y: newValue.y - (size.height * 0.5))
    }
  }
  
  /// The top left point of the rect. Settable.
  var topLeft: CGPoint {
    get {
      return CGPoint(x: minX, y: minY)
    }
    set {
      origin = CGPoint(x: newValue.x,
                       y: newValue.y)
    }
  }
  
  /// The bottom left point of the rect. Settable.
  var bottomLeft: CGPoint {
    get {
      return CGPoint(x: minX, y: maxY)
    }
    set {
      origin = CGPoint(x: newValue.x,
                       y: newValue.y - size.height)
    }
  }
  
  /// The top right point of the rect. Settable.
  var topRight: CGPoint {
    get {
      return CGPoint(x: maxX, y: minY)
    }
    set {
      origin = CGPoint(x: newValue.x - size.width,
                       y: newValue.y)
    }
  }
  
  /// The bottom right point of the rect. Settable.
  var bottomRight: CGPoint {
    get {
      return CGPoint(x: maxX, y: maxY)
    }
    set {
      origin = CGPoint(x: newValue.x - size.width,
                       y: newValue.y - size.height)
    }
  }
  
  /**
   Interpolates the receiver to the given rect by Amount.
   - Parameter to: The rect to interpolate to.
   - Parameter amount: The amount to interpolate from 0-1
   
   ```
   let rect = CGRect(x:0, y:0, width: 50, height: 50)
   let interpolated = rect.interpolateTo(CGRect(x:100, y:100, width: 100, height: 100), amount: 0.5)
   print(interpolated)
   // Result: (x: 50, y: 50, width: 75, height: 75)
   ```
   
   1. The amount can be greater than one and less than zero. The interpolation will not be clipped.
   */
  
}

infix operator +|
infix operator +-

public extension CGSize {
  
  /**
   Interpolates the receiver to the given size by Amount.
   - Parameter to: The size to interpolate to.
   - Parameter amount: The amount to interpolate from 0-1
   
   ```
   let size = CGSize(width: 50, height: 50)
   let interpolated = rect.interpolateTo(CGSize(width: 100, height: 100), amount: 0.5)
   print(interpolated)
   // Result: (width: 75, height: 75)
   ```
   
   1. The amount can be greater than one and less than zero. The interpolation will not be clipped.
   */
  /// Returns the scale float that will fit the receive inside of the given size.
  func scaleThatFits(_ size: CGSize) -> CGFloat {
    return CGFloat.minimum(width / size.width, height / size.height)
  }
  
  /// Adds receiver size to give size.
  func add(_ size: CGSize) -> CGSize {
    return CGSize(width: width + size.width, height: height + size.height)
  }
  
  /// Subtracts given size from receiver size.
  func subtract(_ size: CGSize) -> CGSize {
    return CGSize(width: width - size.width, height: height - size.height)
  }
  
  /// Multiplies receiver size by the given size.
  func multiply(_ size: CGSize) -> CGSize {
    return CGSize(width: width * size.width, height: height * size.height)
  }
  
  /// Operator convenience to add sizes with +
  static func +(left: CGSize, right: CGSize) -> CGSize {
    return left.add(right)
  }
  
  /// Operator convenience to subtract sizes with -
  static func -(left: CGSize, right: CGSize) -> CGSize {
    return left.subtract(right)
  }
  
  /// Operator convenience to multiply sizes with *
  static func *(left: CGSize, right: CGFloat) -> CGSize {
    return CGSize(width: left.width * right, height: left.height * right)
  }
  
    /// Operator convenience to divide points with /
    static func / (lhs: CGSize, rhs: CGFloat) -> CGSize {
        return CGSize(width: lhs.width / CGFloat(rhs), height: lhs.height / CGFloat(rhs))
    }
    
    static func +|(left: CGSize, right: CGFloat) -> CGSize {
        return CGSize(width: left.width, height: left.height + right)
    }
    
    static func +-(left: CGSize, right: CGFloat) -> CGSize {
        return CGSize(width: left.width + right, height: left.height)
    }
    
}

/// A struct that defines a line segment with two CGPoints
public struct CGLine {
  
  /// The Start of the line segment.
  var start: CGPoint
  /// The End of the line segment.
  var end: CGPoint
  
  /// Initializes a line segment with start and end points
  init(start: CGPoint, end: CGPoint) {
    self.start = start
    self.end = end
  }
  
  /// The length of the line segment.
  var length: CGFloat {
    return end.distanceTo(start)
  }
  
  /// Returns a line segment that is normalized to a length of 1
  func normalize() -> CGLine {
    let len = length
    guard len > 0  else {
      return self
    }
    let relativeEnd = end - start
    let relativeVector = CGPoint(x: relativeEnd.x / len, y: relativeEnd.y / len)
    let absoluteVector = relativeVector + start
    return CGLine(start: start, end: absoluteVector)
  }
  
  /// Trims a line segment to the given length
  func trimmedToLength(_ toLength: CGFloat) -> CGLine {
    let len = length
    guard len > 0  else {
      return self
    }
    let relativeEnd = end - start
    let relativeVector = CGPoint(x: relativeEnd.x / len, y: relativeEnd.y / len)
    let sizedVector = CGPoint(x: relativeVector.x * toLength, y: relativeVector.y * toLength)
    let absoluteVector = sizedVector + start
    return CGLine(start: start, end: absoluteVector)
  }
  
  /// Flips a line vertically and horizontally from the start point.
  func flipped() -> CGLine {
    let relativeEnd = end - start
    let flippedEnd = CGPoint(x: relativeEnd.x * -1, y: relativeEnd.y * -1)
    return CGLine(start: start, end: flippedEnd + start)
  }
  
  /// Move the line to the new start point.
  func transpose(_ toPoint: CGPoint) -> CGLine {
    let diff = toPoint - start
    let newEnd = end + diff
    return CGLine(start: toPoint, end: newEnd)
  }
  
}

public extension CGPoint {
  
  /// Returns the distance between the receiver and the given point.
  func distanceTo(_ a: CGPoint) -> CGFloat {
    let xDist = a.x - x
    let yDist = a.y - y
    return CGFloat(sqrt((xDist * xDist) + (yDist * yDist)))
  }
    
    func distanceXYTo(_ a: CGPoint) -> CGPoint {
        let xDist = abs(a.x - x)
        let yDist = abs(a.y - y)
        return .init(x: xDist, y: yDist)
    }
    
    func translation(to point: CGPoint) -> CGPoint {
        return point - self
    }
  
  /// Returns the length between the receiver and *CGPoint.zero*
  var vectorLength: CGFloat {
    return distanceTo(.zero)
  }
  
  func rounded(decimal: CGFloat) -> CGPoint {
    return CGPoint(x: (round(decimal * x) / decimal), y: (round(decimal * y) / decimal))
  }
  
  /**
   Interpolates the receiver to the given Point by Amount.
   - Parameter to: The Point to interpolate to.
   - Parameter amount: The amount to interpolate from 0-1
   
   ```
   let point = CGPoint(width: 50, height: 50)
   let interpolated = rect.interpolateTo(CGPoint(width: 100, height: 100), amount: 0.5)
   print(interpolated)
   // Result: (x: 75, y: 75)
   ```
   
   1. The amount can be greater than one and less than zero. The interpolation will not be clipped.
   */
  
  func colinear(_ a: CGPoint, _ b: CGPoint) -> Bool {
    let area = x * (a.y - b.y) + a.x * (b.y - y) + b.x * (y - a.y);
    let accuracy: CGFloat = 0.05
    if area < accuracy && area > -accuracy {
      return true
    }
    return false
  }
  
  /// Subtracts the given point from the receiving point.
  func subtract(_ point: CGPoint) -> CGPoint {
    return CGPoint(x: x - point.x,
                   y: y - point.y)
  }
  
  /// Adds the given point from the receiving point.
  func add(_ point: CGPoint) -> CGPoint {
    return CGPoint(x: x + point.x,
                   y: y + point.y)
  }
  
  var isZero: Bool {
    return (x == 0 && y == 0)
  }
  
  /// Operator convenience to divide points with /
  static func / (lhs: CGPoint, rhs: CGFloat) -> CGPoint {
    return CGPoint(x: lhs.x / CGFloat(rhs), y: lhs.y / CGFloat(rhs))
  }
  
  /// Operator convenience to multiply points with *
  static func * (lhs: CGPoint, rhs: CGFloat) -> CGPoint {
    return CGPoint(x: lhs.x * CGFloat(rhs), y: lhs.y * CGFloat(rhs))
  }
  
  /// Operator convenience to add points with +
  static func +(left: CGPoint, right: CGPoint) -> CGPoint {
    return left.add(right)
  }
  
  /// Operator convenience to subtract points with -
  static func -(left: CGPoint, right: CGPoint) -> CGPoint {
    return left.subtract(right)
  }
  
  static func +|(left: CGPoint, right: CGFloat) -> CGPoint {
    return CGPoint(x: left.x, y: left.y + right)
  }
  
  static func +-(left: CGPoint, right: CGFloat) -> CGPoint {
    return CGPoint(x: left.x + right, y: left.y)
  }
    
}

