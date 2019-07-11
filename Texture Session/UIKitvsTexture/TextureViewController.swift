//
//  ViewController.swift
//  Texture Session
//
//  Created by Ambar Septian on 10/07/19.
//  Copyright © 2019 Ambar Septian. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class TextureViewController: ASViewController<ASDisplayNode> {
    public init() {
        // this is boiler plate
        let rootNode = ASDisplayNode()
        rootNode.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        super.init(node: rootNode)
        
        // this is how we add subnode
        let subnode = ASDisplayNode()
        subnode.frame = CGRect(x: 100, y: 100, width: 200, height: 100)
        subnode.backgroundColor = #colorLiteral(red: 0.6349999905, green: 0.8119999766, blue: 0.3880000114, alpha: 1)
        rootNode.addSubnode(subnode)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
