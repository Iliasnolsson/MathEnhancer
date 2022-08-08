//
//  ColorExtensions.swift
//  Final Animation
//
//  Created by Ilias Nikolaidis Olsson on 2021-09-26.
//

import UIKit

extension UIColor {
    
    public convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat, colorSpaceIdentifier: CFString = CGColorSpace.sRGB) {
        let colorSpace = CGColorSpace(name: colorSpaceIdentifier)!
        self.init(cgColor: .init(colorSpace: colorSpace, components: [r, g, b, a])!)
    }
    
    public convenience init(r255: CGFloat, g255: CGFloat, b255: CGFloat, a1: CGFloat, colorSpaceIdentifier: CFString = CGColorSpace.sRGB) {
        self.init(r: r255/255, g: g255/255, b: b255/255, a: a1, colorSpaceIdentifier: colorSpaceIdentifier)
    }
    
    public convenience init<T: Color>(light: T, dark: T) {
        self.init { trait in
            return trait.userInterfaceStyle == .light ? light.uiColor() : dark.uiColor()
        }
    }
    
    public convenience init<T: Color>(light: T, dark: T?) {
        self.init { trait in
            return trait.userInterfaceStyle == .light ? light.uiColor() : (dark ?? light).uiColor()
        }
    }
    
    public var lottieColorValue: RGBA {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        return RGBA(r: Double(r), g: Double(g), b: Double(b), a: Double(a))
    }
    
    public static var appTintColor: UIColor {.systemBlue}
    
}
