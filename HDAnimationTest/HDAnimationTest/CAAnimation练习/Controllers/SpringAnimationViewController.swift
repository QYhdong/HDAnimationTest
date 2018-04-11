//
//  SpringAnimationViewController.swift
//  HDAnimationTest
//
//  Created by HJddd on 2018/4/11.
//  Copyright © 2018年 HJddd. All rights reserved.
//

import UIKit

class SpringAnimationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = UIColor.white
        let myView = HDCoreAnimationView(frame: self.view.bounds)
        myView.animationTypes = .spring
        view.addSubview(myView)
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
