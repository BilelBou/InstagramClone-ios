//
//  ProfileInfoHeaderCollectionReusableView.swift
//  InstagramClone
//
//  Created by Bilel Bouricha on 26/04/2021.
//

import UIKit

protocol ProfileInfoHeaderCollectionReusableViewDelegate: AnyObject {
    func profileHeaderDidTapPostsButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapFollowersButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapFollowingButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapEditProfileButton(_ header: ProfileInfoHeaderCollectionReusableView)

}

final class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileInfoHeaderCollectionReusableView"
    
    public weak var delegate: ProfileInfoHeaderCollectionReusableViewDelegate?
    
    private lazy var profilePhotoImageView = UIImageView()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .red
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 44
    }
    
    private lazy var postButton = UIButton()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Posts", for: .normal)
        $0.setTitleColor(.label, for: .normal)
    }
    
    private lazy var followingButton = UIButton()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Following", for: .normal)
        $0.setTitleColor(.label, for: .normal)
    }
    
    private lazy var followersButton = UIButton()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Followers", for: .normal)
        $0.setTitleColor(.label, for: .normal)
    }
    
    private lazy var editProfileButton = UIButton()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Edit Your Profile", for: .normal)
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = Color.lightGray.cgColor
        $0.layer.cornerRadius = CornerRadius._8
        $0.setTitleColor(.label, for: .normal)
    }
    
    private lazy var nameLabel = UILabel()..{
        $0.text = "Bilel Bouricha"
        $0.textColor = .label
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var bioLabel = UILabel()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .label
        $0.numberOfLines = 0
        $0.text = "THIS IS MY BIO"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        addButtonActions()
        backgroundColor = .systemBackground
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addButtonActions() {
        followersButton.addTarget(self, action: #selector(didTapFollowersButton), for: .touchUpInside)
        followingButton.addTarget(self, action: #selector(didTapFollowingButton), for: .touchUpInside)
        postButton.addTarget(self, action: #selector(didTapPostButton), for: .touchUpInside)
        editProfileButton.addTarget(self, action: #selector(didTapEditProfileButton), for: .touchUpInside)

    }
    
    private func setup() {
        addSubview(profilePhotoImageView)
        addSubview(postButton)
        addSubview(followingButton)
        addSubview(followersButton)
        addSubview(editProfileButton)
        addSubview(nameLabel)
        addSubview(bioLabel)
        
        NSLayoutConstraint.activate([
            profilePhotoImageView.topAnchor.constraint(equalTo: topAnchor),
            profilePhotoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Margin._10),
            profilePhotoImageView.widthAnchor.constraint(equalToConstant: 88),
            profilePhotoImageView.heightAnchor.constraint(equalToConstant: 88),
            
            postButton.topAnchor.constraint(equalTo: topAnchor, constant: Margin._24),
            postButton.leadingAnchor.constraint(equalTo: profilePhotoImageView.trailingAnchor, constant: Margin._24),
            
            followersButton.topAnchor.constraint(equalTo: topAnchor, constant: Margin._24),
            followersButton.leadingAnchor.constraint(equalTo: postButton.trailingAnchor, constant: Margin._20),
            
            followingButton.topAnchor.constraint(equalTo: topAnchor, constant: Margin._24),
            followingButton.leadingAnchor.constraint(equalTo: followersButton.trailingAnchor, constant: Margin._20),
            
            nameLabel.topAnchor.constraint(equalTo: profilePhotoImageView.bottomAnchor, constant: Margin._8),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Margin._16),
            
            bioLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Margin._6),
            bioLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Margin._16),
            bioLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Margin._16),
            
            editProfileButton.topAnchor.constraint(equalTo: bioLabel.bottomAnchor, constant: Margin._30),
            editProfileButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Margin._16),
            editProfileButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Margin._16),


        ])
    }
    
    // Mark: - Actions
    
    @objc private func didTapFollowersButton() {
        delegate?.profileHeaderDidTapFollowersButton(self)
    }
    
    @objc private func didTapFollowingButton() {
        delegate?.profileHeaderDidTapFollowingButton(self)
    }
    
    @objc private func didTapPostButton() {
        delegate?.profileHeaderDidTapPostsButton(self)
    }
    
    @objc private func didTapEditProfileButton() {
        delegate?.profileHeaderDidTapEditProfileButton(self)
    }
}
