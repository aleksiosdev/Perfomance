//
//  ButtonCell.swift
//  UIPerformance
//
//  Created by Aleksandr Lavrinenko on 11.08.2020.
//  Copyright © 2020 Sergey Pronin. All rights reserved.
//

import Foundation
import UIKit
import LoremIpsum

class ButtonsCell: UICollectionViewCell {
	let titleLabel: UILabel
	let descriptionLabel: UILabel

	let bubbleImageView: UIImageView
	let avatarImageView: UIImageView

	let contentStackView: UIStackView

	let horizontalButtonStack: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .horizontal
		stackView.spacing = 8
		stackView.distribution = .fillEqually
		stackView.isOpaque = true
		return stackView
	}()

	let verticalButtonStack: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.spacing = 8
		stackView.distribution = .fillEqually
		stackView.isOpaque = true
		return stackView
	}()


	override init(frame: CGRect) {
		titleLabel = Self.createTitleLabel()
		descriptionLabel = Self.createDescriptionLabel()
		bubbleImageView = Self.createBubbleImageView()
		avatarImageView = Self.createAvatarImageView()
		contentStackView = Self.createContentStackView()

		super.init(frame: frame)

		configureBaseElements()

		contentStackView.translatesAutoresizingMaskIntoConstraints = false
		contentStackView.addArrangedSubview(verticalButtonStack)

		NSLayoutConstraint.activate([
			verticalButtonStack.heightAnchor.constraint(equalToConstant: 64)
		])
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func prepareForReuse() {
		super.prepareForReuse()
		verticalButtonStack.arrangedSubviews.forEach {
			verticalButtonStack.removeArrangedSubview($0)
		}
		horizontalButtonStack.arrangedSubviews.forEach {
			horizontalButtonStack.removeArrangedSubview($0)
		}
	}

	func configure(model: ButtonsModel) {
		model.buttons.first?.forEach { (title) in
			let button = UIButton(type: .system)
			button.setAttributedTitle(title, for: .normal)
			button.backgroundColor = .gray
			button.layer.cornerRadius = 8
			button.setTitleColor(.white, for: .normal)
			horizontalButtonStack.addArrangedSubview(button)
		}
		verticalButtonStack.addArrangedSubview(horizontalButtonStack)

		model.buttons.last?.forEach { title in
			let button = UIButton(type: .system)
			button.setAttributedTitle(title, for: .normal)
			button.backgroundColor = .blue
			button.layer.cornerRadius = 8
			button.setTitleColor(.white, for: .normal)
			verticalButtonStack.addArrangedSubview(button)
		}

		titleLabel.attributedText = model.title
		descriptionLabel.attributedText = model.description
	}
}

extension ButtonsCell: BaseCell { }
