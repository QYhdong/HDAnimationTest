//
//  HDUnlockViewController.swift
//  HDAnimationTest
//
//  Created by HJddd on 2018/4/19.
//  Copyright © 2018年 HJddd. All rights reserved.
//

import UIKit

class HDUnlockViewController: UIViewController {

    fileprivate var unlockLabel:UILabel!
    fileprivate var colorLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = HDDefineInfo().baseBlueColor
        
        unlockDemo()
        colorTextDemo()

    }

    fileprivate func unlockLayer() -> CALayer{
        let unlockLayer = CAGradientLayer()
        unlockLayer.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 70)
        unlockLayer.position = view.center
        //颜色分配
        unlockLayer.colors = [UIColor.black.cgColor,UIColor.white.cgColor,UIColor.black.cgColor]
        //颜色分割线
        unlockLayer.locations = [0.25,0.5,0.75]
        //起点
        unlockLayer.startPoint = CGPoint(x: 0, y: 0)
        //终点
        unlockLayer.endPoint = CGPoint(x: 1, y: 0)
        
        return unlockLayer
    }
    
    //滑动解锁方法
    fileprivate func unlockDemo(){

        let gradientLayer = unlockLayer()
        
        unlockLabel = UILabel(frame: gradientLayer.bounds)
        unlockLabel.text = "滑动以解锁 >>"
        unlockLabel.textColor = UIColor.init(white: 0, alpha: 0.8)
        unlockLabel.font = UIFont.systemFont(ofSize: 26)
        unlockLabel.textAlignment = .center
        view.addSubview(unlockLabel)
        
        //遮罩
        gradientLayer.mask = unlockLabel.layer
        
        //动画
        let animation = CABasicAnimation(keyPath: "locations")
        //分割线变化
        animation.fromValue = [0,0,0.25]
        animation.toValue = [0.75,1,1]
        animation.repeatCount = MAXFLOAT
        animation.duration = 3
        gradientLayer.add(animation, forKey: "locations")
        
        view.layer.addSublayer(gradientLayer)
    }
    
    fileprivate func colorTextDemo(){

        let gradientLayer = colorTextLayer()
        
        colorLabel = UILabel(frame: gradientLayer.bounds)
        colorLabel.text = "红黄蓝颜色渐变"
        colorLabel.textColor = UIColor.init(white: 0, alpha: 0.8)
        colorLabel.font = UIFont.systemFont(ofSize: 28)
        colorLabel.textAlignment = .center
        view.addSubview(colorLabel)
        
        //遮罩
        gradientLayer.mask = colorLabel.layer
        
        //动画
        let animation = CABasicAnimation(keyPath: "locations")
        //分割线变化
        animation.fromValue = [0,0,0.25]
        animation.toValue = [0.75,1,1]
        animation.repeatCount = MAXFLOAT
        animation.duration = 3
        gradientLayer.add(animation, forKey: "locations")
        
        view.layer.addSublayer(gradientLayer)
    }
    
    fileprivate func colorTextLayer() -> CALayer{
        let unlockLayer = CAGradientLayer()
        unlockLayer.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 70)
        unlockLayer.position.x = view.center.x
        unlockLayer.position.y = view.center.y - 100
        //颜色分配
        unlockLayer.colors = [UIColor.red.cgColor,UIColor.yellow.cgColor,UIColor.blue.cgColor]
        //颜色分割线
        unlockLayer.locations = [0.25,0.5,0.75]
        //起点
        unlockLayer.startPoint = CGPoint(x: 0, y: 0)
        //终点
        unlockLayer.endPoint = CGPoint(x: 0, y: 1)
        
        return unlockLayer
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
