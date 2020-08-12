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

class PlayerView: UIView {
	override static var layerClass: AnyClass {
		return AVPlayerLayer.self
	}

	var playerLayer: AVPlayerLayer {
		return layer as! AVPlayerLayer
	}

	var player: AVPlayer? {
		get {
			return playerLayer.player
		}

		set {
			playerLayer.player = newValue
		}
	}
}

class VideoCell: TextCell {
	let playerView = PlayerView()

	override init(frame: CGRect) {
		super.init(frame: frame)

		textStackView.translatesAutoresizingMaskIntoConstraints = false
		textStackView.addArrangedSubview(playerView)

		NSLayoutConstraint.activate([
			playerView.heightAnchor.constraint(equalToConstant: 160),
			playerView.widthAnchor.constraint(equalToConstant: 160)
		])
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func configure() {
		super.configure()
		titleLabel.text = LoremIpsum.name
		descriptionLabel.text = LoremIpsum.lastName
		let avPlayer = AVPlayer(url: Bundle.main.url(forResource: "Sea", withExtension: "mp4")!)
		playerView.playerLayer.player = avPlayer
		avPlayer.play()
	}
}
