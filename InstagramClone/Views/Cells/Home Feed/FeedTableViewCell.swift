//
//  FeedTableViewCell.swift
//  InstagramClone
//
//  Created by Bilel Bouricha on 25/04/2021.
//

import UIKit

final class FeedTableViewCell: UITableViewCell {

    let identifier = "FeedTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
        
    }
    
}
