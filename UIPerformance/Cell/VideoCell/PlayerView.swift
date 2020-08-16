//
//  PlayerView.swift
//  UIPerformance
//
//  Created by Aleksandr Lavrinenko on 16.08.2020.
//  Copyright © 2020 Sergey Pronin. All rights reserved.
//

import UIKit
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
