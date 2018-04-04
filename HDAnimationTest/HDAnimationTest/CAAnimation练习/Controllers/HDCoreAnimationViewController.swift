
//
//  HDCoreAnimationViewController.swift
//  HDAnimationTest
//
//  Created by HJddd on 2018/3/27.
//  Copyright © 2018年 HJddd. All rights reserved.
//

import UIKit

class HDCoreAnimationViewController: UIViewController {
//
//    /* The begin time of the object, in relation to its parent object, if
//     * applicable. Defaults to 0. */
//    //对象的开始时间，相对于其父对象
//    public var beginTime: CFTimeInterval { get set }
//
//
//    /* The basic duration of the object. Defaults to 0. */
//    //对象的基本持续时间
//    public var duration: CFTimeInterval { get set }
//
//
//    /* The rate of the layer. Used to scale parent time to local time, e.g.
//     * if rate is 2, local time progresses twice as fast as parent time.
//     * Defaults to 1. */
//    //速度 默认为1
//    public var speed: Float { get set }
//
//
//    /* Additional offset in active local time. i.e. to convert from parent
//     * time tp to active local time t: t = (tp - begin) * speed + offset.
//     * One use of this is to "pause" a layer by setting `speed' to zero and
//     * `offset' to a suitable value. Defaults to 0. */
//    //让动画快进到某一点,例如时长2,timeOffset设为1,将从一半的地方开始
//    public var timeOffset: CFTimeInterval { get set }
//
//
//    /* The repeat count of the object. May be fractional. Defaults to 0. */
//    //对象重复次数
//    public var repeatCount: Float { get set }
//
//
//    /* The repeat duration of the object. Defaults to 0. */
//    //对象的重复持续时间
//    public var repeatDuration: CFTimeInterval { get set }
//
//
//    /* When true, the object plays backwards after playing forwards. Defaults
//     * to NO. */
//    //自动反向执行
//    public var autoreverses: Bool { get set }
//
//
//    /* Defines how the timed object behaves outside its active duration.
//     * Local time may be clamped to either end of the active duration, or
//     * the element may be removed from the presentation. The legal values
//     * are `backwards', `forwards', `both' and `removed'. Defaults to
//     * `removed'. */
//    //
//    public var fillMode: String { get set }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = UIColor.white
        let myView = HDCoreAnimationView(frame: self.view.bounds)
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


