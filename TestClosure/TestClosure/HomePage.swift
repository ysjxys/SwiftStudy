//
//  HomePage.swift
//  TestClosure
//
//  Created by ysj on 2016/12/15.
//  Copyright © 2016年 ysj. All rights reserved.
//

import Foundation
import UIKit

class HomePage: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.purple
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "PUSH", style: UIBarButtonItemStyle.plain, target: self, action: #selector(pushvc))
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "set nil", style: UIBarButtonItemStyle.plain, target: self, action: #selector(setToNil))
    }
    
    func setToNil() {
        var vc: ViewController! = ViewController()
        vc.msg = "xx"
        vc.viewDidLoad()
        vc = nil
    }
    
    func pushvc() {
        let vc: ViewController = ViewController()
        vc.msg = "xx"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
