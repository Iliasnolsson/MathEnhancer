//
//  File.swift
//  
//
//  Created by Ilias Nikolaidis Olsson on 2023-03-04.
//

import QuartzCore

public extension CGFloat {
    
    func minMax(relativeTo otherFloat: CGFloat) -> (min: CGFloat, max: CGFloat) {
        if self > otherFloat {
            return (otherFloat, self)
        }
        return (self, otherFloat)
    }
    
    func round(nearest: CGFloat) -> CGFloat {
        let n = 1/nearest
        let numberToRound = self * n
        return numberToRound.rounded() / n
    }
    
    func rounded(decimal: Int) -> CGFloat {
        let decimal = decimal.cgFloat
        return (decimal * self).rounded(.toNearestOrEven) / decimal
    }
    
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
    func interpolateTo(_ to: CGFloat, amount: CGFloat) -> CGFloat {
        return self + ((to - self) * CGFloat(amount))
    }
    
    func interpolateTo(_ to: CGFloat, amount: CGFloat, spatialOutTangent: CGPoint?, spatialInTangent: CGPoint?) -> CGFloat {
        return interpolateTo(to, amount: amount)
    }
    
    func remap(fromLow: CGFloat, fromHigh: CGFloat, toLow: CGFloat, toHigh: CGFloat) -> CGFloat {
        guard (fromHigh - fromLow) != 0 else {
            // Would produce NAN
            return 0
        }
        return toLow + (self - fromLow) * (toHigh - toLow) / (fromHigh - fromLow)
    }
    
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

