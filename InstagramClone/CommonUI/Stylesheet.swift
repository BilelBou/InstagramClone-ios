//
//  Stylesheet.swift
//  InstagramClone
//
//  Created by Bilel Bouricha on 24/04/2021.
//

import Foundation
import UIKit

struct Color {
    static let black: UIColor = UIColor(hex: 0x000000)
    static let lightGray: UIColor = UIColor(hex: 0xAAAAAA)
    static let white: UIColor = UIColor(hex: 0xFFFFFF)
    static let buttonLetter = UIColor(hex: 0x3c94d1)
    static let buttonBackground = UIColor(hex: 0x80c7fb)
}

struct CornerRadius {
    static let _8: CGFloat = 8.0
    static let _16: CGFloat = 16.0
}

struct Margin {
    static let _1: CGFloat = 1
    static let _2: CGFloat = 2
    static let _4: CGFloat = 4
    static let _6: CGFloat = 6
    static let _8: CGFloat = 8
    static let _10: CGFloat = 10
    static let _12: CGFloat = 12
    static let _14: CGFloat = 14
    static let _16: CGFloat = 16
    static let _18: CGFloat = 18
    static let _20: CGFloat = 20
    static let _24: CGFloat = 24
    static let _30: CGFloat = 30
    static let _32: CGFloat = 32
    static let _36: CGFloat = 36
    static let _40: CGFloat = 40
    static let _44: CGFloat = 44
    static let _48: CGFloat = 48
    static let _56: CGFloat = 56
    static let _64: CGFloat = 64
    static let _100: CGFloat = 100
    static let _150: CGFloat = 150

}

enum Font {

    enum System {
        enum Bold {
            static let _18 = custom(with: 18)
            private static func custom(with size: CGFloat) -> UIFont {
                return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.bold)
            }
        }

        enum Regular {
            static let _10 = custom(with: 10)
            static let _20 = custom(with: 20)
            private static func custom(with size: CGFloat) -> UIFont {
                return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.regular)
            }
        }

        enum SemiBold {
            static let _12 = custom(with: 12)
            private static func custom(with size: CGFloat) -> UIFont {
                return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.semibold)
            }
        }
    }
    
    enum Roobert {
        enum Bold {
            static let _12 = custom(with: 12)
            static let _14 = custom(with: 14)
            static let _16 = custom(with: 16)
            static let _18 = custom(with: 18)
            static let _20 = custom(with: 20)
            static let _22 = custom(with: 22)
            static let _24 = custom(with: 24)
            static let _26 = custom(with: 26)
            static let _28 = custom(with: 28)
            static let _32 = custom(with: 32)
            static let _34 = custom(with: 34)
            static let _40 = custom(with: 40)

            private static func custom(with size: CGFloat) -> UIFont {
                guard let font = UIFont(name: "Roobert-Bold", size: size) else { return UIFont() }
                return font
            }
        }

        enum Regular {
            static let _10 = custom(with: 10)
            static let _12 = custom(with: 12)
            static let _14 = custom(with: 14)
            static let _16 = custom(with: 16)
            static let _18 = custom(with: 18)
            static let _20 = custom(with: 20)
            static let _24 = custom(with: 24)
            static let _32 = custom(with: 32)

            static func custom(with size: CGFloat) -> UIFont {
                guard let font = UIFont(name: "Roobert-Regular", size: size) else { return UIFont() }
                return font
            }
        }


        enum DemiBold {
            static let _10 = custom(with: 10)
            static let _12 = custom(with: 12)
            static let _14 = custom(with: 14)
            static let _16 = custom(with: 16)
            static let _18 = custom(with: 18)
            static let _20 = custom(with: 20)
            static let _24 = custom(with: 24)

            static func custom(with size: CGFloat) -> UIFont {
                guard let font = UIFont(name: "Roobert-SemiBold", size: size) else { return UIFont() }
                return font
            }
        }

        enum Heavy {
            static func custom(with size: CGFloat) -> UIFont {
                guard let font = UIFont(name: "Roobert-Heavy", size: size) else { return UIFont() }
                return font
            }
        }
    }

    enum BTBrik {
        enum XXL {
            static func custom(with size: CGFloat) -> UIFont {
                guard let font = UIFont(name: "BTBrikXXL", size: size) else { return UIFont() }
                return font
            }
        }
    }

    enum Menlo {
        enum Bold {
            static let _14 = custom(with: 14)

            private static func custom(with size: CGFloat) -> UIFont {
                guard let font = UIFont(name: "Menlo-Bold", size: size) else { return UIFont() }
                return font
            }
        }

        enum Regular {
            static let _14 = custom(with: 14)

            private static func custom(with size: CGFloat) -> UIFont {
                guard let font = UIFont(name: "Menlo-Regular", size: size) else { return UIFont() }
                return font
            }
        }
    }

    enum Sequel100Wide {
        enum _45 {
            static func custom(with size: CGFloat) -> UIFont {
                guard let font = UIFont(name: "Sequel100Wide-45", size: size) else { return UIFont() }
                return font
            }
        }
        
        enum _95 {
            static let _12 = custom(with: 12)
            static let _16 = custom(with: 16)

            static func custom(with size: CGFloat) -> UIFont {
                guard let font = UIFont(name: "Sequel100Wide-95", size: size) else { return UIFont() }
                return font
            }
        }
    }
    
    enum Regular {
        static let _12 = custom(with: 12)
        static let _14 = custom(with: 14)
        static let _16 = custom(with: 16)
        static let _18 = custom(with: 18)

        private static func custom(with size: CGFloat) -> UIFont {
            return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.regular)
        }
    }

    enum Medium {
        static let _8 = custom(with: 8)
        static let _12 = custom(with: 12)
        static let _14 = custom(with: 14)
        static let _16 = custom(with: 16)
        static let _18 = custom(with: 18)

        private static func custom(with size: CGFloat) -> UIFont {
            return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.medium)
        }
    }

    enum DemiBold {
        static let _10 = custom(with: 10)
        static let _12 = custom(with: 12)
        static let _14 = custom(with: 14)
        static let _16 = custom(with: 16)
        static let _18 = custom(with: 18)
        static let _20 = custom(with: 20)
        static let _32 = custom(with: 32)
        static let _40 = custom(with: 40)

        private static func custom(with size: CGFloat) -> UIFont {
            return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.semibold)
        }
    }

    enum Bold {
        static let _12 = custom(with: 12)
        static let _14 = custom(with: 14)
        static let _16 = custom(with: 16)
        static let _18 = custom(with: 18)
        static let _20 = custom(with: 20)
        static let _26 = custom(with: 26)
        static let _36 = custom(with: 36)

        private static func custom(with size: CGFloat) -> UIFont {
            return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.bold)
        }
    }
}

struct Typography {
    
    enum Style {
        case title1
        case title2
        case title3
        case title3Placeholder
        case title4
        case title5
        case button
        case text
        case textStrong
        case tinyText
        case tinyTextStrong
        case caption
        case captionStrong
        case capsCaption
        case capsCaptionStrong
        case subtitle
        case link
        
        var font: UIFont {
            switch self {
            case .title1:
                return Font.Roobert.Bold._32
            case .title2:
                return Font.Roobert.Bold._28
            case .title3:
                return Font.Roobert.Bold._24
            case .title3Placeholder:
                return Font.Roobert.Regular._24
            case .title4:
                return Font.Roobert.Bold._20
            case .title5:
                return Font.Roobert.Bold._16
            case .button:
                return Font.Roobert.DemiBold._18
            case .text:
                return Font.Roobert.Regular._16
            case .textStrong:
                return Font.Roobert.DemiBold._16
            case .tinyText:
                return Font.Roobert.Regular._14
            case .tinyTextStrong:
                return Font.Roobert.DemiBold._14
            case .caption:
                return Font.Roobert.Regular._12
            case .captionStrong:
                return Font.Roobert.DemiBold._12
            case .capsCaption:
                return Font.Roobert.Regular._10
            case .capsCaptionStrong:
                return Font.Roobert.DemiBold._10
            case .subtitle:
                return Font.Roobert.Regular._12
            case .link:
                return Font.Roobert.DemiBold._12
            }
        }
        
        var lineHeightMultiple: CGFloat {
            switch self {
            case .title1:
                return 0.99
            case .title2:
                return 1.01
            case .title3, .title3Placeholder, .text, .textStrong:
                return 1.04
            case .title4:
                return 1.08
            case .title5:
                return 1.15
            case .button:
                return 1.02
            case .tinyText, .tinyTextStrong:
                return 1.07
            case .caption, .captionStrong, .subtitle, .link:
                return 1.11
            case .capsCaption, .capsCaptionStrong:
                return 1.17
            }
        }
    }
}


extension String {
    
    func typography(_ style: Typography.Style, color: UIColor = Color.white, allowLineHeightMultiple: Bool = false, alignment: NSTextAlignment = .natural) -> NSAttributedString {
        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = allowLineHeightMultiple ? style.lineHeightMultiple : 1
        if paragraphStyle.lineHeightMultiple == 1 {
            paragraphStyle.lineBreakMode = .byTruncatingTail
        }
        paragraphStyle.alignment = alignment
        return NSAttributedString(string: self, attributes: [.foregroundColor: color, .font: style.font, .paragraphStyle: paragraphStyle])
    }
    
    func typographyIcon(_ color: UIColor = Color.white, font: UIFont, alignment: NSTextAlignment = .natural) -> NSAttributedString {
        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = alignment
        return NSAttributedString(string: self, attributes: [.foregroundColor: color, .font: font, .paragraphStyle: paragraphStyle])
    }
    
    
}
