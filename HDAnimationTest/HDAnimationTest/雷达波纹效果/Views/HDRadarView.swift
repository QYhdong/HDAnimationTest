//
//  HDRadarView.swift
//  HDAnimationTest
//
//  Created by HJddd on 2018/3/20.
//  Copyright © 2018年 HJddd. All rights reserved.
//

import UIKit

class HDRadarView: UIView {

    private let circleWidthHeight:CGFloat = 40
    //定时器
    private var radarTimer:Timer?
    private var waveTimer:Timer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCircleView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //创建中心圆
    private func setupCircleView(){
        circleView.center = CGPoint(x: frame.width/2, y: frame.height/2)
        addSubview(circleView)
        
        //添加定时器
        radarTimer = Timer.init(timeInterval: 0.5, target: self, selector: #selector(createRadarAnimation), userInfo: nil, repeats: true)
        RunLoop.current.add(radarTimer!, forMode: .commonModes)
        
        
    }
    
    deinit {
        if radarTimer != nil{
            if (radarTimer?.isValid)!{
                radarTimer?.invalidate()
            }
            radarTimer = nil
        }
        print("析构函数.............")
    }
    //MARK:创建动画
    @objc private func createRadarAnimation(){
        
        //CAShapeLayer
        let shapeLayer = CAShapeLayer()
        shapeLayer.position = CGPoint(x: 0, y: 0)
        //设置锚点
        shapeLayer.anchorPoint = CGPoint(x: 0, y: 0)
        shapeLayer.bounds = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        
        //bezier贝塞尔
        let bezierPath_w = UIBezierPath(ovalIn: CGRect(x: circleView.frame.minX, y: circleView.frame.minY, width: circleWidthHeight, height: circleWidthHeight))
        shapeLayer.path = bezierPath_w.cgPath
        shapeLayer.strokeColor = UIColor.init(red: 106/255, green: 200/255, blue: 250/255, alpha: 1).cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 2
        layer.insertSublayer(shapeLayer, below: circleView.layer)
//        layer.insertSublayer(shapeLayer, above: circleView.layer)
//        layer.insertSublayer(shapeLayer, at: 0)
        
        //起始路径
        let beginPath = UIBezierPath(ovalIn: CGRect(x: circleView.frame.minX, y: circleView.frame.minY, width: circleWidthHeight, height: circleWidthHeight))
        //结束路径
        let endPath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        
        //初始设置为结束状态归零
        shapeLayer.path = endPath.cgPath
        shapeLayer.opacity = 0
        
        //创建动画
        let animation = CABasicAnimation(keyPath: "path")
        animation.fromValue = beginPath.cgPath
        animation.toValue = endPath.cgPath
        animation.duration = 2.0
        
        //透明度动画,伴随消失为0
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 0.6
        opacityAnimation.toValue = 0
        opacityAnimation.duration = 2.0
        shapeLayer.add(opacityAnimation, forKey: "")
        shapeLayer.add(animation, forKey: "")
//        perform(#selector(), with: shapeLayer, afterDelay: 2.0)
        
    }
    
    //中心圆
    private lazy var circleView:UIView = {
        let circleV = UIView(frame: CGRect(x: 0, y: 0, width: circleWidthHeight, height: circleWidthHeight))
        circleV.layer.cornerRadius = CGFloat(circleWidthHeight/2)
        circleV.layer.masksToBounds = true
        circleV.backgroundColor = UIColor.init(red: 106/255, green: 200/255, blue: 250/255, alpha: 1)
        return circleV
    }()

    
}
