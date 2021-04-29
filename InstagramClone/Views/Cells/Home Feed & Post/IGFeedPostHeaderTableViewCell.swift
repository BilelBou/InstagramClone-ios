//
//  IGFeedPostHeaderTableViewCell.swift
//  InstagramClone
//
//  Created by Bilel Bouricha on 28/04/2021.
//

import UIKit
import SDWebImage

protocol IGFeedPostHeaderTableViewCellDelegate: AnyObject {
    func didTapMoreButton()
}

class IGFeedPostHeaderTableViewCell: UITableViewCell {

    static let identifier = "IGFeedPostHeaderTableViewCell"
    weak var delegate: IGFeedPostHeaderTableViewCellDelegate?
    private lazy var profileImage = UIImageView()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        $0.layer.masksToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 15
    }
    
    private lazy var usernameLabel = UILabel()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .label
        $0.numberOfLines = 1
    }
    
    private lazy var moreButton: UIButton = UIButton()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.tintColor = .label
        $0.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        $0.addTarget(self, action: #selector(didTapMoreButton), for: .touchUpInside)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didTapMoreButton() {
        delegate?.didTapMoreButton()
    }
    
    public func configure(with model: User) {
        profileImage.image = UIImage(systemName: "person.circle")
        usernameLabel.attributedText = model.username.typography(.textStrong, color: .label)
        //profileImage.sd_setImage(with: mod, completed: <#T##SDExternalCompletionBlock?##SDExternalCompletionBlock?##(UIImage?, Error?, SDImageCacheType, URL?) -> Void#>)
    }
    
    private func setup() {
        contentView.addSubview(profileImage)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(moreButton)
        
        NSLayoutConstraint.activate([
            profileImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profileImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Margin._10),
            profileImage.widthAnchor.constraint(equalToConstant: 30),
            profileImage.heightAnchor.constraint(equalToConstant: 30),

            
            usernameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: Margin._10),
            
            moreButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            moreButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Margin._16),

        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        usernameLabel.text = nil
        profileImage.image = nil
    }
}
