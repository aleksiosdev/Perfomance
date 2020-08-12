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

class ButtonsCell: TextCell {
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
		super.init(frame: frame)

		textStackView.translatesAutoresizingMaskIntoConstraints = false
		textStackView.addArrangedSubview(verticalButtonStack)

		NSLayoutConstraint.activate([
			verticalButtonStack.heightAnchor.constraint(equalToConstant: 64)
		])
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
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
