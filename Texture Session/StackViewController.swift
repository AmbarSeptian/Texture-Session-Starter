//
//  StackViewController.swift
//  Texture Session
//
//  Created by Ambar Septian on 12/07/19.
//  Copyright © 2019 Ambar Septian. All rights reserved.
//

import AsyncDisplayKit

class StackViewController: ASViewController<ASDisplayNode> {
    init() {
        
        let rootNode = ASDisplayNode()
        rootNode.backgroundColor = .white
        rootNode.automaticallyManagesSubnodes = true
        super.init(node: rootNode)
        
        let redNode = ASDisplayNode()
        redNode.style.flexBasis = ASDimensionMake("50%")
        redNode.backgroundColor = .red
        
        let blueNode = ASDisplayNode()
        blueNode.style.preferredSize = CGSize(width: 50, height: 100)
        blueNode.style.width = ASDimensionMake(100)
        blueNode.backgroundColor = .blue
        
        rootNode.layoutSpecBlock = { _, _ in
            let stack = ASStackLayoutSpec(direction: .horizontal, spacing: 10, justifyContent: .start, alignItems: .stretch, children: [redNode, blueNode])
            stack.style.height = ASDimensionMake(100)
            return stack
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
