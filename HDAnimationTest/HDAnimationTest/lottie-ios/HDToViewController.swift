//
//  HDToViewController.swift
//  HDAnimationTest
//
//  Created by HJddd on 2018/5/2.
//  Copyright © 2018年 HJddd. All rights reserved.
//

import UIKit

class HDToViewController: UIViewController {

    var imagBtn:LOTAnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        self.title = "测试lottie"

        imagBtn = LOTAnimationView(name: "data1")
        imagBtn.center = view.center
        view.addSubview(imagBtn)
    
        print("啦啦啦\(imagBtn.isAnimationPlaying)")
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        imagBtn.play { (finished) in
            
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
