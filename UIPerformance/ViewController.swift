//
//  ViewController.swift
//  UIPerformance
//
//  Created by Egor T on 8/9/20.
//  Copyright © 2020 Egor T. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    let batchLength = 200
    var models: [CellModel] = []
    var isLoading: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        models = _loadModels()

        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(TextCell.self, forCellWithReuseIdentifier: "TextCell")
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "PhotoCell")
        collectionView.register(CardsCell.self, forCellWithReuseIdentifier: "CardsCell")
        collectionView.register(ButtonsCell.self, forCellWithReuseIdentifier: "ButtonsCell")
        collectionView.register(LottieCell.self, forCellWithReuseIdentifier: "LottieCell")
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: "VideoCell")

        collectionView.backgroundColor = UIColor(white: 0.95, alpha: 1)

        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    }

    private func _loadModels() -> [CellModel] {
        let models: [CellModel] = (0...self.batchLength).map { number in
            switch number % 6 {
            case 0:
                return TextModel()
//            case 1:
//                return PhotoModel()
//            case 2:
//                return ButtonsModel()
//            case 3:
//                return LottieModel()
//            case 4:
//                return VideoModel()
            default:
                return PhotoModel()
            }
        }
        return models
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.row]
        switch model {
        case let textModel as TextModel:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "TextCell",
                for: indexPath) as! TextCell
            cell.configure(model: textModel)
            return cell
        case let videoModel as VideoModel:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "VideoCell",
                for: indexPath) as! VideoCell
            cell.configure(model: videoModel)
            return cell
        case let photoModel as PhotoModel:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "PhotoCell",
                for: indexPath) as! PhotoCell
            cell.configure(model: photoModel)
            return cell
        case let buttonsModel as ButtonsModel:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "ButtonsCell",
                for: indexPath) as! ButtonsCell
            cell.configure(model: buttonsModel)
            return cell
        case let lottieModel as LottieModel:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "LottieCell",
                for: indexPath) as! LottieCell
            cell.configure(model: lottieModel)
            return cell
        case let cardsModel as CardsModel:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "CardsCell",
                for: indexPath) as! CardsCell
            cell.configure(cardsModel: cardsModel)
            return cell
        default:
            fatalError()
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {

        // FIXME: Video - Pause/Play when not visible
        if let videoCell = cell as? VideoCell {
            videoCell.playerView.player?.play()
        }

        if let lottieCell = cell as? LottieCell {
            lottieCell.animationView.play()
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        didEndDisplaying cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        // FIXME: Video - Pause/Play when not visible
        if let videoCell = cell as? VideoCell {
            videoCell.playerView.player?.pause()
        }

        // FIXME: Lottie - Pause/Play when not visible
        if let lottieCell = cell as? LottieCell {
            lottieCell.animationView.pause()
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout { }
