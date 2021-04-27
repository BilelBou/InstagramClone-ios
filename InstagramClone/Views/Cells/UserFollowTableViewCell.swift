//
//  UserFollowTableViewCell.swift
//  InstagramClone
//
//  Created by Bilel Bouricha on 26/04/2021.
//

import UIKit

protocol UserFollowTableViewCellDelegate: AnyObject {
    func didTapFollowUnfollowButton(model: UserRelationship)
}

enum UserFollowState {
    case following, notFollowing
}

struct UserRelationship {
    let username: String
    let name: String
    let state: UserFollowState
}

class UserFollowTableViewCell: UITableViewCell {
    static let identifier = "UserFollowTableViewCell"
    weak var delegate: UserFollowTableViewCellDelegate?
    
    private var model: UserRelationship?
    
    private lazy var profileImageView = UIImageView()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 20
        $0.backgroundColor = .red
    }
    
    private lazy var nameLabel = UILabel()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.numberOfLines = 1
    }
    
    private lazy var usernameLabel = UILabel()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.numberOfLines = 1
    }
    
    private let followButton = UIButton()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = CornerRadius._8
        $0.setAttributedTitle("Subscribe".typography(.button, color: Color.white), for: .normal)
        $0.addTarget(self, action: #selector(didTapFollowButton), for: .touchUpInside)
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
    
    public func configure(with model: UserRelationship) {
        self.model = model
        usernameLabel.attributedText = model.username.typography(.textStrong, color: .label)
        nameLabel.attributedText = model.name.typography(.text, color: Color.lightGray)
        switch model.state {
        case .following:
            followButton.setAttributedTitle("Unfollow".typography(.button, color: .label), for: .normal)
            followButton.backgroundColor = .systemBackground
            followButton.layer.borderWidth = 1
            followButton.layer.borderColor = Color.lightGray.cgColor
            return
        case .notFollowing:
            followButton.backgroundColor = .systemBlue
            followButton.setAttributedTitle("Follow".typography(.button, color: Color.white), for: .normal)
            followButton.layer.borderWidth = 0
            return
            //Not following button
        }
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profileImageView.image = nil
        nameLabel.text = nil
        usernameLabel.text = nil
        followButton.setTitle(nil, for: .normal)
        followButton.layer.borderWidth = 0
        followButton.backgroundColor = nil
    }
    
    private func setup() {
        contentView.addSubview(profileImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(followButton)
        
        NSLayoutConstraint.activate([
            profileImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Margin._10),
            profileImageView.widthAnchor.constraint(equalToConstant: 40),
            profileImageView.heightAnchor.constraint(equalToConstant: 40),
            
            usernameLabel.topAnchor.constraint(equalTo: topAnchor, constant: Margin._4),
            usernameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: Margin._12),
            
            nameLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: Margin._4),
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: Margin._12),
            
            followButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            followButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Margin._12),
            followButton.widthAnchor.constraint(equalToConstant: 120)
            
        ])
    }
    
    @objc private func didTapFollowButton() {
        guard let model = model else { return }
        delegate?.didTapFollowUnfollowButton(model: model)
    }
}
