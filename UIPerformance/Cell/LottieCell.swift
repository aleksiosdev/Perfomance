//
//  LottieCell.swift
//  UIPerformance
//
//  Created by Aleksandr Lavrinenko on 12.08.2020.
//  Copyright © 2020 Sergey Pronin. All rights reserved.
//

import UIKit
import Lottie
import LoremIpsum

final class LottieCell: UICollectionViewCell {
	let titleLabel: UILabel
	let descriptionLabel: UILabel

	let bubbleImageView: UIImageView
	let avatarImageView: UIImageView

	let contentStackView: UIStackView

	let animationView: AnimationView = {
		let animationView = AnimationView()
		animationView.contentMode = .scaleAspectFit
		animationView.loopMode = .loop
		animationView.animationSpeed = 0.5
		return animationView
	}()


	override init(frame: CGRect) {
		titleLabel = Self.createTitleLabel()
		descriptionLabel = Self.createDescriptionLabel()
		bubbleImageView = Self.createBubbleImageView()
		avatarImageView = Self.createAvatarImageView()
		contentStackView = Self.createContentStackView()

		super.init(frame: frame)

		configureBaseElements()

		animationView.translatesAutoresizingMaskIntoConstraints = false
		contentStackView.addArrangedSubview(animationView)

		NSLayoutConstraint.activate([
			animationView.heightAnchor.constraint(equalToConstant: 160),
			animationView.widthAnchor.constraint(equalToConstant: 160)
		])
	}

	override func prepareForReuse() {
		super.prepareForReuse()
		animationView.stop()
	}

	func configure(model: LottieModel) {
		titleLabel.attributedText = model.title
		descriptionLabel.text = ""
		animationView.animation = model.animation
		animationView.play()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension LottieCell: BaseCell { }
