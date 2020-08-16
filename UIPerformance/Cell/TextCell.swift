//
//  TextCell.swift
//  UIPerformance
//
//  Created by Aleksandr Lavrinenko on 09.08.2020.
//  Copyright © 2020 Sergey Pronin. All rights reserved.
//

import UIKit
import LoremIpsum

protocol ConfigrableCell: UICollectionViewCell {
	func configure()
}

class TextCell: UICollectionViewCell {
	let titleLabel: UILabel
	let descriptionLabel: UILabel

	let bubbleImageView: UIImageView
	let avatarImageView: UIImageView

	let contentStackView: UIStackView

	override init(frame: CGRect) {
		titleLabel = Self.createTitleLabel()
		descriptionLabel = Self.createDescriptionLabel()
		bubbleImageView = Self.createBubbleImageView()
		avatarImageView = Self.createAvatarImageView()
		contentStackView = Self.createContentStackView()

		super.init(frame: frame)

		configureBaseElements()
	}

	func configure(model: TextModel) {
		titleLabel.attributedText = model.title
		descriptionLabel.attributedText = model.description
		LoremIpsum.asyncPlaceholderImage(with: CGSize(width: 800, height: 800)) { [weak self] (image) in
			self?.sizeToFit()
			self?.avatarImageView.image = image
		}
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func awakeFromNib() {
		super.awakeFromNib()
	}
}

extension TextCell: BaseCell { }
