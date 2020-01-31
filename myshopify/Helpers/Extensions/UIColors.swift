//
//  UIColors.swift
//  myshopify
//
//  Created by Ricardo Rabeto on 19/01/2020.
//  Copyright © 2020 Ricardo Rabeto. All rights reserved.
//

import UIKit

enum ApplicationColors{
    static let primary_orange = 0xF57300
    static let splash_screen_background =  0x2D00F5
}
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(hexa: Int) {
        self.init(
            red: (hexa >> 16) & 0xFF,
            green: (hexa >> 8) & 0xFF,
            blue: hexa & 0xFF
        )
    }
}

