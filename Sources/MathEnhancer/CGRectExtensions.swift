//
//  File.swift
//  
//
//  Created by Ilias Nikolaidis Olsson on 2023-03-05.
//

import QuartzCore

public extension CGRect {
    
  
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
  
}
