//
//  File.swift
//  
//
//  Created by Ilias Nikolaidis Olsson on 2023-03-08.
//

import QuartzCore

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
    
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
    
}
