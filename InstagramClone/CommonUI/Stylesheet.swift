//
//  Stylesheet.swift
//  InstagramClone
//
//  Created by Bilel Bouricha on 24/04/2021.
//

import Foundation
import UIKit

enum Icon {
    enum App {
        static let logo              = "\u{e90d}"
        static let arrowUp           = "\u{e981}"
        static let arrowLeft         = "\u{e93a}"
        static let arrowRight        = "\u{e980}"
        static let arrowDown         = "\u{e954}"
        static let chevronUp         = "\u{e978}"
        static let chevronLeft       = "\u{e968}"
        static let chevronRight      = "\u{e95d}"
        static let chevronDown       = "\u{e909}"
        static let play              = "\u{e900}"
        static let pause             = "\u{e901}"
        static let plus              = "\u{e90a}"
        static let tick              = "\u{e943}"
        static let cross             = "\u{e945}"
        static let option            = "\u{e905}"
        static let verified          = "\u{e904}"
        static let message           = "\u{e90b}"
        static let share             = "\u{e937}"
        static let photoLibrary      = "\u{e902}"
        static let video             = "\u{e938}"
        static let badge             = "\u{e907}"
        static let about             = "\u{e939}"
        static let padlock           = "\u{e90c}"
        static let selectMultiple    = "\u{e93b}"
        static let addEmote          = "\u{e93c}"
        static let dropbox           = "\u{e93d}"
        static let star              = "\u{e948}"
        static let crossFill         = "\u{e949}"
        static let bell              = "\u{e94a}"
        static let more              = "\u{e952}"
        static let magnifyingGlass   = "\u{e956}"
        static let history           = "\u{e957}"
        static let user              = "\u{e959}"
        static let lfg               = "\u{e95b}"
        static let home              = "\u{e95c}"
        static let speechRecognition = "\u{e95e}"
        static let vertical          = "\u{e961}"
        static let square            = "\u{e960}"
        static let horizontal        = "\u{e95f}"
        static let oneDrive          = "\u{e962}"
        static let paperPlaneRight   = "\u{e963}"
        static let curvedArrow       = "\u{e965}"
        static let noSelection       = "\u{e966}"
        static let clock             = "\u{e969}"
        static let hashtag           = "\u{e973}"
        static let crown             = "\u{e974}"
        static let zoom              = "\u{e975}"
        static let zoomOut           = "\u{e976}"
        static let tv                = "\u{e977}"
        static let colors            = "\u{e97a}"
        static let userCircle        = "\u{e97f}"
        static let controller        = "\u{e983}"
        static let pcRecord          = "\u{e986}"
        static let pcStop            = "\u{e987}"
        static let qrCode            = "\u{e985}"
        static let ghost             = "\u{e988}"
        static let setting           = "\u{e989}"
        static let shield            = "\u{e98a}"
        static let edit              = "\u{e98b}"
        static let videoFile         = "\u{e98c}"
        static let none              = "\u{e98d}"
        static let bellFill          = "\u{e98e}"
        static let userFill          = "\u{e98f}"
        static let playRounded       = "\u{e990}"
        static let paperPlaneUpRight = "\u{e991}"
        static let record            = "\u{e992}"
        static let squareGrid2x2     = "\u{e994}"
    }
    
    enum Rank {
        static let rank250           = "\u{e955}"
        static let rank150           = "\u{e903}"
        static let rank100           = "\u{e906}"
        static let rank50            = "\u{e908}"
        static let lowElo            = "\u{e982}"
        static let neon              = "\u{e97b}"
        static let ruby              = "\u{e97e}"
        static let platinum          = "\u{e97c}"
        static let diamond           = "\u{e97d}"
    }
    
    enum Action {
        static let shake             = "\u{e942}"
        static let media             = "\u{e90e}"
        static let music             = "\u{e90f}"
        static let overlay           = "\u{e910}"
        static let record            = "\u{e911}"
        static let reverse           = "\u{e912}"
        static let sfx               = "\u{e913}"
        static let speed             = "\u{e914}"
        static let sticker           = "\u{e915}"
        static let text              = "\u{e916}"
        static let zoom              = "\u{e917}"
        static let resize            = "\u{e918}"
        static let gif               = "\u{e919}"
        static let effect            = "\u{e91a}"
        static let highlight         = "\u{e91b}"
        static let cut               = "\u{e946}"
        static let trash             = "\u{e93e}"
        static let textAlignment     = "\u{e93f}"
        static let frame             = "\u{e940}"
        static let a                 = "\u{e941}"
        static let edit              = "\u{e947}"
        static let faceCam           = "\u{e953}"
        static let soundOff          = "\u{e95a}"
        static let soundOn           = "\u{e913}" // Same Icon as SFX
        static let volume            = "\u{e913}" // Same Icon as SFX
        static let filter            = "\u{e967}"
    }
    
    enum Social {
        static let whatsapp          = "\u{e91c}"
        static let twitter           = "\u{e91d}"
        static let instagram         = "\u{e91e}"
        static let snapchat          = "\u{e91f}"
        static let tiktok            = "\u{e920}"
        static let twitch            = "\u{e921}"
        static let youtube           = "\u{e922}"
        static let discord           = "\u{e944}"
        static let google            = "\u{e958}"
        static let apple             = "\u{e964}"
    }
    
    enum Game: CaseIterable {
        static let apex              = "\u{e92f}"
        static let modernWarfare     = "\u{e92e}"
        static let csgo              = "\u{e92d}"
        static let dota2             = "\u{e92c}"
        static let fifa20            = "\u{e92b}"
        static let fortnite          = "\u{e92a}"
        static let gtav              = "\u{e929}"
        static let lol               = "\u{e928}"
        static let minecraft         = "\u{e927}"
        static let overwatch         = "\u{e926}"
        static let pubg              = "\u{e923}"
        static let rainbowSixSiege   = "\u{e924}"
        static let rocketLeague      = "\u{e925}"
        static let valorant          = "\u{e94f}"
        static let roblox            = "\u{e94e}"
        static let rdr2              = "\u{e94b}"
        static let skate3            = "\u{e94c}"
        static let nba               = "\u{e94d}"
        static let animalCrossing    = "\u{e950}"
    }
    
    enum Console {
        static let `switch`          = "\u{e930}"
        static let pc                = "\u{e931}"
        static let playstation       = "\u{e932}"
        static let xbox              = "\u{e933}"
        static let mobile            = "\u{e951}"
        static let powderRecorder    = "\u{e96c}"
        static let windows           = "\u{e979}"
    }
    
    enum Plateform {
        static let battleNet         = "\u{e936}"
        static let origin            = "\u{e936}"
        static let steam             = "\u{e934}"
    }

    enum Badge {
        static let flash             = "\u{e96a}"
        static let smallFire         = "\u{e96b}"
        static let powder            = "\u{e90d}"
        static let challenge         = "\u{e96d}"
        static let stars             = "\u{e96e}"
        static let target            = "\u{e96f}"
        static let music             = "\u{e970}"
        static let fire              = "\u{e971}"
        static let joystick          = "\u{e972}"
    }
}

struct Color {
    static let black: UIColor = UIColor(hex: 0x000000)
    static let darkGray: UIColor = UIColor(hex: 0x1C1C1C)
    static let gray: UIColor = UIColor(hex: 0x2A2A2A)
    static let lightGray: UIColor = UIColor(hex: 0xAAAAAA)
    static let white: UIColor = UIColor(hex: 0xFFFFFF)
    static let red: UIColor = UIColor(hex: 0xFD253F)
    static let neonGreen: UIColor = UIColor(hex: 0xCCFF00)
    static let instagram: [UIColor] = [UIColor(hex: 0xfeda75), UIColor(hex: 0xfa7e1e), UIColor(hex: 0xd62976), UIColor(hex: 0x962fbf), UIColor(hex: 0x4f5bd5)]
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

    enum Icon {
        static let _4 = custom(with: 4)
        static let _8 = custom(with: 8)
        static let _10 = custom(with: 10)
        static let _12 = custom(with: 12)
        static let _14 = custom(with: 14)
        static let _16 = custom(with: 16)
        static let _18 = custom(with: 18)
        static let _20 = custom(with: 20)
        static let _22 = custom(with: 22)
        static let _24 = custom(with: 24)
        static let _26 = custom(with: 26)
        static let _28 = custom(with: 28)
        static let _30 = custom(with: 30)
        static let _32 = custom(with: 32)
        static let _40 = custom(with: 40)
        static let _42 = custom(with: 42)
        static let _48 = custom(with: 48)
        static let _52 = custom(with: 52)
        static let _106 = custom(with: 106)

        static func custom(with size: CGFloat) -> UIFont {
            guard let font = UIFont(name: "Icon", size: size) else { return UIFont() }
            return font
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
