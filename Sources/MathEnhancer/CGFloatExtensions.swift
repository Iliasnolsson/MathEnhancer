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
    
    func rounded(decimal: CGFloat) -> CGFloat {
        return (decimal * self).rounded(.toNearestOrEven) / decimal
    }
    
}

