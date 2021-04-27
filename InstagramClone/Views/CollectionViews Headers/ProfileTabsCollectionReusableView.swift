//
//  ProfileTabsCollectionReusableView.swift
//  InstagramClone
//
//  Created by Bilel Bouricha on 26/04/2021.
//

import UIKit

protocol ProfileTabsCollectionReusableViewDelegate: AnyObject {
    func didTapGridButtonTab()
    func didTapTaggedButtonTab()
}

class ProfileTabsCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileTabsCollectionReusableView"
    public weak var delegate: ProfileTabsCollectionReusableViewDelegate?
    
    struct Constants {
        static let padding: CGFloat = 8
    }
    
    private lazy var gridButton = UIButton()..{
        $0.clipsToBounds = true
        $0.tintColor = .label
        $0.setBackgroundImage(UIImage(systemName: "square.grid.2x2"), for: .normal)
        $0.addTarget(self, action: #selector(didTapGridButton), for: .touchUpInside)
    }
    
    private lazy var taggedButton = UIButton()..{
        $0.clipsToBounds = true
        $0.tintColor = .secondarySystemBackground
        $0.setBackgroundImage(UIImage(systemName: "person.2"), for: .normal)
        $0.addTarget(self, action: #selector(didTapTaggedButton), for: .touchUpInside)

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size = frame.height - (Constants.padding * 2)
        let gridButtonX = ((frame.width/2)-size)/2
        
        gridButton.frame = CGRect(x: gridButtonX, y: Constants.padding, width: size, height: size)
        taggedButton.frame = CGRect(x: gridButtonX + (frame.width/2), y: Constants.padding, width: size, height: size)
    }
    
    private func setup() {
        addSubview(gridButton)
        addSubview(taggedButton)
    }
    
    // Mark : -Actions
    
    @objc private func didTapGridButton() {
        taggedButton.tintColor = .secondarySystemBackground
        gridButton.tintColor = .label
        delegate?.didTapGridButtonTab()
    }
    
    @objc private func didTapTaggedButton() {
        gridButton.tintColor = .secondarySystemBackground
        taggedButton.tintColor = .label
        delegate?.didTapTaggedButtonTab()
    }
    
}
