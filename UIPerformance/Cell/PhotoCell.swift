//
//  PhotoCell.swift
//  UIPerformance
//
//  Created by Aleksandr Lavrinenko on 10.08.2020.
//  Copyright © 2020 Sergey Pronin. All rights reserved.
//

import UIKit
import LoremIpsum

class PhotoCell: UICollectionViewCell {
	let titleLabel: UILabel
	let descriptionLabel: UILabel

	let bubbleImageView: UIImageView
	let avatarImageView: UIImageView

	let contentStackView: UIStackView

	let photoImageView: UIImageView = {
		let photoImageView = UIImageView()
		photoImageView.contentMode = .scaleAspectFit
		photoImageView.layer.cornerRadius = 6
		return photoImageView
	}()

	override init(frame: CGRect) {
		titleLabel = Self.createTitleLabel()
		descriptionLabel = Self.createDescriptionLabel()
		bubbleImageView = Self.createBubbleImageView()
		avatarImageView = Self.createAvatarImageView()
		contentStackView = Self.createContentStackView()

		super.init(frame: frame)

		configureBaseElements()
		contentStackView.addArrangedSubview(photoImageView)

		NSLayoutConstraint.activate([
			photoImageView.heightAnchor.constraint(equalTo: photoImageView.widthAnchor),
		])
	}

	func configure(model: PhotoModel) {
		titleLabel.attributedText = model.title
		descriptionLabel.attributedText = model.description
		LoremIpsum.asyncPlaceholderImage(with: CGSize(width: 600, height: 800)) { [weak self] (image) in
			self?.avatarImageView.image = image
			self?.photoImageView.image = image
		}

		layoutIfNeeded()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension PhotoCell: BaseCell { }
