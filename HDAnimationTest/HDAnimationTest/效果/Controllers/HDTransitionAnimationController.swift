//
//  HDTransitionAnimationController.swift
//  HDAnimationTest
//
//  Created by HJddd on 2018/4/18.
//  Copyright © 2018年 HJddd. All rights reserved.
//

import UIKit

class HDTransitionAnimationController: UIViewController {

    fileprivate var typeArr:[String]!
    
    fileprivate var nextVc:HDTransitionNextViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
    }
    
    fileprivate func  setUpUI()  {
        
        typeArr = ["滑动","渐变","自定义"]
        nextVc = HDTransitionNextViewController()
        nextVc.transitioningDelegate = self
        view.addSubview(mainTableView)
    }
    
    fileprivate lazy var mainTableView:UITableView = {
        let mainT = UITableView(frame: view.bounds, style: UITableViewStyle.plain)
        mainT.delegate = self
        mainT.dataSource = self
        mainT.register(TransitionAnimationTableViewCell.self, forCellReuseIdentifier: "TransitionAnimationTableViewCell")
        return mainT
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension HDTransitionAnimationController:UITableViewDelegate,UITableViewDataSource,UIViewControllerTransitioningDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typeArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransitionAnimationTableViewCell", for: indexPath) as! TransitionAnimationTableViewCell
        cell.selectionStyle = .none
        cell.textLabel?.text = typeArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //设置代理
        self.present(nextVc, animated: true, completion: nil)
//        self.navigationController?.pushViewController(nextVc, animated: true)
        print("111111")
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideSpringAnimation()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideDismissAnimation()
    }
    
}

//cell
class TransitionAnimationTableViewCell:UITableViewCell{
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class SlideSpringAnimation:NSObject,UIViewControllerAnimatedTransitioning{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVc = transitionContext.viewController(forKey: .from)
        let toVc = transitionContext.viewController(forKey: .to)
        let containerView = transitionContext.containerView
        
        var fromView = fromVc?.view
        var toView = toVc?.view
        
        if transitionContext.responds(to: #selector(UIViewControllerTransitionCoordinatorContext.view(forKey:))){
            fromView = transitionContext.view(forKey: .from)
            toView = transitionContext.view(forKey: .to)
        }
        
        toView?.frame = CGRect(x: fromView!.frame.origin.x, y: fromView!.frame.maxY / 2, width: fromView!.frame.width, height: fromView!.frame.height)
        toView?.alpha = 0.6
        
        containerView.addSubview(toView!)
        let transitionDuration = self.transitionDuration(using: transitionContext)
        //spring
        UIView.animate(withDuration: transitionDuration, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveLinear, animations: {
            toView?.alpha = 1.0
            toView?.frame = transitionContext.finalFrame(for: toVc!)
            
        }) { (finished) in
            let isCancel = transitionContext.transitionWasCancelled
            transitionContext.completeTransition(!isCancel)
        }
    }
    
}

class SlideDismissAnimation:NSObject,UIViewControllerAnimatedTransitioning{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let isCancel = transitionContext.transitionWasCancelled
        transitionContext.completeTransition(!isCancel)
    }
    
    
    
}
