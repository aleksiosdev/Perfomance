//
//  ViewController.swift
//  UIPerformance
//
//  Created by Sergey Pronin on 8/9/20.
//  Copyright © 2020 Sergey Pronin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        collectionView.delegate = self
        collectionView.dataSource = self

		collectionView.register(TextCell.self, forCellWithReuseIdentifier: "TextCell")
		collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "PhotoCell")
		collectionView.register(CardsCell.self, forCellWithReuseIdentifier: "CardsCell")
		collectionView.register(ButtonsCell.self, forCellWithReuseIdentifier: "ButtonsCell")
		collectionView.register(LottieCell.self, forCellWithReuseIdentifier: "LottieCell")
		collectionView.register(VideoCell.self, forCellWithReuseIdentifier: "VideoCell")
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    }

	override var prefersStatusBarHidden: Bool {
		return true
	}
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1000
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier: String
        switch indexPath.row % 5 {
        case 0:
            identifier = "CardsCell"
        case 1:
            identifier = "PhotoCell"
		case 2:
			identifier = "ButtonsCell"
		case 3:
			identifier = "LottieCell"
		case 4:
			identifier = "VideoCell"
        default:
            identifier = "TextCell"
        }
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ConfigrableCell
		cell.configure()
		return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout { }
