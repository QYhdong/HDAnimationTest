
//
//  HDTransitionFirstViewController.swift
//  HDAnimationTest
//
//  Created by HJddd on 2018/4/20.
//  Copyright © 2018年 HJddd. All rights reserved.
//

import UIKit
import SnapKit

class HDTransitionFirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        let button = UIButton()
        button.setTitle("转场动画效果", for: UIControlState.normal)
        button.setTitleColor(UIColor.black, for: UIControlState.normal)
        button.addTarget(self, action: #selector(transitionAnimation), for: UIControlEvents.touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints { (maker) in
            maker.top.equalTo(view).offset(100)
            maker.centerX.equalTo(view)
            maker.height.equalTo(50)
            maker.width.equalTo(120)
        }
        
    }

    //按钮点击事件
    @objc fileprivate func transitionAnimation(){
        let nextVc = HDTransitionNextViewController()
        nextVc.transitioningDelegate = self
        //设置代理
        self.present(nextVc, animated: true, completion: nil)
        //        self.navigationController?.pushViewController(nextVc, animated: true)
        print("111111")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension HDTransitionFirstViewController:UIViewControllerTransitioningDelegate{
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        // 返回UIViewControllerAnimatedTransitioning协议的对象,提供动画时间以及动画逻辑
        return SlideSpringAnimation()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideDismissAnimation()
    }
    
}

//UIViewControllerAnimatedTransitioning代理的对象
class SlideSpringAnimation:NSObject,UIViewControllerAnimatedTransitioning{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
     
        //one
        easeInEaseOut(transitionContext: transitionContext)
        
        //two
    }
    
    //效果一
    func easeInEaseOut(transitionContext:UIViewControllerContextTransitioning) {
        //present的时候当前控制器为fromVc
        let fromVc = transitionContext.viewController(forKey: .from)
        //toVc为将要显示的控制器nextVc
        let toVc = transitionContext.viewController(forKey: .to)
        //试图容器
        let containerView = transitionContext.containerView
        //视图
        var fromView = fromVc?.view
        var toView = toVc?.view
        
        if transitionContext.responds(to: #selector(UIViewControllerTransitionCoordinatorContext.view(forKey:))){
            fromView = transitionContext.view(forKey: .from)
            toView = transitionContext.view(forKey: .to)
        }
        
        toView?.frame = CGRect(x: fromView!.frame.origin.x, y: fromView!.frame.maxY / 2, width: fromView!.frame.width, height: fromView!.frame.height)
        toView?.alpha = 0.6
        //toView必须添加
        containerView.addSubview(toView!)
        let transitionDuration = self.transitionDuration(using: transitionContext)
        //spring
        UIView.animate(withDuration: transitionDuration, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveLinear, animations: {
            toView?.alpha = 1.0
            toView?.frame = transitionContext.finalFrame(for: toVc!)
            
        }) { (finished) in
            let isCancel = transitionContext.transitionWasCancelled
            transitionContext.completeTransition(!isCancel)
            if isCancel {
                toView?.removeFromSuperview()
            }
        }
    }
    //效果二:
    func curlPop(transitionContext:UIViewControllerContextTransitioning) {
        //present的时候当前控制器为fromVc
        let fromVc = transitionContext.viewController(forKey: .from)
        //toVc为将要显示的控制器nextVc
        let toVc = transitionContext.viewController(forKey: .to)
        //试图容器
        let containerView = transitionContext.containerView
        //视图
        var fromView = fromVc?.view
        var toView = toVc?.view
        
        if transitionContext.responds(to: #selector(UIViewControllerTransitionCoordinatorContext.view(forKey:))){
            fromView = transitionContext.view(forKey: .from)
            toView = transitionContext.view(forKey: .to)
        }
        
        toView?.frame = CGRect(x: fromView!.frame.origin.x, y: fromView!.frame.maxY / 2, width: fromView!.frame.width, height: fromView!.frame.height)
        toView?.alpha = 0.6
        //toView必须添加
        containerView.addSubview(toView!)
        let transitionDuration = self.transitionDuration(using: transitionContext)
        //spring
        UIView.animate(withDuration: transitionDuration, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveLinear, animations: {
            toView?.alpha = 1.0
            toView?.frame = transitionContext.finalFrame(for: toVc!)
            
        }) { (finished) in
            let isCancel = transitionContext.transitionWasCancelled
            transitionContext.completeTransition(!isCancel)
            if isCancel {
                toView?.removeFromSuperview()
            }
        }
    }
    
}

//dismiss
class SlideDismissAnimation:NSObject,UIViewControllerAnimatedTransitioning{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        //one
        dismissOne(transitionContext: transitionContext)
    }
    
    //效果一
    func dismissOne(transitionContext: UIViewControllerContextTransitioning)  {
        let fromVc = transitionContext.viewController(forKey: .from)
        let toVc = transitionContext.viewController(forKey: .to)
        let containerView = transitionContext.containerView
        
        var fromView = fromVc?.view
        var toView = toVc?.view
        
        if transitionContext.responds(to: #selector(UIViewControllerTransitionCoordinatorContext.view(forKey:))){
            fromView = transitionContext.view(forKey: .from)
            toView = transitionContext.view(forKey: .to)
        }
        
        fromView?.frame = transitionContext.finalFrame(for: fromVc!)
        toView?.frame = transitionContext.finalFrame(for: toVc!)
        
        fromView?.alpha = 1
        toView?.alpha = 0
        
        containerView.addSubview(toView!)
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
            fromView?.alpha = 0
            toView?.alpha = 1
        }) { (finished) in
            let isCancel = transitionContext.transitionWasCancelled
            transitionContext.completeTransition(!isCancel)
        }
        
    }
    
}

