//
//  BaseAnimationViewController.swift
//  HDAnimationTest
//
//  Created by HJddd on 2018/4/11.
//  Copyright © 2018年 HJddd. All rights reserved.
//

import UIKit

class BaseAnimationViewController: UIViewController {

    //动画类型
    var type:animationType?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    //加载view
        func setupUI() {
            view.backgroundColor = UIColor.white
            let myView = HDCoreAnimationView(frame: self.view.bounds)
            myView.animationTypes = type
            view.addSubview(myView)
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
