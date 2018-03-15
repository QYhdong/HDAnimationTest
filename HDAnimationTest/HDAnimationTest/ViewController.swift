//
//  ViewController.swift
//  HDAnimationTest
//
//  Created by HJddd on 2018/3/14.
//  Copyright © 2018年 HJddd. All rights reserved.
//


//贝塞尔曲线============================
/*
 + (instancetype)bezierPath;   //初始化贝塞尔曲线(无形状)
 + (instancetype)bezierPathWithRect:(CGRect)rect;  //绘制矩形贝塞尔曲线
 + (instancetype)bezierPathWithOvalInRect:(CGRect)rect;  //绘制椭圆（圆形）曲线
 + (instancetype)bezierPathWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius; // 绘制含有圆角的贝塞尔曲线
 + (instancetype)bezierPathWithRoundedRect:(CGRect)rect byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii;  //绘制可选择圆角方位的贝塞尔曲线
 + (instancetype)bezierPathWithArcCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise;   //绘制圆弧曲线
 + (instancetype)bezierPathWithCGPath:(CGPathRef)CGPath; //根据CGPathRef绘制贝塞尔曲线
 
 - (void)moveToPoint:(CGPoint)point;  //贝塞尔曲线开始的点
 - (void)addLineToPoint:(CGPoint)point;  //添加直线到该点
 - (void)addCurveToPoint:(CGPoint)endPoint controlPoint1:(CGPoint)controlPoint1 controlPoint2:(CGPoint)controlPoint2;  //添加二次曲线到该点
 - (void)addQuadCurveToPoint:(CGPoint)endPoint controlPoint:(CGPoint)controlPoint; //添加曲线到该点
 - (void)addArcWithCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise NS_AVAILABLE_IOS(4_0);  //添加圆弧 注:上一个点会以直线的形式连接到圆弧的起点
 - (void)closePath;  //闭合曲线
 
 - (void)removeAllPoints; //去掉所有曲线点

 @property(nonatomic) CGFloat lineWidth;  //边框宽度
 @property(nonatomic) CGLineCap lineCapStyle;  //端点类型
 @property(nonatomic) CGLineJoin lineJoinStyle;  //线条连接类型
 @property(nonatomic) CGFloat miterLimit;  //线条最大宽度最大限制
 - (void)setLineDash:(nullable const CGFloat *)pattern count:(NSInteger)count phase:(CGFloat)phase;  //虚线类型
 - (void)fill;  //填充贝塞尔曲线内部
 - (void)stroke; //绘制贝塞尔曲线边框
 
 */

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let myView = HDView(frame: self.view.bounds)
        view.addSubview(myView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

