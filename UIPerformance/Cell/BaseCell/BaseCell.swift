//
//  BaseCell.swift
//  UIPerformance
//
//  Created by Aleksandr Lavrinenko on 16.08.2020.
//  Copyright © 2020 Sergey Pronin. All rights reserved.
//

import UIKit

protocol ConfigrableCell: UICollectionViewCell {
    func configure()
}

protocol BaseCell: UICollectionViewCell {
    var titleLabel: UILabel { get }
    var descriptionLabel: UILabel { get }

    var bubbleView: UIView { get }
    var avatarImageView: UIImageView { get }

    var contentStackView: UIStackView { get }

    static func createTitleLabel() -> UILabel
    static func createDescriptionLabel() -> UILabel
    static func createAvatarImageView() -> UIImageView
    static func createBubbleView() -> UIView
    static func createContentStackView() -> UIStackView

    func configureBaseElements()
    func setAvatar(_ image: UIImage?)
}

extension BaseCell {
    static func createTitleLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0

        // FIXME: Blending
//        label.backgroundColor = .white
        return label
    }

    static func createDescriptionLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0

        // FIXME: Blending
//        label.backgroundColor = .white
        return label
    }

    static func createAvatarImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }

    static func createBubbleView() -> UIView {
        let view = UIView()
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false

        // FIXME: Background using cap insets
//        let imageView = createCardBackgroundView()
//        view.addSubview(imageView)
//        NSLayoutConstraint.activate([
//            imageView.leftAnchor.constraint(equalTo: view.leftAnchor),
//            imageView.rightAnchor.constraint(equalTo: view.rightAnchor),
//            imageView.topAnchor.constraint(equalTo: view.topAnchor),
//            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//        ])

        view.backgroundColor = .white
        view.layer.cornerRadius = 16

        view.layer.shadowRadius = 2
        view.layer.shadowOffset = CGSize(width: 1, height: 1)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.6
        view.layer.masksToBounds = false

        return view
    }

    static func createContentStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fill
        stackView.isOpaque = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }

    func setAvatar(_ image: UIImage?) {
        avatarImageView.layer.cornerRadius = 8
        avatarImageView.layer.masksToBounds = true

        avatarImageView.image = image
    }

    func configureBaseElements() {
        self.translatesAutoresizingMaskIntoConstraints = false

        // Configuring contentView
        contentView.isOpaque = true
        contentView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width),
            contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width),

            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])

        // Configuring other views
        contentView.addSubview(bubbleView)
        bubbleView.addSubview(contentStackView)
        bubbleView.addSubview(avatarImageView)

        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(descriptionLabel)

        let padding: CGFloat = 16

        NSLayoutConstraint.activate([
            bubbleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            bubbleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            bubbleView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 64),
            bubbleView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -padding),

            // FIXME: Stack view
            contentStackView.leftAnchor.constraint(equalTo: bubbleView.leftAnchor, constant: padding),
            contentStackView.rightAnchor.constraint(equalTo: avatarImageView.leftAnchor, constant: -padding),
            contentStackView.topAnchor.constraint(equalTo: bubbleView.topAnchor, constant: padding),
            contentStackView.bottomAnchor.constraint(equalTo: bubbleView.bottomAnchor, constant: -padding),

            avatarImageView.rightAnchor.constraint(equalTo: bubbleView.rightAnchor, constant: -padding),
            avatarImageView.bottomAnchor.constraint(equalTo: bubbleView.bottomAnchor, constant: -padding),
            avatarImageView.widthAnchor.constraint(equalToConstant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 16),
        ])
    }
}


extension UIImage {
    func opaqueImage(backgroundColor: UIColor) -> UIImage {
        let format = UIGraphicsImageRendererFormat(for: traitCollection)
        format.opaque = true
        let rect = CGRect(origin: .zero, size: size)
        return UIGraphicsImageRenderer(size: size, format: format).image { _ in
            backgroundColor.setFill()
            UIBezierPath(rect: rect).fill()
            draw(in: rect)
        }
    }
}


extension BaseCell {
    static func createCardBackgroundView() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "widget_bg")
            .resizableImage(
                withCapInsets: UIEdgeInsets(top: 18, left: 20, bottom: 20, right: 20),
                resizingMode: .stretch)
        imageView.contentMode = .scaleToFill

        // FIXME: Blending
//        imageView.isOpaque = true
//        imageView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
}
