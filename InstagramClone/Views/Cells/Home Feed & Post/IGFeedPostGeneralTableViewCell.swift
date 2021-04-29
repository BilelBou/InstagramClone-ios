//
//  IGFeedPostGeneralTableViewCell.swift
//  InstagramClone
//
//  Created by Bilel Bouricha on 28/04/2021.
//

import UIKit

/// Comments
class IGFeedPostGeneralTableViewCell: UITableViewCell {
    
    static let identifier = "IGFeedPostGeneralTableViewCell"
    
    private lazy var usernameLabel = UILabel()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var commentLabel = UILabel()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var likeButton = UIButton()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.tintColor = .label
        $0.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.separatorInset = .zero
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: PostComment) {
        usernameLabel.attributedText = model.username.typography(.textStrong, color: .label)
        commentLabel.attributedText = model.text.typography(.text, color: .label)
    }
    
    private func setup() {
        contentView.addSubview(usernameLabel)
        contentView.addSubview(commentLabel)
        contentView.addSubview(likeButton)

        NSLayoutConstraint.activate([
            usernameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Margin._20),
            
            commentLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            commentLabel.leadingAnchor.constraint(equalTo: usernameLabel.trailingAnchor, constant: Margin._20),
            
            likeButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            likeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Margin._20),
        ])
    }
    
}
