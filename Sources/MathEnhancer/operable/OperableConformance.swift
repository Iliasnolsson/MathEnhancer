//
//  File.swift
//  
//
//  Created by Ilias Nikolaidis Olsson on 2023-03-11.
//

import Foundation

extension Int: Operable {
}

extension CGFloat: Operable {
}

extension Float: Operable {
}

extension Double: Operable {
}

extension CGSize: Operable {
}

extension CGPoint: Operable {
}

public extension CGSize {
    
    /// Operator convenience to add sizes with +
    static func +(left: CGSize, right: CGSize) -> CGSize {
        return left.add(right)
    }
    
    /// Operator convenience to subtract sizes with -
    static func -(left: CGSize, right: CGSize) -> CGSize {
        return left.subtract(right)
    }
    
    /// Operator convenience to multiply sizes with *
    static func *(left: CGSize, right: CGSize) -> CGSize {
        return CGSize(width: left.width * right.width, height: left.height * right.height)
    }
    
    /// Operator convenience to divide points with /
    static func / (lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(width: lhs.width / rhs.width, height: lhs.height / rhs.height)
    }
    
}


public extension CGPoint {
    
    /// Operator convenience to add points with +
    static func +(left: CGPoint, right: CGPoint) -> CGPoint {
        return left.add(right)
    }
    
    /// Operator convenience to subtract points with -
    static func -(left: CGPoint, right: CGPoint) -> CGPoint {
        return left.subtract(right)
    }
    
    /// Operator convenience to multiply points with *
    static func *(left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x * right.x, y: left.y * right.y)
    }
    
    /// Operator convenience to divide points with /
    static func / (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x / rhs.x, y: lhs.y / rhs.y)
    }
    
}
