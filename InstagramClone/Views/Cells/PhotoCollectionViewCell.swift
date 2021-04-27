//
//  PhotoCollectionViewCell.swift
//  InstagramClone
//
//  Created by Bilel Bouricha on 26/04/2021.
//

import UIKit
import SDWebImage

class PhotoCollectionViewCell: UICollectionViewCell {
    static let identifier = "PhotoCollectionViewCell"
    
    private lazy var photoImageView = UIImageView()..{
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        setup()
        contentView.clipsToBounds = true
        accessibilityLabel = "User post image"
        accessibilityHint = "Double-tap to open post"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        photoImageView.frame = contentView.bounds
    }
    private func setup() {
        contentView.addSubview(photoImageView)
    }
    
    public func configure(with model:UserPost) {
        let url = model.thumbnailImage
        photoImageView.sd_setImage(with: url, completed: nil)
    }
    
    public func configure(debug imageName: String) {
        photoImageView.image = UIImage(named: imageName)
    }
}
