//
//  UIControlExtensions.swift
//  Final Animation
//
//  Created by Ilias Nikolaidis Olsson on 2021-09-27.
//

import UIKit

@available(iOS 14.0, *)
extension UIControl {
    
    func addTarget(for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping()->()) {
        addAction(UIAction { (action: UIAction) in closure() }, for: controlEvents)
    }
    
}
