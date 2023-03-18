//
//  File.swift
//  
//
//  Created by Ilias Nikolaidis Olsson on 2023-03-05.
//

import QuartzCore

public extension CGPoint {
    
    init(_ size: CGSize) {
        self.init(x: size.width, y: size.height)
    }
    
    init(xy: CGFloat) {
        self.init(x: xy, y: xy)
    }
    
}

public extension CGRect {
  
  /// Initializes a new CGRect with a center point and size.
  init(center: CGPoint, size: CGSize) {
    self.init(x: center.x - (size.width * 0.5),
              y: center.y - (size.height * 0.5),
              width: size.width,
              height: size.height)
  }
  
}

public extension CGSize {
    
    init(_ point: CGPoint) {
        self.init(width: point.x, height: point.y)
    }
    
    init(wh: CGFloat) {
        self.init(width: wh, height: wh)
    }
    
}
