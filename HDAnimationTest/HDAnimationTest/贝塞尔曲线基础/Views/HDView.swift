//
//  HDView.swift
//  HDAnimationTest
//
//  Created by HJddd on 2018/3/14.
//  Copyright © 2018年 HJddd. All rights reserved.
//

import UIKit

class HDView: UIView {

    
    //贝塞尔曲线============================
    /*
     + (instancetype)bezierPath;   //初始化贝塞尔曲线(无形状)
     + (instancetype)bezierPathWithRect:(CGRect)rect;  //绘制矩形贝塞尔曲线
     + (instancetype)bezierPathWithOvalInRect:(CGRect)rect;  //绘制椭圆曲线
     + (instancetype)bezierPathWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius; // 绘制含有圆角的贝塞尔曲线
     + (instancetype)bezierPathWithRoundedRect:(CGRect)rect byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii;  //绘制可选择圆角方位的贝塞尔曲线
     + (instancetype)bezierPathWithArcCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise;   //绘制圆弧曲线
     + (instancetype)bezierPathWithCGPath:(CGPathRef)CGPath; //根据CGPathRef绘制贝塞尔曲线
     
     - (void)moveToPoint:(CGPoint)point;  //贝塞尔曲线开始的点
     - (void)addLineToPoint:(CGPoint)point;  //添加直线到该点
     - (void)addCurveToPoint:(CGPoint)endPoint controlPoint1:(CGPoint)controlPoint1 controlPoint2:(CGPoint)controlPoint2;  //添加二次曲线到该点
     - (void)addQuadCurveToPoint:(CGPoint)endPoint controlPoint:(CGPoint)controlPoint; //添加曲线到该点
     - (void)addArcWithCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise NS_AVAILABLE_IOS(4_0);  //添加圆弧线段  上一个点会以直线的形式连接到圆弧的起点
     - (void)closePath;  //闭合曲线
     
     - (void)removeAllPoints; //去掉所有曲线点
     
     //属性
     @property(nonatomic) CGFloat lineWidth;  //边框宽度
     @property(nonatomic) CGLineCap lineCapStyle;  //端点类型
     @property(nonatomic) CGLineJoin lineJoinStyle;  //线条连接类型
     @property(nonatomic) CGFloat miterLimit;  //线条最大宽度限制
     - (void)setLineDash:(nullable const CGFloat *)pattern count:(NSInteger)count phase:(CGFloat)phase;  //虚线类型
     - (void)fill;  //贝塞尔曲线内部填充
     - (void)stroke; //绘制贝塞尔曲线边框
     
     */

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        //五角星⭐️
    
        //矩形贝塞尔曲线
        let bezierPath_rec = UIBezierPath(rect: CGRect(x: 130, y: 150, width: 100, height: 100))
        bezierPath_rec.move(to: CGPoint(x: 130, y: 150))
        bezierPath_rec.addLine(to: CGPoint(x: 163, y: 183))
        bezierPath_rec.addLine(to: CGPoint(x: 178, y:150 ))
        bezierPath_rec.addLine(to: CGPoint(x: 196, y: 183))
        bezierPath_rec.addLine(to: CGPoint(x: 229, y: 183))
        bezierPath_rec.addLine(to: CGPoint(x: 196, y: 216))
   
        bezierPath_rec.lineCapStyle = .butt   //端点类型
        bezierPath_rec.lineJoinStyle = .miter //线条连接类型
        bezierPath_rec.miterLimit = 1
        bezierPath_rec.lineWidth = 3
        
        //圆弧贝塞尔曲线
        let bezierPath_arc = UIBezierPath(arcCenter: CGPoint(x: 0, y: 400), radius: 50, startAngle: CGFloat(0), endAngle: CGFloat(Double.pi/3), clockwise: true)
        bezierPath_arc.lineWidth = 3
        
        //添加多次贝塞尔曲线
        let bezierPathMy = UIBezierPath()
        bezierPathMy.lineWidth = 3
        bezierPathMy.move(to: CGPoint(x: 10, y: 520))
        bezierPathMy.addLine(to: CGPoint(x: 50, y: 530))
        bezierPathMy.addQuadCurve(to: CGPoint(x: 100, y:510), controlPoint: CGPoint(x: 80, y: 650))
        bezierPathMy.addCurve(to: CGPoint(x: 200, y:530), controlPoint1: CGPoint(x: 130, y:600), controlPoint2: CGPoint(x: 170, y:400))
        bezierPathMy.addArc(withCenter: CGPoint(x: 300, y:400), radius: 50, startAngle: 0, endAngle: CGFloat(Double.pi*2), clockwise: true)
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
