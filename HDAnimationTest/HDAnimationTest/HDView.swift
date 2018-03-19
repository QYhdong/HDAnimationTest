//
//  HDView.swift
//  HDAnimationTest
//
//  Created by HJddd on 2018/3/14.
//  Copyright © 2018年 HJddd. All rights reserved.
//

import UIKit

class HDView: UIView {


    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        //五角星⭐️
        let centerX = rect.size.width/2
        let centerY = rect.size.height/2
        
        
        //矩形贝塞尔曲线
        let bezierPath_rec = UIBezierPath(rect: CGRect(x: 30, y: 50, width: 100, height: 100))
        bezierPath_rec.move(to: CGPoint(x: 30, y: 50))
        bezierPath_rec.addLine(to: CGPoint(x: 63, y: 83))
        bezierPath_rec.addLine(to: CGPoint(x: 78, y:50 ))
        bezierPath_rec.addLine(to: CGPoint(x: 96, y: 83))
        bezierPath_rec.addLine(to: CGPoint(x: 129, y: 83))
        bezierPath_rec.addLine(to: CGPoint(x: 96, y: 116))
   
        bezierPath_rec.lineCapStyle = .butt   //端点类型
        bezierPath_rec.lineJoinStyle = .miter //线条连接类型
        bezierPath_rec.miterLimit = 1
        bezierPath_rec.lineWidth = 3
        
        //圆弧贝塞尔曲线
        let bezierPath_arc = UIBezierPath(arcCenter: CGPoint(x: 0, y: 400), radius: 50, startAngle: CGFloat(0), endAngle: CGFloat(M_PI/3), clockwise: true)
        bezierPath_arc.lineWidth = 3
        
        //添加多次贝塞尔曲线
        let bezierPathMy = UIBezierPath()
        bezierPathMy.lineWidth = 3
        bezierPathMy.move(to: CGPoint(x: 10, y: 520))
        bezierPathMy.addLine(to: CGPoint(x: 50, y: 530))
        bezierPathMy.addQuadCurve(to: CGPoint(x: 100, y:510), controlPoint: CGPoint(x: 80, y: 650))
        bezierPathMy.addCurve(to: CGPoint(x: 200, y:530), controlPoint1: CGPoint(x: 130, y:600), controlPoint2: CGPoint(x: 170, y:400))
        bezierPathMy.addArc(withCenter: CGPoint(x: 300, y:400), radius: 50, startAngle: 0, endAngle: CGFloat(M_PI*2), clockwise: true)
        bezierPathMy.move(to: CGPoint(x: 20, y:520))
        bezierPathMy.addLine(to: CGPoint(x: 40, y:520))

        UIColor.gray.set()
        bezierPath_rec.fill()
        
        UIColor.black.set()
        bezierPath_rec.stroke()
        
        let aniLayer = CALayer()
        aniLayer.backgroundColor = UIColor.red.cgColor
        aniLayer.position = CGPoint(x: 30, y: 50)
        aniLayer.bounds = CGRect(x: 0, y: 0, width: 8, height: 8)
        aniLayer.cornerRadius = 4
        self.layer.addSublayer(aniLayer)
        
        let keyFrameAnima = CAKeyframeAnimation(keyPath: "position")
        keyFrameAnima.repeatCount = Float(NSIntegerMax)
        keyFrameAnima.path = bezierPath_rec.cgPath
        keyFrameAnima.duration = 15
        keyFrameAnima.beginTime = CACurrentMediaTime() + 1
        aniLayer.add(keyFrameAnima, forKey: "keyFrameAnimation")
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
