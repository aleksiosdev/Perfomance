//
//  CardsModel.swift
//  UIPerformance
//
//  Created by Egor T on 12.08.2020.
//  Copyright © 2020 Egor T. All rights reserved.
//

import Foundation
import LoremIpsum

struct CardsModel: CellModel {
	let title = NSAttributedString(string: LoremIpsum.title, attributes: [.font: UIFont.boldSystemFont(ofSize: 16)])
	let description = NSAttributedString(string: LoremIpsum.title, attributes: [.font: UIFont.systemFont(ofSize: 14)])
	let avatarURL: URL = LoremIpsum.urlForPlaceholderImage(with: .init(width: 50, height: 50))
	let cards: [URL] = [
		LoremIpsum.urlForPlaceholderImage(with: .init(width: 350, height: 350)),
		LoremIpsum.urlForPlaceholderImage(with: .init(width: 350, height: 350)),
		LoremIpsum.urlForPlaceholderImage(with: .init(width: 350, height: 350))
	]
}
