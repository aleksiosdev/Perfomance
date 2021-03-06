//
//  TextCell.swift
//  UIPerformance
//
//  Created by Egor T on 09.08.2020.
//  Copyright © 2020 Egor T. All rights reserved.
//

import UIKit
import LoremIpsum

class TextCell: UICollectionViewCell {
    let titleLabel: UILabel
    let descriptionLabel: UILabel

    let bubbleView: UIView
    let avatarImageView: UIImageView

    let contentStackView: UIStackView

    override init(frame: CGRect) {
        titleLabel = Self.createTitleLabel()
        descriptionLabel = Self.createDescriptionLabel()
        bubbleView = Self.createBubbleView()
        avatarImageView = Self.createAvatarImageView()
        contentStackView = Self.createContentStackView()

        super.init(frame: frame)

        configureBaseElements()
    }

    func configure(model: TextModel) {
        titleLabel.attributedText = model.title
        descriptionLabel.attributedText = model.description

        // FIXME: Misaligned image
        LoremIpsum.asyncPlaceholderImage(with: CGSize(width: 32, height: 32)) { [weak self] (image) in
            self?.setAvatar(image)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TextCell: BaseCell { }
