//
//  ViewController.swift
//  CornerRadiusSwift
//
//  Created by Apple on 2018/2/27.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let logoView = UIView.init(frame: CGRect.init(x: 100, y: 150, width: 100, height: 150))
        view.addSubview(logoView)
        
        logoView.view_addCorner(radius: 5, borderWidth: 2, backgroundColor: UIColor.orange, borderColor: UIColor.white)
        
        let logoImageView = UIImageView.init(frame: CGRect.init(x: 100, y: 350, width: 150, height: 150))
        logoImageView.image = UIImage.init(named: "logo.jpeg")
        view.addSubview(logoImageView)
        
        logoImageView.image_addCorner(radius: 20)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

