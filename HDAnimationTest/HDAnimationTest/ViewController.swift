//
//  ViewController.swift
//  HDAnimationTest
//
//  Created by HJddd on 2018/3/14.
//  Copyright © 2018年 HJddd. All rights reserved.
//


import UIKit

class ViewController: UIViewController {

    fileprivate var typeArr:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
    }

    fileprivate func  setUpUI()  {
        
        typeArr = ["CoreAnimation练习","贝塞尔曲线","雷达波纹","音量效果","转场效果","文字效果"]
        
        self.title = "HDAnimationTest"
        
        view.addSubview(mainTableView)
    }
    
    fileprivate lazy var mainTableView:UITableView = {
        let mainT = UITableView(frame: view.bounds, style: UITableViewStyle.plain)
        mainT.delegate = self
        mainT.dataSource = self
        mainT.register(popTableViewCell.self, forCellReuseIdentifier: "popTableViewCell")
        return mainT
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typeArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "popTableViewCell", for: indexPath) as! popTableViewCell
        cell.selectionStyle = .none
        cell.textLabel?.text = typeArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:     //核心动画
            self.navigationController?.pushViewController(HDCoreAnimationViewController(), animated: true)
        case 1:     //贝塞尔曲线
            self.navigationController?.pushViewController(HDBezierViewController(), animated: true)
        case 2:     //雷达
            self.navigationController?.pushViewController(HDRadarViewController(), animated: true)
        case 3:     //音量
            self.navigationController?.pushViewController(HDMusicViewController(), animated: true)
        case 4:     //转场效果
            self.navigationController?.pushViewController(HDTransitionAnimationController(), animated: true)
        case 5:     //文字效果
            self.navigationController?.pushViewController(HDUnlockViewController(), animated: true)
            
        default:
            return
        }
    }
    
}

class popTableViewCell:UITableViewCell{
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
