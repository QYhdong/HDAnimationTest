//
//  TransitionViewController.swift
//  HDAnimationTest
//
//  Created by HJddd on 2018/4/11.
//  Copyright © 2018年 HJddd. All rights reserved.
//

import UIKit

class TransitionViewController: UIViewController {

    fileprivate var showImageView:UIImageView!
    fileprivate var imageName:String!
    fileprivate var count:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        count = 0
        
        view.backgroundColor = UIColor.white
        imageName = "WechatIMG178"
        
        showImageView = UIImageView()
        showImageView.image = UIImage(named: imageName)
        showImageView.frame = CGRect(x: 0, y: 0, width: 200, height: 160)
        showImageView.center = view.center
        
        let btn = UIButton()
        btn.backgroundColor = HDDefineInfo().baseBlueColor
        btn.setTitle("转场动画", for: UIControlState())
        btn.setTitleColor(UIColor.black, for: UIControlState())
        btn.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        btn.center = CGPoint(x: view.center.x, y: view.center.y+150)
        btn.addTarget(self, action: #selector(transitionClick), for: .touchUpInside)
        
        view.addSubview(showImageView)
        view.addSubview(btn)
    }

    @objc fileprivate func transitionClick(){
        let transitionAnimatiion = CATransition()
        transitionAnimatiion.duration = 3
//        transitionAnimatiion.fillMode = kCAFillModeForwards
        /*
         常用的一些系统提供的类型
        @"cube" @"moveIn" @"reveal" @"fade"(默认) @"pageCurl" @"pageUnCurl" @"suckEffect" @"rippleEffect" @"oglFlip"
    */
        var typeName:String!
        switch count {
        case 0:
            typeName = "cube"
            break
        case 1:
            typeName = "moveIn"
            break
        case 2:
            typeName = "reveal"
            break
        case 3:
            typeName = "fade"
            break
        case 4:
            typeName = "pageCurl"
            break
        case 5:
            typeName = "pageUnCurl"
            break
        case 6:
            typeName = "suckEffect"
            break
        case 7:
            typeName = "rippleEffect"
            break
        case 8:
            typeName = "oglFlip"
            break
        default:
            return
        }
        count = count + 1
        if count == 9 {
            count = 0
        }
        transitionAnimatiion.type = typeName
        transitionAnimatiion.subtype = kCATransitionFromLeft
        
        self.showImageView.layer.add(transitionAnimatiion, forKey: "")
        
        if imageName == "WechatIMG178"{
            imageName = "WechatIMG181"
            }else{
            imageName = "WechatIMG178"
        }

        self.showImageView.image = UIImage(named: imageName)
    }

}
