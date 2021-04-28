//
//  NotificationFollowEventTableViewCell.swift
//  InstagramClone
//
//  Created by Bilel Bouricha on 27/04/2021.
//

import UIKit
import SDWebImage

protocol NotificationLikeEventTableViewCellDelegate: AnyObject {
    func didTapPostButton(model: UserNotification)
}

class NotificationLikeEventTableViewCell: UITableViewCell {
    static let identifier = "NotificationLikeEventTableViewCell"
    
    private var model: UserNotification?
    
    weak var delegate: NotificationLikeEventTableViewCellDelegate?
    
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
        $0.text = "@Joe liked your photo"
        $0.numberOfLines = 0
    }
    
    private lazy var postButton = UIButton()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setBackgroundImage(UIImage(named: "test"), for: .normal)
        $0.addTarget(self, action: #selector(didTapPostButton), for: .touchUpInside)
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
        case .like(let post):
            let thumbnail = post.thumbnailImage
            guard !thumbnail.absoluteString.contains("google.com") else {
                return
            }
            postButton.sd_setBackgroundImage(with: thumbnail, for: .normal, completed: nil)
            break
        case .follow:
            break
        }
        label.text = model.text
        profileImageView.sd_setImage(with: model.user.profilePhoto, completed: nil)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profileImageView.image = nil
        label.text = nil
        postButton.setBackgroundImage(nil, for: .normal)
    }
    
    private func setup() {
        contentView.addSubview(profileImageView)
        contentView.addSubview(label)
        contentView.addSubview(postButton)
        
        NSLayoutConstraint.activate([
            profileImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Margin._10),
            profileImageView.widthAnchor.constraint(equalToConstant: 40),
            profileImageView.heightAnchor.constraint(equalToConstant: 40),
            
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: Margin._10),
            
            postButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            postButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Margin._10),
            postButton.widthAnchor.constraint(equalToConstant: 40),
            postButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    @objc private func didTapPostButton() {
        guard let model = model else { return }
        delegate?.didTapPostButton(model: model)
    }
}
