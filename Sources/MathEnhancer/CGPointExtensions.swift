//
//  CGPointExtensions.swift
//  Final Animation
//
//  Created by Ilias Nikolaidis Olsson on 2021-06-09.
//

import CoreGraphics

public extension CGPoint {
    
    func rotate(around: CGPoint, byDegrees: CGFloat) -> CGPoint {
        return rotate(around: around, byAngle: byDegrees)
    }
    
    func rotate(around: CGPoint, byAngle: CGFloat) -> CGPoint {
        let rotationSin = sin(byAngle)
        let rotationCos = cos(byAngle)
        let x = (self.x * rotationCos - self.y * rotationSin) + around.x
        let y = (self.x * rotationSin + self.y * rotationCos) + around.y
        return CGPoint(x: x, y: y)
    }
    
    /// - Returns: Rotation in radians around center
    func rotation(around center: CGPoint) -> CGFloat {
        let deltaX = x - center.x
        let deltaY = y - center.y
        let radians = atan2(deltaY, deltaX)
        return radians
    }
    
    func angle(inCircleWithCenter center: CGPoint, toPointOnCircle: CGPoint) -> CGFloat {
        let p1 = self
        let p2 = toPointOnCircle
        let v1 = CGVector(dx: p1.x - center.x, dy: p1.y - center.y)
        let v2 = CGVector(dx: p2.x - center.x, dy: p2.y - center.y)
        let angle = atan2(v2.dy, v2.dx) - atan2(v1.dy, v1.dx)
        return angle
    }
    
    static func pointOnCircle(withCenter center: CGPoint, radius: CGFloat, atAngle angle: CGFloat) -> CGPoint {
        let x = center.x + radius * cos(angle)
        let y = center.y + radius * sin(angle)
        
        return CGPoint(x: x, y: y)
    }
    
    func scale(from fromPoint: CGPoint, by scale: CGPoint) -> CGPoint {
        let xScaled = (x - fromPoint.x) * scale.x
        let yScaled = (y - fromPoint.y) * scale.y
        return CGPoint(x: xScaled + fromPoint.x, y: yScaled + fromPoint.y)
    }
    
    func scale(forReaching target: CGPoint, byScalingFrom from: CGPoint) -> CGPoint {
        let xScale = (target.x - from.x) / (x - from.x)
        let yScale = (target.y - from.y) / (y - from.y)
        return .init(x: xScale, y: yScale)
    }
    
    func add(x: CGFloat) -> CGPoint {
        return .init(x: self.x + x, y: self.y)
    }
    
    func add(y: CGFloat) -> CGPoint {
        return .init(x: self.x, y: self.y + y)
    }

    func subtract(x: CGFloat) -> CGPoint {
        return .init(x: self.x - x, y: self.y)
    }
    
    func subtract(y: CGFloat) -> CGPoint {
        return .init(x: self.x, y: self.y - y)
    }
    
    func divide(xBy divider: CGFloat) -> CGPoint {
        return .init(x: self.x / divider, y: self.y)
    }
    
    func divide(yBy divider: CGFloat) -> CGPoint {
        return .init(x: self.x, y: self.y / divider)
    }
    
    func multiply(xBy multiplier: CGFloat) -> CGPoint {
        return .init(x: self.x * multiplier, y: self.y)
    }
    
    func multiply(yBy multiplier: CGFloat) -> CGPoint {
        return .init(x: self.x, y: self.y * multiplier)
    }
    
    var sizeValue: CGSize {
        return .init(width: x, height: y)
    }
    
    func max() -> CGFloat {
        return Swift.max(x, y)
    }
    
    func min() -> CGFloat {
        return Swift.min(x, y)
    }
    
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
    
    /**
     Rounds the `CGFloat` to the specified number of decimal places.
     
     - Parameter decimal: The number of decimal places to round to.
     - Returns: A new `CGFloat` rounded.
     */
    func rounded(decimal: Int) -> CGPoint {
        return CGPoint(x: x.rounded(decimal: decimal),
                       y: y.rounded(decimal: decimal))
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
    
}

