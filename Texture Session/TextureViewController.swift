//
//  TextureViewController.swift
//  Texture Session
//
//  Created by Ambar Septian on 10/07/19.
//  Copyright © 2019 Ambar Septian. All rights reserved.
//

import AsyncDisplayKit

class TextureViewController: ASViewController<ASDisplayNode> {
    
    init() {
        // Create RootNode for ViewController
        let rootNode = ASDisplayNode()
        rootNode.backgroundColor = .white
        rootNode.automaticallyManagesSubnodes = true
        super.init(node: rootNode)
        

        // configure simple node
//        let simpleNode = ASDisplayNode()
//        simpleNode.backgroundColor = UIColor.green
//        simpleNode.cornerRadius = 12
//        simpleNode.frame = CGRect(x: 20, y: 20, width: 100, height: 100)
//        rootNode.addSubnode(simpleNode)
        
//
        let addressNode = AddressNode()
        let thumbnailNode = ThumbnailImageNode()

        rootNode.layoutSpecBlock = { _, constrainedSize in
            let children = [addressNode, thumbnailNode]

            return ASStackLayoutSpec(direction: .vertical,
                                     spacing: 20,
                                     justifyContent: .start,
                                     alignItems: .stretch,
                                     children: children)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


class AddressNode: ASDisplayNode {
    // create
    private let placeNameTextNode = ASTextNode()
    private let cityNameTextNode = ASTextNode()
    private let etaTextNode = ASTextNode()
    
    override init() {
        super.init()
        
        // Setup Node
        backgroundColor = .white
        automaticallyManagesSubnodes = true
        
        
        // Create attributed string
        let placeNameText = NSAttributedString(string: "Tokopedia Tower",
                            attributes: [
                                .font: UIFont.systemFont(ofSize: 20),
                                .foregroundColor: #colorLiteral(red: 0.1607843137, green: 0.5019607843, blue: 0.7254901961, alpha: 1)
            ]
        )
        
        let cityNameText = NSAttributedString(string: "Jakarta",
                            attributes: [
                                .font: UIFont.boldSystemFont(ofSize: 22),
                                .foregroundColor: #colorLiteral(red: 0.9450980392, green: 0.768627451, blue: 0.05882352941, alpha: 1)
            ]
        )
        
        let etaNameText = NSAttributedString(string: "10m",
                            attributes: [
                                .font: UIFont.systemFont(ofSize: 18),
                                .foregroundColor: #colorLiteral(red: 0.5843137255, green: 0.6470588235, blue: 0.6509803922, alpha: 1)
            ]
        )
        
        placeNameTextNode.attributedText = placeNameText
        cityNameTextNode.attributedText = cityNameText
        etaTextNode.attributedText = etaNameText
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let nameStackLayout = ASStackLayoutSpec(direction: .vertical,
                                                spacing: 5,
                                                justifyContent: .start,
                                                alignItems: .start,
                                                children: [placeNameTextNode, cityNameTextNode])
        
        let addressLayout = ASStackLayoutSpec(direction: .horizontal,
                                                spacing: 10,
                                                justifyContent: .spaceBetween,
                                                alignItems: .center,
                                                children: [nameStackLayout, etaTextNode])
        
        let insets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        return ASInsetLayoutSpec(insets: insets, child: addressLayout)
    }
}


class ThumbnailImageNode: ASDisplayNode {
    private let imageNode = ASNetworkImageNode()
    private let buttonNode = ASButtonNode()
   
    override init() {
        super.init()
       
        automaticallyManagesSubnodes = true
        
        // Setup image
        let imageURL = URL(string: "https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500")
        imageNode.url = imageURL
        
        // Setup Button Title & Target
        let buttonTitle = NSAttributedString(string: "Change",
                                             attributes: [
                                                .font: UIFont.systemFont(ofSize: 25),
                                                .foregroundColor: UIColor.white ]
        )
        buttonNode.setAttributedTitle(buttonTitle, for: .normal)
        buttonNode.addTarget(self, action: #selector(self.changeButtonTapped), forControlEvents: .touchUpInside)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        imageNode.style.width = ASDimensionMake("50%")
        let centerLayout = ASCenterLayoutSpec(horizontalPosition: .center, verticalPosition: .center, sizingOption: .minimumSize, child: imageNode)
        
        let ratioLayout = ASRatioLayoutSpec(ratio: 0.5, child: centerLayout)
        
        let inset = ASInsetLayoutSpec(insets: UIEdgeInsets(top: .infinity, left: 10, bottom: 10, right: 10), child: buttonNode)
        let overlayout = ASOverlayLayoutSpec(child: ratioLayout, overlay: inset)
        return overlayout
    }
    
    @objc func changeButtonTapped() {
        let newImageURL = URL(string: "https://cdn.pixabay.com/photo/2017/12/17/19/08/away-3024773_960_720.jpg")
        imageNode.url = newImageURL
    }
    
}

