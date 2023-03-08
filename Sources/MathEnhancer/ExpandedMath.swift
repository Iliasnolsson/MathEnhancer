//
//  Extensions for Math.swift
//  Final Animation
//
//  Created by Ilias Nikolaidis Olsson on 2021-06-18.
//

import CoreGraphics


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

public extension CGPoint {
    
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


