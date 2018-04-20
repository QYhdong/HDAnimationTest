//
//  HDTransitionNextViewController.swift
//  HDAnimationTest
//
//  Created by HJddd on 2018/4/18.
//  Copyright © 2018年 HJddd. All rights reserved.
//

import UIKit

class HDTransitionNextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = HDDefineInfo().baseBlueColor
        
        let dissMissBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
        dissMissBtn.center = view.center
        dissMissBtn.setTitle("返回", for: UIControlState())
        dissMissBtn.setTitleColor(UIColor.black, for: UIControlState())
        dissMissBtn.addTarget(self, action: #selector(dissmisSelfVc), for: UIControlEvents.touchUpInside)
        dissMissBtn.backgroundColor = UIColor.red
        view.addSubview(dissMissBtn)
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.dismiss(animated: true, completion: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc fileprivate func dissmisSelfVc(){
//        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
