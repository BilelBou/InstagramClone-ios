import UIKit

enum NavBarButtonStyle : Equatable {
    
    static func ==(lhs: NavBarButtonStyle, rhs: NavBarButtonStyle) -> Bool {
        switch (lhs, rhs) {
        case (.back, .back):
            return true
        case (.dismiss, .dismiss):
            return true
        case (.next, .next):
            return true
        case (.nextWithCount, .nextWithCount):
            return true
        case (.none, .none):
            return true
        case (.done, .done):
            return true
        case (.option, .option):
            return true
        case (.cancel, .cancel):
            return true
        case (.skip, .skip):
            return true
        case (.logOut, .logOut):
            return true
        case (.challenge, .challenge):
            return true
        case (.setting, .setting):
            return true
        case (.invite, .invite):
            return true
        case (.send, .send):
            return true
        case (.notifications, .notifications):
            return true
        case (.messages, .messages):
            return true
        default:
            return false
        }
    }
    
    case back
    case dismiss
    case next
    case nextWithCount(Int)
    case none
    case done
    case option
    case cancel
    case skip
    case logOut
    case challenge
    case setting
    case invite
    case send
    case notifications
    case messages

    func attributedString(color: UIColor) -> NSAttributedString {
        switch self {
        case .back:
            return Icon.App.chevronLeft.typographyIcon(color, font: Font.Icon._22)
        case .dismiss:
            return Icon.App.chevronDown.typographyIcon(color, font: Font.Icon._22)
        case .none:
            return NSAttributedString()
        case .option:
            let color: UIColor = color == Color.white ? Color.lightGray : color
            return Icon.App.option.typographyIcon(color, font: Font.Icon._24)
        case .challenge:
            return Icon.App.crown.typographyIcon(color, font: Font.Icon._20)
        case .setting:
            return Icon.App.setting.typographyIcon(color, font: Font.Icon._22)
        case .invite:
            return "invite".typography(.textStrong, color: color)
        case .send:
            return "Send".typography(.textStrong, color: color)
        case .notifications:
            return Icon.App.bell.typographyIcon(color, font: Font.Icon._24)
        case .messages:
            return Icon.App.paperPlaneUpRight.typographyIcon(color, font: Font.Icon._24)
        case .next:
            return Icon.App.paperPlaneUpRight.typographyIcon(color, font: Font.Icon._24)
        case .nextWithCount(_):
            return Icon.App.paperPlaneUpRight.typographyIcon(color, font: Font.Icon._24)
        case .done:
            return Icon.App.paperPlaneUpRight.typographyIcon(color, font: Font.Icon._24)
        case .cancel:
            return Icon.App.paperPlaneUpRight.typographyIcon(color, font: Font.Icon._24)
        case .skip:
            return Icon.App.paperPlaneUpRight.typographyIcon(color, font: Font.Icon._24)
        case .logOut:
            return Icon.App.paperPlaneUpRight.typographyIcon(color, font: Font.Icon._24)
        }
    }
    
    var selector: Selector {
        var selector = Selector(String())
        switch self {
        case .back:
            selector = #selector(Controller.didTapBack)
        case .dismiss:
            selector = #selector(Controller.didTapDismiss)
        case .next:
            selector = #selector(Controller.didTapNext)
        case .nextWithCount:
            selector = #selector(Controller.didTapNext)
        case .none: break
        case .done:
            selector = #selector(Controller.didTapDone)
        case .option:
            selector = #selector(Controller.didTapOption)
        case .cancel:
            selector = #selector(Controller.didTapCancel)
        case .skip:
            selector = #selector(Controller.didTapSkip)
        case .logOut:
            selector = #selector(Controller.didTapLogOut)
        case .challenge:
            selector = #selector(Controller.didTapChallenge)
        case .setting:
            selector = #selector(Controller.didTapSetting)
        case .invite:
            selector = #selector(Controller.didTapInvite)
        case .send:
            selector = #selector(Controller.didTapSend)
        case .notifications:
            selector = #selector(Controller.didTapNotifications)
        case .messages:
            selector = #selector(Controller.didTapMessages)
        }
        
        return selector
    }

    func isNone() -> Bool {
        switch self {
        case .none:
            return true
        default:
            return false
        }
    }
}

enum NavTitleStyle {
    case empty
    case title(String)
    case logo
    case icon(String)
}

import UIKit

class Controller: UIViewController {
    
    static let customButtonSize: CGSize = CGSize(width: 32, height: 32)
        
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureNavigationBar(with font: UIFont) {
        navigationController?.navigationBar.backgroundColor = UIColor.systemBackground
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: Color.black, .font: font]
    }

    func updateNavigationBar(_ titleStyle: NavTitleStyle = .empty, titleColor: UIColor = Color.black, leftButton: NavBarButtonStyle = .none, leftColor: UIColor = Color.black, rightButton: NavBarButtonStyle = .none, rightColor: UIColor = Color.white, isBarHidden: Bool = false) {
        var font: UIFont = Font.Roobert.DemiBold._18
        switch titleStyle {
        case .title(let title):
            self.title = title
            navigationItem.titleView = nil
        case .icon(let icon):
            title = icon
            navigationItem.titleView = nil
            font = Font.Icon._24
        case .logo:
            title = nil
            navigationItem.titleView = UIImageView(image: UIImage(named: "powderLogoIconSize24"))
        case .empty:
            title = nil
            navigationItem.titleView = nil
        }
        
        configureNavigationBar(with: font)
        navigationItem.leftBarButtonItem = barButtonItem(style: leftButton, color: leftColor)
        navigationItem.rightBarButtonItem = barButtonItem(style: rightButton, color: rightColor)
    }
    
    private func barButtonItem(style: NavBarButtonStyle, color: UIColor) -> UIBarButtonItem? {
        guard !style.isNone() else { return nil }
        let button = UIButton(type: .custom)
        button.setAttributedTitle(style.attributedString(color: color), for: .normal)
        button.addTarget(self, action: style.selector, for: .touchUpInside)
        switch style {
        case .back, .dismiss, .challenge:
            let width = Controller.customButtonSize.width
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: width).isActive = true
            button.widthAnchor.constraint(equalToConstant: width).isActive = true
            button.backgroundColor = Color.white.withAlphaComponent(0.2)
            button.layer.cornerRadius = width / 2
        case .done, .next, .nextWithCount, .cancel, .skip, .logOut, .invite, .option, .setting, .send, .none, .notifications, .messages: break
        }

        return UIBarButtonItem(customView: button)
    }

    @objc func didTapBack() {}
    @objc func didTapDismiss() {}
    @objc func didTapShare() {}
    @objc func didTapNext() {}
    @objc func didTapDone() {}
    @objc func didTapOption() {}
    @objc func didTapCancel() {}
    @objc func didTapSkip() {}
    @objc func didTapLogOut() {}
    @objc func didTapChallenge() {}
    @objc func didTapSetting() {}
    @objc func didTapInvite() {}
    @objc func didTapSend() {}
    @objc func didTapNotifications() {}
    @objc func didTapMessages() {}
}
