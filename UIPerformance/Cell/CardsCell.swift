//
//  CollectionCell.swift
//  UIPerformance
//
//  Created by Aleksandr Lavrinenko on 11.08.2020.
//  Copyright © 2020 Sergey Pronin. All rights reserved.
//

import UIKit
import LoremIpsum

class CardsCell: UICollectionViewCell {
	let titleLabel: UILabel
	let descriptionLabel: UILabel

	let bubbleImageView: UIImageView
	let avatarImageView: UIImageView

	let contentStackView: UIStackView

	let collectionView: UICollectionView = {
		let flowLayout = UICollectionViewFlowLayout()
		flowLayout.scrollDirection = .horizontal
		flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
		return collectionView
	}()

	var cards: [URL] = []

	override init(frame: CGRect) {
		titleLabel = Self.createTitleLabel()
		descriptionLabel = Self.createDescriptionLabel()
		bubbleImageView = Self.createBubbleImageView()
		avatarImageView = Self.createAvatarImageView()
		contentStackView = Self.createContentStackView()

		super.init(frame: frame)

		configureBaseElements()

		contentStackView.addArrangedSubview(collectionView)

		collectionView.register(CardCell.self, forCellWithReuseIdentifier: "Card")
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.backgroundColor = .white
		collectionView.layer.cornerRadius = 6

		NSLayoutConstraint.activate([
			collectionView.heightAnchor.constraint(equalToConstant: 160)
			])
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func configure(cardsModel: CardsModel) {
		titleLabel.attributedText = cardsModel.title
		cards = cardsModel.cards

		collectionView.reloadData()
	}
}

extension CardsCell: BaseCell { }

fileprivate class CardCell: UICollectionViewCell, ConfigrableCell {
	let imageView: UIImageView = {
		let photoImageView = UIImageView()
		photoImageView.contentMode = .scaleAspectFit
		photoImageView.layer.cornerRadius = 6
		return photoImageView
	}()
	let titleLabel = UILabel()
	let stackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.spacing = 8
		stackView.distribution = .equalSpacing
		return stackView
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)

		stackView.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(stackView)

		stackView.addArrangedSubview(imageView)
		stackView.addArrangedSubview(titleLabel)


		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
			stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
			stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),

			imageView.heightAnchor.constraint(equalToConstant: 160),

			contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 100)
		])
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func configure() {
		titleLabel.text = LoremIpsum.name
		LoremIpsum.asyncPlaceholderImage(with: CGSize(width: 200, height: 400)) { (image) in
			self.imageView.image = image
		}
	}
}

extension CardsCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Card", for: indexPath) as! ConfigrableCell
		cell.configure()
		return cell
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return cards.count
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return .init(width: 160, height: 160)
	}
}
