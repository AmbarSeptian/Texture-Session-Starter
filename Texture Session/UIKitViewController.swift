//
//  UIKitViewController.swift
//  Texture Session
//
//  Created by Ambar Septian on 10/07/19.
//  Copyright © 2019 Ambar Septian. All rights reserved.
//

import AsyncDisplayKit

class UIKitViewController: UIViewController {
    
    override func viewDidLoad() {
        // this is how we add subview
        view.backgroundColor = .white
        
        let subview = UIView()
        subview.frame = CGRect(x: 100, y: 100, width: 200, height: 100)
        subview.backgroundColor = #colorLiteral(red: 0.6349999905, green: 0.8119999766, blue: 0.3880000114, alpha: 1)
        view.addSubview(subview)
    }
}
