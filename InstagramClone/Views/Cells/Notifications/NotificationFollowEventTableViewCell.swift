//
//  NotificationFollowEventTableViewCell.swift
//  InstagramClone
//
//  Created by Bilel Bouricha on 27/04/2021.
//

import UIKit

protocol NotificationFollowEventTableViewCellDelegate: AnyObject {
    func didTapFollowUnFollowButton(model: UserNotification)
}

class NotificationFollowEventTableViewCell: UITableViewCell {
    static let identifier = "NotificationFollowEventTableViewCell"
    
    private var model: UserNotification?
    
    weak var delegate: NotificationFollowEventTableViewCellDelegate?
    
    private lazy var profileImageView = UIImageView()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.masksToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 20
    }
    
    private lazy var label = UILabel()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .label
        $0.text = "KanyeWest followed you"
        $0.numberOfLines = 0
    }
    
    private lazy var followButton = UIButton()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(didTapFollowButton), for: .touchUpInside)
        $0.layer.cornerRadius = CornerRadius._8
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        selectionStyle = .none
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: UserNotification) {
        self.model = model
        
        switch model.type {
        case .like(_):
            break
        case .follow(let state):
            switch state {
            case .following:
                followButton.setAttributedTitle("Unfollow".typography(.button, color: .label), for: .normal)
                followButton.layer.borderWidth = 1
                followButton.layer.borderColor = UIColor.secondaryLabel.cgColor
            case .notFollowing:
                followButton.setAttributedTitle("Follow".typography(.button, color: .white), for: .normal)
                followButton.layer.borderWidth = 0
                followButton.backgroundColor = .systemBlue
            }
             break
            // configure button
        }
        label.text = model.text
        profileImageView.sd_setImage(with: model.user.profilePhoto, completed: nil)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profileImageView.image = nil
        label.text = nil
        followButton.setTitle(nil, for: .normal)
        followButton.backgroundColor = nil
        followButton.layer.borderWidth = 0
    }
    
    private func setup() {
        contentView.addSubview(profileImageView)
        contentView.addSubview(label)
        contentView.addSubview(followButton)
        
        NSLayoutConstraint.activate([
            profileImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Margin._10),
            profileImageView.widthAnchor.constraint(equalToConstant: 40),
            profileImageView.heightAnchor.constraint(equalToConstant: 40),
            
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: Margin._10),
            
            followButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            followButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Margin._10),
            followButton.widthAnchor.constraint(equalToConstant: 120),
        ])
    }
    
    @objc private func didTapFollowButton() {
        guard let model = model else { return }
        delegate?.didTapFollowUnFollowButton(model: model)
    }
}
