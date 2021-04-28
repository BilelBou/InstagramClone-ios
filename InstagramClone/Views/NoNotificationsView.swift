//
//  NoNotificationsView.swift
//  InstagramClone
//
//  Created by Bilel Bouricha on 27/04/2021.
//

import UIKit

class NoNotificationsView: UIView {
    
    private lazy var label = UILabel()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "No Notifications Yet"
        $0.textColor = .secondaryLabel
        $0.textAlignment = .center
        $0.numberOfLines = 1
    }
    
    private lazy var imageView = UIImageView()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.tintColor = .secondaryLabel
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(systemName: "bell")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(label)
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 50),
            imageView.heightAnchor.constraint(equalToConstant: 50),
            
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Margin._30)
        ])
    }
}
