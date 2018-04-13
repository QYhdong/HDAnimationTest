
//
//  HDCoreAnimationViewController.swift
//  HDAnimationTest
//
//  Created by HJddd on 2018/3/27.
//  Copyright © 2018年 HJddd. All rights reserved.
//

import UIKit

enum animationType {
    case base
    case keyFrame
    case spring
    case group
}

class HDCoreAnimationViewController: UIViewController {
    
    fileprivate var typeArr:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpUI()
    }
    
  
fileprivate func  setUpUI()  {
    
    typeArr = ["BaseAnimation","KeyFrameAnimation","SpringAnimation","GroupAnimation","TransitionViewController"]
    
    view.addSubview(mainTableView)
}

fileprivate lazy var mainTableView:UITableView = {
    let mainT = UITableView(frame: view.bounds, style: UITableViewStyle.plain)
    mainT.delegate = self
    mainT.dataSource = self
    mainT.register(animationTableViewCell.self, forCellReuseIdentifier: "animationTableViewCell")
    return mainT
}()


}

extension HDCoreAnimationViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typeArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "animationTableViewCell", for: indexPath) as! animationTableViewCell
        cell.selectionStyle = .none
        cell.textLabel?.text = typeArr[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 4{
            self.navigationController?.pushViewController(TransitionViewController(), animated: true)
            return
        }
        
        let animationVc = BaseAnimationViewController()
        switch indexPath.row {
        case 0:
            animationVc.type = .base
            break
        case 1:
            animationVc.type = .keyFrame
            break
        case 2:
            animationVc.type = .spring
            break
        case 3:
            animationVc.type = .group
            break
        default:
            return
        }
        self.navigationController?.pushViewController(animationVc, animated: true)
    }
    
}

class animationTableViewCell:UITableViewCell{
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


