//
//  File.swift
//  
//
//  Created by Ilias Nikolaidis Olsson on 2023-03-11.
//

import Foundation

public protocol Operable {
    
    static func +(left: Self, right: Self) -> Self
    
    static func -(left: Self, right: Self) -> Self
    
    static func / (lhs: Self, rhs: Self) -> Self
    
    static func *(left: Self, right: Self) -> Self
    
}

