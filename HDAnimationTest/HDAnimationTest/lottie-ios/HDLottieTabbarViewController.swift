//
//  HDLottieTabbarViewController.swift
//  HDAnimationTest
//
//  Created by HJddd on 2018/5/2.
//  Copyright © 2018年 HJddd. All rights reserved.
//

import UIKit

class HDLottieTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        let  vc = HDToViewController()
        vc.tabBarItem.image = UIImage(named: "firstblood")
        addChildViewController(vc)
     
        tabBar.tintColor = UIColor.black
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true) {

        }
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
