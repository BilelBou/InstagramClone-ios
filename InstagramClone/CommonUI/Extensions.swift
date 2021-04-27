//
//  Extensions.swift
//  InstagramClone
//
//  Created by Bilel Bouricha on 24/04/2021.
//

import Foundation
import UIKit

extension String {
    func safeDatabaseKey() -> String {
        let result = self.replacingOccurrences(of: "@", with: "-")
        return result.replacingOccurrences(of: ".", with: "-")
    }
}

extension UIImage {
    func imageFromIcon(icon: String, color: UIColor = Color.white, fontSize: CGFloat) -> UIImage {
        return UIGraphicsImageRenderer(size: CGSize(width: fontSize, height: fontSize)).image { _ in
            let attributedString = NSAttributedString(string: icon, attributes: [.foregroundColor: color, .font: Font.Icon.custom(with: fontSize)])
            attributedString.draw(at: .zero)
        }
    }
}

