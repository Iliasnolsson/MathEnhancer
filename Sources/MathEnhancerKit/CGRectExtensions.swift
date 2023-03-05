//
//  CGRectExtensions.swift
//  Final Animation
//
//  Created by Ilias Nikolaidis Olsson on 2021-06-17.
//

import CoreGraphics

public extension Array where Element == CGRect {
    
    func boundingRect() -> CGRect? {
        var boundingRect = CGRect()
        let leftPoint = self.min {a, b in a.origin.x < b.origin.x}?.origin.x
        var rightPoint: CGFloat? {
            let rectangle = self.max {a, b in (a.origin.x + a.width) < (b.origin.x + b.width)}
            if rectangle != nil {
                return rectangle!.origin.x + rectangle!.width
            }
            return nil
        }
        let topPoint = self.min {a, b in a.origin.y < b.origin.y}?.origin.y
        var bottomPoint: CGFloat? {
            let rectangle = self.max {a, b in (a.origin.y + a.height) < (b.origin.y + b.height)}
            if rectangle != nil {
                return rectangle!.origin.y + rectangle!.height
            }
            return nil
        }
        if leftPoint != nil && rightPoint != nil && topPoint != nil && bottomPoint != nil {
            let center = CGPoint(x: leftPoint! + ((rightPoint! - leftPoint!) / 2), y: topPoint! + ((bottomPoint! - topPoint!) / 2))
            let size = CGSize(width: rightPoint! - leftPoint!, height: bottomPoint! - topPoint!)
            boundingRect.size = size
            boundingRect.origin = CGPoint(x: center.x - size.width / 2, y: center.y - size.height / 2)
            return boundingRect
        }
        return nil
    }
    
}

