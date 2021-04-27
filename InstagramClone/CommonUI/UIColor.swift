//
//  UIColor.swift
//  InstagramClone
//
//  Created by Bilel Bouricha on 24/04/2021.
//

import Foundation

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(hex: Int) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF
        )
    }
    
    convenience init?(hex: String) {
        let red, green, blue: CGFloat
        
        if hex.hasPrefix("0x") {
            let start = hex.index(hex.startIndex, offsetBy: 2)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    red = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    green = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    blue = CGFloat(hexNumber & 0x0000ff) / 255
                    
                    self.init(red: red, green: green, blue: blue, alpha: 1.0)
                    return
                }
            }
        }
        
        return nil
    }
}
