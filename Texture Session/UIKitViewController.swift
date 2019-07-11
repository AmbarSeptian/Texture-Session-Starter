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
        subview.frame = CGRect(x: 20, y: 20, width: 200, height: 200)
        subview.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        view.addSubview(subview)
    }
}
