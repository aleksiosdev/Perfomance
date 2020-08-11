//
//  PhotoCell.swift
//  UIPerformance
//
//  Created by Aleksandr Lavrinenko on 10.08.2020.
//  Copyright © 2020 Sergey Pronin. All rights reserved.
//

import UIKit
import LoremIpsum

class PhotoCell: UICollectionViewCell, ConfigrableCell {
	let titleLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.isOpaque = true
		return label
	}()
	let descriptionLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.isOpaque = true
		return label
	}()

	let bubbleImageView = UIImageView()
	let photoImageView: UIImageView = {
		let photoImageView = UIImageView()
		photoImageView.contentMode = .scaleAspectFit
		photoImageView.layer.cornerRadius = 6
		return photoImageView
	}()
	let avatarImageView = UIImageView()

	let textStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.spacing = 8
		stackView.distribution = .equalSpacing
		stackView.isOpaque = true
		return stackView
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)

		textStackView.translatesAutoresizingMaskIntoConstraints = false
		avatarImageView.translatesAutoresizingMaskIntoConstraints = false
		bubbleImageView.translatesAutoresizingMaskIntoConstraints = false

		contentView.addSubview(bubbleImageView)
		bubbleImageView.addSubview(textStackView)
		bubbleImageView.addSubview(avatarImageView)

		textStackView.addArrangedSubview(photoImageView)
		textStackView.addArrangedSubview(titleLabel)
		textStackView.addArrangedSubview(descriptionLabel)

		NSLayoutConstraint.activate([
			contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width),

			photoImageView.heightAnchor.constraint(equalTo: photoImageView.widthAnchor),

			textStackView.leftAnchor.constraint(equalTo: bubbleImageView.leftAnchor, constant: 8),
			textStackView.rightAnchor.constraint(equalTo: avatarImageView.leftAnchor, constant: -8),
			textStackView.topAnchor.constraint(equalTo: bubbleImageView.topAnchor, constant: 8),
			textStackView.bottomAnchor.constraint(equalTo: bubbleImageView.bottomAnchor, constant: -8),

			bubbleImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
			bubbleImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
			bubbleImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 128),
			bubbleImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),

			avatarImageView.rightAnchor.constraint(equalTo: bubbleImageView.rightAnchor, constant: -8),
			avatarImageView.bottomAnchor.constraint(equalTo: bubbleImageView.bottomAnchor, constant: -8),
			avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
			avatarImageView.widthAnchor.constraint(equalToConstant: 16),
		])

		bubbleImageView.backgroundColor = .blue
		bubbleImageView.layer.cornerRadius = 16

		bubbleImageView.layer.cornerRadius = 5
		bubbleImageView.layer.shadowRadius = 5
		bubbleImageView.layer.shadowOffset = CGSize(width: 5, height: 5)
		bubbleImageView.layer.shadowColor = UIColor.black.cgColor
		bubbleImageView.layer.shadowOpacity = 0.5
		bubbleImageView.layer.masksToBounds = true
		bubbleImageView.isOpaque = true

		contentView.isOpaque = true
	}

	func configure() {
		titleLabel.attributedText = NSAttributedString(string: LoremIpsum.paragraph, attributes: [.font: UIFont.boldSystemFont(ofSize: 16)])
		descriptionLabel.attributedText = NSAttributedString(string: LoremIpsum.paragraph, attributes: [.font: UIFont.systemFont(ofSize: 14)])
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
