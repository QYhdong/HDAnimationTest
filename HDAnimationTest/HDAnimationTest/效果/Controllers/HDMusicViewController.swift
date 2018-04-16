//
//  HDMusicViewController.swift
//  HDAnimationTest
//
//  Created by HJddd on 2018/4/13.
//  Copyright © 2018年 HJddd. All rights reserved.
//

import UIKit

class HDMusicViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        myView.center = view.center
        myView.layer.addSublayer(replicatorLayer())
        view.addSubview(myView)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func replicatorLayer() -> CALayer {
        let layer = CALayer()
        layer.backgroundColor = HDDefineInfo().baseBlueColor.cgColor
        layer.frame = CGRect(x: 0, y: 0, width: 3, height: 20)
        layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        
        let animation = CABasicAnimation(keyPath: "transform.scale.y")
        animation.toValue = 0.1
        animation.duration = 0.5
        animation.autoreverses = true
        animation.repeatCount = MAXFLOAT
        layer.add(animation, forKey: "scaleAnimation")
        
        let replicatorLayer = CAReplicatorLayer()
        //复制范围
        replicatorLayer.frame = CGRect(x: 0, y: 7, width: 15, height: 15)
        //复制个数
        replicatorLayer.instanceCount = 10
        //每隔多少复制一份
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(6, 0, 0)
        //复制间隔
        replicatorLayer.instanceDelay = 0.2
//        replicatorLayer.instanceGreenOffset = 0
        replicatorLayer.masksToBounds = true
        
        replicatorLayer.addSublayer(layer)
        
        return replicatorLayer
    }

}
