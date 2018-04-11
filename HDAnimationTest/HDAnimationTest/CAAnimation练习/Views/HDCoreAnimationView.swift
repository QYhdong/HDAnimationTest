//
//  HDCoreAnimationView.swift
//  HDAnimationTest
//
//  Created by HJddd on 2018/3/28.
//  Copyright © 2018年 HJddd. All rights reserved.
//

import UIKit

class HDCoreAnimationView: UIView {

    
    public var animationTypes:animationType?            //动画类型
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
        //动画类型
        switch animationTypes?.hashValue {
        case 0:
            baseAnimationTest()
        case 1:
             keyFrameAnimationTest()
        case 2:
            springAnimation()
        default:
            print("")
        }

    }
    
    //基础动画
    func baseAnimationTest(){
//        //keyPath对应的初始值
//        open var fromValue: Any?
//        //结束值
//        open var toValue: Any?
//        //过渡值(在当前的位置上增加多少,不设置toValue时，toValue = fromValue + byValue)
//        open var byValue: Any?
        hdCreatLayer(point: CGPoint(x: 20, y: 120)).add( animationTimeTimingFunction(CGPoint(x: 200, y: 120), kCAMediaTimingFunctionLinear), forKey: "position")
        hdCreatLayer(point: CGPoint(x: 20, y: 170)).add( animationTimeTimingFunction(CGPoint(x: 200, y: 170), kCAMediaTimingFunctionEaseIn), forKey: "position")
        hdCreatLayer(point: CGPoint(x: 20, y: 220)).add( animationTimeTimingFunction(CGPoint(x: 200, y: 220), kCAMediaTimingFunctionEaseOut), forKey: "position")
        hdCreatLayer(point: CGPoint(x: 20, y: 270)).add( animationTimeTimingFunction(CGPoint(x: 200, y: 270), kCAMediaTimingFunctionEaseInEaseOut), forKey: "position")
        hdCreatLayer(point: CGPoint(x: 20, y: 320)).add( animationTimeTimingFunction(CGPoint(x: 200, y: 320), kCAMediaTimingFunctionDefault), forKey: "position")
        
        hdCreatLabel(framee: CGRect(x: SCREEN_WIDTH - 100, y: 110, width: 100, height: 30),title: "Linear")
        hdCreatLabel(framee: CGRect(x: SCREEN_WIDTH - 100, y: 160, width: 100, height: 30),title: "EaseIn")
        hdCreatLabel(framee: CGRect(x: SCREEN_WIDTH - 100, y: 210, width: 100, height: 30),title: "EaseOut")
        hdCreatLabel(framee: CGRect(x: SCREEN_WIDTH - 100, y: 260, width: 100, height: 30),title: "EaseInEaseOut")
        hdCreatLabel(framee: CGRect(x: SCREEN_WIDTH - 100, y: 310, width: 100, height: 30),title: "Default")
        
    }
    
    //关键帧动画
    func keyFrameAnimationTest(){
        
        let layerA = hdCreatLayer(point: CGPoint(x: 100, y: 200))
        layerA.bounds = CGRect(x: 0, y: 0, width: 50, height: 50)
        let keyAnimationA = CAKeyframeAnimation(keyPath: "bounds")

        keyAnimationA.values = [CGRect(x: 0, y: 0, width: 100, height: 100) ,CGRect(x: 0, y: 0, width: 50, height: 50),CGRect(x: 0, y: 0, width: 150, height: 150),CGRect(x: 0, y: 0, width: 50, height: 50),CGRect(x: 0, y: 0, width: 20, height: 20)]
        keyAnimationA.duration = 5
        keyAnimationA.repeatCount = MAXFLOAT
        layerA.add(keyAnimationA, forKey: "bounds")
        
        
        let layerB = hdCreatLayer(point: CGPoint(x: 100, y: 500))
        layerB.bounds = CGRect(x: 0, y: 0, width: 50, height: 50)
        layerB.backgroundColor = HDDefineInfo().baseBlueColor.cgColor
        
        let keyAnimationB = CAKeyframeAnimation(keyPath: "position")
        keyAnimationB.values = [CGPoint(x: 100, y: 500),CGPoint(x: 250, y: 500),CGPoint(x: 250, y: 400),CGPoint(x: 100, y: 400),CGPoint(x:100,y:500)]
        keyAnimationB.duration = 5
        
        keyAnimationB.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear),CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut),CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn),CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)]
        
        keyAnimationB.repeatCount = MAXFLOAT
//        //动画结束后停留
//        keyAnimation.isRemovedOnCompletion = false
//        keyAnimation.fillMode = kCAFillModeForwards
        
        layerB.add(keyAnimationB, forKey: "position")
    }
    
    //弹性动画
    func springAnimation(){
        let layerC = hdCreatLayer(point: CGPoint(x: 100, y: 100))
        
        let springAnimation = CASpringAnimation(keyPath: "position")
        springAnimation.mass = 0.5                            //质量
        springAnimation.damping = 1                          //阻尼
        springAnimation.initialVelocity = 0.5       //初始速度
        springAnimation.toValue = CGPoint(x: 200, y: 300)
        springAnimation.duration = 5
        
        layerC.add(springAnimation, forKey: "position")
    }
    
    
    //组动画
    func groupAnimation(){
        
        let groupA  = CAAnimationGroup()
        
    }
    
    //创建label
    func hdCreatLabel(framee:CGRect,title:String){
        let labelA = UILabel(frame: framee)
        labelA.font = UIFont.systemFont(ofSize: 14)
        labelA.text = title
        self.addSubview(labelA)
    }
    
    //创建layer
    func hdCreatLayer(point:CGPoint) -> CALayer {
        let layerA = CALayer()
        layerA.position = point
        layerA.bounds = CGRect(x: 0, y: 0, width: 30, height: 30)
        layerA.backgroundColor = HDDefineInfo().baseBlueColor.cgColor
        self.layer.addSublayer(layerA)
        return layerA
    }
    
    //动画节奏效果
    func animationTimeTimingFunction(_ point:CGPoint,_ funtionType:String) -> CABasicAnimation {
        let baseAnimation = CABasicAnimation(keyPath: "position")
        baseAnimation.toValue = NSValue(cgPoint: point)
        baseAnimation.duration = 3
        //        baseAnimation.speed = 1.5
        //节奏类型选择
        baseAnimation.timingFunction = CAMediaTimingFunction(name: funtionType)
        baseAnimation.repeatCount = Float(NSIntegerMax)
        return baseAnimation
    }
    
}
