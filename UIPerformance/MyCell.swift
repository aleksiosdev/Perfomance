//
//  MyCell.swift
//  UIPerformance
//
//  Created by Sergey Pronin on 8/9/20.
//  Copyright © 2020 Sergey Pronin. All rights reserved.
//

import UIKit

class MyCell: UICollectionViewCell {
    
    @IBOutlet weak var constrainedHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.isOpaque = true
        constrainedHeight.constant = CGFloat(arc4random() % 200) + 50
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}

class BadView: UIView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .black
        isOpaque = true
        
        layer.cornerRadius = 5
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.masksToBounds = true
    }
}
