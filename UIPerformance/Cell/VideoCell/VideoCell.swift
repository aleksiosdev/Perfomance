//
//  VideoCell.swift
//  UIPerformance
//
//  Created by Egor T on 11.08.2020.
//  Copyright © 2020 Egor T. All rights reserved.
//

import Foundation
import UIKit
import LoremIpsum
import AVKit
import AVFoundation

class VideoCell: UICollectionViewCell {
    let titleLabel: UILabel
    let descriptionLabel: UILabel

    let bubbleView: UIView
    let avatarImageView: UIImageView

    let contentStackView: UIStackView

    let playerView = PlayerView()

    override init(frame: CGRect) {
        titleLabel = Self.createTitleLabel()
        descriptionLabel = Self.createDescriptionLabel()
        bubbleView = Self.createBubbleView()
        avatarImageView = Self.createAvatarImageView()
        contentStackView = Self.createContentStackView()

        super.init(frame: frame)

        configureBaseElements()

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
        playerView.player = avPlayer

        // FIXME: Video - Pause/Play when not visible
        avPlayer.play()
    }
}

extension VideoCell: BaseCell { }
