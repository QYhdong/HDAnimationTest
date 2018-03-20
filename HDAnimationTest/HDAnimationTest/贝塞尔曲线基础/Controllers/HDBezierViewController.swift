//
//  HDBezierViewController.swift
//  HDAnimationTest
//
//  Created by HJddd on 2018/3/20.
//  Copyright © 2018年 HJddd. All rights reserved.
//

import UIKit

class HDBezierViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //贝塞尔曲线
        let myView = HDView(frame: self.view.bounds)
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
