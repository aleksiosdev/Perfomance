//
//  BaseCellNode.swift
//  UIPerformance
//
//  Created by Egor T on 8/17/20.
//  Copyright © 2020 Egor T. All rights reserved.
//

import Foundation
import UIKit
import AsyncDisplayKit

class BaseCellNode: ASCellNode {
    let titleNode: ASTextNode = {
        let textNode = ASTextNode()
        textNode.backgroundColor = .white
        textNode.isOpaque = true
        textNode.isLayerBacked = true
        return textNode
    }()

    let descriptionNode: ASTextNode = {
        let textNode = ASTextNode()
        textNode.backgroundColor = .white
        textNode.isOpaque = true
        textNode.isLayerBacked = true
        return textNode
    }()

    let avatarNode: ASImageNode = {
        let imageNode = ASImageNode()
        imageNode.style.preferredSize = CGSize(width: 16, height: 16)
        imageNode.cornerRoundingType = .precomposited
        imageNode.cornerRadius = 16
        imageNode.isOpaque = true
        imageNode.isLayerBacked = true
        imageNode.backgroundColor = .white
        return imageNode
    }()

//    let bubbleNode: ASDisplayNode = {
//        let displayNode = ASDisplayNode()
//        displayNode.backgroundColor = .white
//        displayNode.cornerRadius = 16
//
//        displayNode.shadowRadius = 2
//        displayNode.shadowOffset = CGSize(width: 1, height: 1)
//        displayNode.shadowColor = UIColor.black.cgColor
//        displayNode.shadowOpacity = 0.6
//
//        displayNode.isOpaque = true
//        displayNode.isLayerBacked = true
//
//        return displayNode
//    }()

    let bubbleNode: ASDisplayNode = {
        let backgroundImage = #imageLiteral(resourceName: "widget_bg")

        let node = ASDisplayNode(viewBlock: {
            let view = UIImageView()
            view.image = backgroundImage
                .opaqueImage(backgroundColor: UIColor(white: 0.95, alpha: 1))
                .resizableImage(
                    withCapInsets: UIEdgeInsets(top: 18, left: 20, bottom: 20, right: 20),
                    resizingMode: .stretch)
            view.contentMode = .scaleToFill
            return view
        })
        node.needsDisplayOnBoundsChange = true
        node.displaysAsynchronously = false
        return node
    }()

    override init() {
        super.init()
    }

    func prepareTextStack() -> ASStackLayoutSpec {
        let textStack = ASStackLayoutSpec(
            direction: .vertical, spacing: 8, justifyContent: .start, alignItems: .stretch,
            children: [titleNode, descriptionNode])
        textStack.style.flexShrink = 1
        return textStack
    }
}
