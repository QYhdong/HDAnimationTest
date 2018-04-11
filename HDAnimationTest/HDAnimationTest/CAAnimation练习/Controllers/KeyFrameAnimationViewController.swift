//
//  KeyFrameAnimationViewController.swift
//  HDAnimationTest
//
//  Created by HJddd on 2018/4/11.
//  Copyright © 2018年 HJddd. All rights reserved.
//

import UIKit

class KeyFrameAnimationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = UIColor.white
        let myView = HDCoreAnimationView(frame: self.view.bounds)
        myView.animationTypes = .keyFrame
        view.addSubview(myView)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
