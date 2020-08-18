//
//  TextureViewController.swift
//  UIPerformance
//
//  Created by Sergey P on 8/17/20.
//  Copyright © 2020 Sergey P. All rights reserved.
//

import Foundation
import UIKit
import AsyncDisplayKit
import LoremIpsum

class TextureViewController: ASDKViewController<ASCollectionNode> {
    lazy var models: [CellModel] = TextureViewController.loadModels()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init() {
        let layout = UICollectionViewFlowLayout()
        
        super.init(node: ASCollectionNode(collectionViewLayout: layout))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        node.delegate = self
        node.dataSource = self
        node.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        
        node.view.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }
    
    private class func loadModels() -> [CellModel] {
        return (0...200).map { number in
            switch number % 2 {
            case 0:
                return PhotoModel()
            default:
                return TextModel()
            }
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

extension TextureViewController: ASCollectionDelegate, ASCollectionDataSource {
    func collectionNode(_ collectionNode: ASCollectionNode, constrainedSizeForItemAt indexPath: IndexPath) -> ASSizeRange {
        return ASSizeRangeMake(
            CGSize(width: collectionNode.view.bounds.width, height: 0),
            CGSize(width: collectionNode.view.bounds.width, height: .greatestFiniteMagnitude)
        )
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        let model = models[indexPath.item]
        return {
            switch model {
            case let model as TextModel:
                return TextCellNode(model: model)
            case let model as PhotoModel:
                return PhotoCellNode(model: model)
            default:
                return ASCellNode()
            }
        }
    }
}
