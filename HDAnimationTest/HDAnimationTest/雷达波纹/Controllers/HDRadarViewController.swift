//
//  HDRadarViewController.swift
//  HDAnimationTest
//
//  Created by HJddd on 2018/3/20.
//  Copyright © 2018年 HJddd. All rights reserved.
//

import UIKit

class HDRadarViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        let radarView = HDRadarView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        radarView.center = view.center
        view.addSubview(radarView)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
