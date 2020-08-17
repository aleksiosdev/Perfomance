//
//  ButtonModel.swift
//  UIPerformance
//
//  Created by Egor T on 12.08.2020.
//  Copyright © 2020 Egor T. All rights reserved.
//

import Foundation
import LoremIpsum

struct ButtonsModel: CellModel {
	let title = NSAttributedString(string: LoremIpsum.name, attributes: [.font: UIFont.boldSystemFont(ofSize: 16)])
	let description = NSAttributedString(string: LoremIpsum.lastName, attributes: [.font: UIFont.systemFont(ofSize: 14)])
	let buttons = [[
		NSAttributedString(string: "YES", attributes: [.font: UIFont.systemFont(ofSize: 14)]),
		NSAttributedString(string: "NO", attributes: [.font: UIFont.systemFont(ofSize: 14)]),
		NSAttributedString(string: "MAYBE", attributes: [.font: UIFont.systemFont(ofSize: 14)])
	],
		[NSAttributedString(string: "Remind Later", attributes: [.font: UIFont.systemFont(ofSize: 14)])]
	]

	let avatarURL: URL = LoremIpsum.urlForPlaceholderImage(with: .init(width: 50, height: 50))
}
