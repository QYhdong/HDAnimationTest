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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
    }
    
    fileprivate func  setUpUI()  {
        
        typeArr = ["滑动","渐变","自定义"]

        
        view.addSubview(mainTableView)
//        let buttoo = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
//        buttoo.addTarget(self, action: #selector(aaa), for: UIControlEvents.touchUpInside)
//        buttoo.backgroundColor = UIColor.red
//        view.addSubview(buttoo)
        
        view.backgroundColor = UIColor.white
    }
    
    @objc fileprivate func aaa(){
//        //设置代理
//        self.present(nextVc, animated: true, completion: nil)
//        //        self.navigationController?.pushViewController(nextVc, animated: true)
//        print("111111")
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
        self.navigationController?.pushViewController(HDTransitionFirstViewController(), animated: true)
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

