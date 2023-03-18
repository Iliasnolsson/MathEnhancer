//
//  File.swift
//  
//
//  Created by Ilias Nikolaidis Olsson on 2023-03-18.
//

import Foundation

public protocol DecimalValue {
    
    var description: String {get}
    
    func integer() -> Int
    
    func double() -> Double
    
}

public extension DecimalValue {
    
    
    func numberOfDecimals() -> Int {
        let asString = self.description
        var decimalsCounted = 0
        var decimalsToAddIfNotZero = 0
        if let commaIndex = asString.firstIndex(of: ".") {
            let fromIndex = commaIndex.utf16Offset(in: asString) + 1
            let index = asString.index(asString.startIndex, offsetBy: fromIndex)
            let stringAfterComma = asString.suffix(from: index)
            for character in stringAfterComma {
                if character == "0" {
                    decimalsToAddIfNotZero += 1
                } else {
                    decimalsCounted += 1 + decimalsToAddIfNotZero;
                    decimalsToAddIfNotZero = 0
                }
            }
        }
        return decimalsCounted
    }
    
    func string(withDecimals decimals: Int) -> String {
        let maxDecimals = numberOfDecimals()
        if maxDecimals == 0 {
            return integer().description
        }
        return String(format: "%.\( maxDecimals > decimals ? decimals : maxDecimals)f", double())
    }
    
}

extension CGFloat: DecimalValue {
    
    public func integer() -> Int {
        return Int(self)
    }
    
    public func double() -> Double {
        return Double(self)
    }
    
}

extension Double: DecimalValue {
    
    public func integer() -> Int {
        return Int(self)
    }
    
    public func double() -> Double {
        return self
    }
    
}
