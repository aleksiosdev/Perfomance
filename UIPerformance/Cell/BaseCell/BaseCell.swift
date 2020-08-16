//
//  BaseCell.swift
//  UIPerformance
//
//  Created by Aleksandr Lavrinenko on 16.08.2020.
//  Copyright © 2020 Sergey Pronin. All rights reserved.
//

import UIKit

protocol BaseCell: UICollectionViewCell {
	var titleLabel: UILabel { get }
	var descriptionLabel: UILabel { get }

	var bubbleImageView: UIImageView { get }
	var avatarImageView: UIImageView { get }

	var contentStackView: UIStackView { get }

	static func createTitleLabel() -> UILabel
	static func createDescriptionLabel() -> UILabel
	static func createAvatarImageView() -> UIImageView
	static func createBubbleImageView() -> UIImageView
	static func createContentStackView() -> UIStackView

	func configureBaseElements()
}

extension BaseCell {
	static func createTitleLabel() -> UILabel {
		let label = UILabel()
		label.numberOfLines = 0
		label.isOpaque = true
		return label
	}

	static func createDescriptionLabel() -> UILabel {
		let label = UILabel()
		label.numberOfLines = 0
		label.isOpaque = true
		return label
	}

	static func createAvatarImageView() -> UIImageView {
		let avatarImageView = UIImageView()
		avatarImageView.layer.cornerRadius = 5
		avatarImageView.layer.shadowRadius = 5
		avatarImageView.layer.shadowOffset = CGSize(width: 50, height: 50)
		avatarImageView.layer.shadowColor = UIColor.black.cgColor
		avatarImageView.layer.shadowOpacity = 0.8
		avatarImageView.layer.masksToBounds = true
		return avatarImageView
	}

	static func createBubbleImageView() -> UIImageView {
		let bubbleImageView = UIImageView()
		bubbleImageView.isUserInteractionEnabled = true
		bubbleImageView.backgroundColor = UIColor(red: 0, green: 106, blue: 255, alpha: 1.0)

		bubbleImageView.layer.cornerRadius = 16

		bubbleImageView.layer.cornerRadius = 5
		bubbleImageView.layer.shadowRadius = 5
		bubbleImageView.layer.shadowOffset = CGSize(width: 50, height: 50)
		bubbleImageView.layer.shadowColor = UIColor.black.cgColor
		bubbleImageView.layer.shadowOpacity = 0.8
		bubbleImageView.layer.masksToBounds = true
		bubbleImageView.isOpaque = true
		return bubbleImageView
	}

	static func createContentStackView() -> UIStackView {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.spacing = 8
		stackView.distribution = .fill
		stackView.isOpaque = true
		return stackView
	}

	func configureBaseElements() {
		translatesAutoresizingMaskIntoConstraints = false
		contentStackView.translatesAutoresizingMaskIntoConstraints = false
		avatarImageView.translatesAutoresizingMaskIntoConstraints = false
		bubbleImageView.translatesAutoresizingMaskIntoConstraints = false

		contentView.isOpaque = true

		contentView.addSubview(bubbleImageView)
		bubbleImageView.addSubview(contentStackView)
		bubbleImageView.addSubview(avatarImageView)

		contentStackView.addArrangedSubview(titleLabel)
		contentStackView.addArrangedSubview(descriptionLabel)

		NSLayoutConstraint.activate([
			contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width),

			contentStackView.leftAnchor.constraint(equalTo: bubbleImageView.leftAnchor, constant: 8),
			contentStackView.rightAnchor.constraint(equalTo: avatarImageView.leftAnchor, constant: -8),
			contentStackView.topAnchor.constraint(equalTo: bubbleImageView.topAnchor, constant: 8),
			contentStackView.bottomAnchor.constraint(equalTo: bubbleImageView.bottomAnchor, constant: -8),

			bubbleImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
			bubbleImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
			bubbleImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 128),
			bubbleImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),

			avatarImageView.rightAnchor.constraint(equalTo: bubbleImageView.rightAnchor, constant: -8),
			avatarImageView.bottomAnchor.constraint(equalTo: bubbleImageView.bottomAnchor, constant: -8),
			avatarImageView.widthAnchor.constraint(equalToConstant: 16),
			avatarImageView.heightAnchor.constraint(equalToConstant: 16),
		])
	}
}
