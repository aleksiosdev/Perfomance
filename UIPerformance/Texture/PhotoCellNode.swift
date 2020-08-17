//
//  PhotoCellNode.swift
//  UIPerformance
//
//  Created by Sergey Pronin on 8/17/20.
//  Copyright © 2020 Sergey Pronin. All rights reserved.
//

import Foundation
import AsyncDisplayKit
import UIKit
import LoremIpsum


class PhotoCellNode: BaseCellNode {
    private let model: PhotoModel
    
    let photoNode: ASImageNode = {
        let imageNode = ASImageNode()
        imageNode.cornerRoundingType = .precomposited
        imageNode.cornerRadius = 8
        imageNode.isOpaque = true
        imageNode.backgroundColor = .white
        imageNode.isLayerBacked = true
        return imageNode
    }()
    
    init(model: PhotoModel) {
        self.model = model
        super.init()
        isOpaque = true
        automaticallyManagesSubnodes = true
        
        titleNode.attributedText = model.title
        descriptionNode.attributedText = model.description
        
        LoremIpsum.asyncPlaceholderImage(with: CGSize(width: 600, height: 600)) { [weak self] (image) in
            self?.avatarNode.image = image
            self?.photoNode.image = image
            self?.setNeedsLayout()
        }
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let textStack = prepareTextStack()
        
        let photoRatioSpec = ASRatioLayoutSpec(ratio: 1, child: photoNode)
        
        photoRatioSpec.style.flexShrink = 1
        let imagesStack = ASStackLayoutSpec(
            direction: .horizontal, spacing: 8, justifyContent: .start, alignItems: .end,
            children: [photoRatioSpec, avatarNode])
        
        let textImagesStack = ASStackLayoutSpec(
            direction: .vertical, spacing: 8, justifyContent: .start, alignItems: .stretch,
            children: [textStack, imagesStack])
        
        let insetStack = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16), child: textImagesStack)
        
        let bubbleStack = ASBackgroundLayoutSpec(child: insetStack, background: bubbleNode)
        let bubbleInsetStack = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 2, left: 64, bottom: 8, right: 16), child: bubbleStack)
        
        return ASStackLayoutSpec(
            direction: .vertical, spacing: 0, justifyContent: .start, alignItems: .end,
            children: [bubbleInsetStack])
    }
}
