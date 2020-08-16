//
//  VideoCell.swift
//  UIPerformance
//
//  Created by Aleksandr Lavrinenko on 11.08.2020.
//  Copyright © 2020 Sergey Pronin. All rights reserved.
//

import Foundation
import UIKit
import LoremIpsum
import AVKit
import AVFoundation

class VideoCell: UICollectionViewCell {
	let titleLabel: UILabel
	let descriptionLabel: UILabel

	let bubbleImageView: UIImageView
	let avatarImageView: UIImageView

	let contentStackView: UIStackView

	let playerView = PlayerView()

	override init(frame: CGRect) {
		titleLabel = Self.createTitleLabel()
		descriptionLabel = Self.createDescriptionLabel()
		bubbleImageView = Self.createBubbleImageView()
		avatarImageView = Self.createAvatarImageView()
		contentStackView = Self.createContentStackView()

		super.init(frame: frame)

		configureBaseElements()

		contentStackView.translatesAutoresizingMaskIntoConstraints = false
		contentStackView.addArrangedSubview(playerView)

		NSLayoutConstraint.activate([
			playerView.heightAnchor.constraint(equalToConstant: 160),
			playerView.widthAnchor.constraint(equalToConstant: 160)
		])
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func configure(model: VideoModel) {
		titleLabel.attributedText = model.title
		descriptionLabel.text = ""
		let avPlayer = AVPlayer(url: model.videoURL)
		playerView.playerLayer.player = avPlayer
		avPlayer.play()
	}
}

extension VideoCell: BaseCell { }
