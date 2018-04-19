//
//  HDMusicViewController.swift
//  HDAnimationTest
//
//  Created by HJddd on 2018/4/13.
//  Copyright © 2018年 HJddd. All rights reserved.
//

import UIKit

class HDMusicViewController: UIViewController {

    fileprivate  var secondView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        myView.center = view.center
        myView.layer.addSublayer(replicatorLayer())
        view.addSubview(myView)
        
        secondView  = UIView(frame: CGRect(x: 50, y: 350, width: 320, height: 200))
        secondView.layer.addSublayer(reflexLayer())
        view.addSubview(secondView)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //CAReplicatorLayer可以将自己的子图层复制指定的次数,并且复制体会保持被复制图层的各种基础属性以及动画CAReplicatorLayer可以将自己的子图层复制指定的次数,并且复制体会保持被复制图层的各种基础属性以及动画
    /*
     //复制图层次数
     open var instanceCount: Int
     //
     open var preservesDepth: Bool
     //复制间隔
     open var instanceDelay: CFTimeInterval
     //复制图层距上一图层的位移
     open var instanceTransform: CATransform3D
     //设置复制图层颜色
     open var instanceColor: CGColor?
     //相对于上一复制图层红色偏移量
     open var instanceRedOffset: Float
     //相对于上一复制图层绿色偏移量
     open var instanceGreenOffset: Float
     //相对于上一复制图层蓝色偏移量
     open var instanceBlueOffset: Float
     //相对于上一复制图层透明度偏移量
     open var instanceAlphaOffset: Float
     
     */
    
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
        //每隔多少距离复制一份
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(6, 0, 0)
        //复制间隔
        replicatorLayer.instanceDelay = 0.2
//        replicatorLayer.instanceGreenOffset = 0
//        replicatorLayer.masksToBounds = true
        
        replicatorLayer.addSublayer(layer)
        
        return replicatorLayer
    }

    //反射效果
    fileprivate func reflexLayer()->CALayer{
        
        let layerr = CALayer()
        layerr.frame = CGRect(x: 0, y: 0, width: 160, height: 100)
        layerr.contents = UIImage(named: "WechatIMG179")?.cgImage
        
        let hdLayer = CAReplicatorLayer()
        hdLayer.instanceCount = 2
        
        var  transform = CATransform3DIdentity
        let  voffset = secondView.bounds.size.height + 1
        transform = CATransform3DTranslate(transform, 0, voffset, 0)
        transform = CATransform3DScale(transform, 1, -1, 0)
        hdLayer.instanceTransform = transform
        hdLayer.instanceAlphaOffset = -0.6
        
        hdLayer.addSublayer(layerr)
        
        return hdLayer
    }
    
}
