//
//  TextCellNode.swift
//  UIPerformance
//
//  Created by Sergey Pronin on 8/17/20.
//  Copyright © 2020 Sergey Pronin. All rights reserved.
//

import Foundation
import UIKit
import AsyncDisplayKit
import LoremIpsum

class TextCellNode: BaseCellNode {
    private let model: TextModel
    
    init(model: TextModel) {
        self.model = model
        super.init()
        isOpaque = true
        automaticallyManagesSubnodes = true
        
        titleNode.attributedText = model.title
        descriptionNode.attributedText = model.description
        
        LoremIpsum.asyncPlaceholderImage(with: CGSize(width: 32, height: 32)) { [weak self] (image) in
            self?.avatarNode.image = image
        }
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let textStack = prepareTextStack()
        
        let textAvatarStack = ASStackLayoutSpec(
            direction: .horizontal, spacing: 4, justifyContent: .start, alignItems: .end,
            children: [textStack, avatarNode])
        
        let insetStack = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16), child: textAvatarStack)
        
        let bubbleStack = ASBackgroundLayoutSpec(child: insetStack, background: bubbleNode)
        let bubbleInsetStack = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 2, left: 64, bottom: 8, right: 16), child: bubbleStack)
        
        return ASStackLayoutSpec(
            direction: .vertical, spacing: 0, justifyContent: .start, alignItems: .end,
            children: [bubbleInsetStack])
    }
}
