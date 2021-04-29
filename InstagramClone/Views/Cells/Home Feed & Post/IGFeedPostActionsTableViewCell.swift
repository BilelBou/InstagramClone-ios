//
//  IGFeedPostActionsTableViewCell.swift
//  InstagramClone
//
//  Created by Bilel Bouricha on 28/04/2021.
//

import UIKit

protocol IGFeedPostActionsTableViewCellDelegate: AnyObject {
    func didTapLikeButton()
    func didTapCommentButton()
    func didTapSendButton()

}

class IGFeedPostActionsTableViewCell: UITableViewCell {

    static let identifier = "IGFeedPostActionsTableViewCell"
    weak var delegate: IGFeedPostActionsTableViewCellDelegate?
    
    private lazy var likeButton = UIButton()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(systemName: "heart"), for: .normal)
        $0.tintColor = .label
        $0.addTarget(self, action: #selector(didTapLikeButton), for: .touchUpInside)
    }
    
    private lazy var comment = UIButton()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(systemName: "message"), for: .normal)
        $0.tintColor = .label
        $0.addTarget(self, action: #selector(didTapCommentButton), for: .touchUpInside)

    }
    
    private lazy var send = UIButton()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(systemName: "paperplane"), for: .normal)
        $0.tintColor = .label
        $0.addTarget(self, action: #selector(didTapSendButton), for: .touchUpInside)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with post: UserPost) {
        
    }
    
    @objc private func didTapLikeButton() {
        delegate?.didTapLikeButton()
    }
    
    @objc private func didTapSendButton() {
        delegate?.didTapSendButton()
    }
    
    @objc private func didTapCommentButton() {
        delegate?.didTapCommentButton()
    }
    
    private func setup() {
        contentView.addSubview(likeButton)
        contentView.addSubview(comment)
        contentView.addSubview(send)
        
        NSLayoutConstraint.activate([
            likeButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            likeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Margin._20),
            likeButton.heightAnchor.constraint(equalToConstant: 20),
            likeButton.widthAnchor.constraint(equalToConstant: 20),

            
            comment.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            comment.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: Margin._20),
            comment.heightAnchor.constraint(equalToConstant: 20),
            comment.widthAnchor.constraint(equalToConstant: 20),
            
            send.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            send.leadingAnchor.constraint(equalTo: comment.trailingAnchor, constant: Margin._20),
            send.heightAnchor.constraint(equalToConstant: 20),
            send.widthAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    override func prepareForReuse() {
        superview?.prepareForInterfaceBuilder()
    }
    

}
