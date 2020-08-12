//
//  VideoModel.swift
//  UIPerformance
//
//  Created by Aleksandr Lavrinenko on 12.08.2020.
//  Copyright © 2020 Sergey Pronin. All rights reserved.
//

import Foundation
import LoremIpsum

struct VideoModel: CellModel {
	let title = NSAttributedString(string: LoremIpsum.title, attributes: [.font: UIFont.boldSystemFont(ofSize: 16)])
	let avatarURL: URL = LoremIpsum.urlForPlaceholderImage(with: .init(width: 50, height: 50))
	let videoURL: URL = Bundle.main.url(forResource: "Sea", withExtension: "mp4")!
}
