//
//  PhotoCell.swift
//  UIPerformance
//
//  Created by Egor T on 10.08.2020.
//  Copyright © 2020 Egor T. All rights reserved.
//

import UIKit
import LoremIpsum

class PhotoCell: UICollectionViewCell {
    let titleLabel: UILabel
    let descriptionLabel: UILabel

    let bubbleView: UIView
    let avatarImageView: UIImageView

    let contentStackView: UIStackView

    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        return imageView
    }()

    override init(frame: CGRect) {
        titleLabel = Self.createTitleLabel()
        descriptionLabel = Self.createDescriptionLabel()
        bubbleView = Self.createBubbleView()
        avatarImageView = Self.createAvatarImageView()
        contentStackView = Self.createContentStackView()

        super.init(frame: frame)

        configureBaseElements()
        contentStackView.addArrangedSubview(photoImageView)

        let photoWidth = photoImageView.widthAnchor.constraint(equalToConstant: 100)
        photoWidth.priority = .defaultLow
        NSLayoutConstraint.activate([
            photoWidth,
            photoImageView.heightAnchor.constraint(equalTo: photoImageView.widthAnchor),
        ])
    }

    func configure(model: PhotoModel) {
        titleLabel.attributedText = model.title
        descriptionLabel.attributedText = model.description

        // FIXME: Misaligned image
        LoremIpsum.asyncPlaceholderImage(with: CGSize(width: 600, height: 800)) { [weak self] (image) in
            self?.photoImageView.image = image
            self?.layoutIfNeeded()
        }
        
        LoremIpsum.asyncPlaceholderImage(with: CGSize(width: 32, height: 32)) { [weak self] (image) in
            self?.setAvatar(image)
        }

        layoutIfNeeded()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PhotoCell: BaseCell { }
