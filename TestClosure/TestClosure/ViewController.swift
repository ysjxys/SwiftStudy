//
//  ViewController.swift
//  TestClosure
//
//  Created by ysj on 2016/12/15.
//  Copyright © 2016年 ysj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var closure: (() -> ())?
    var msg: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad")
        self.view.backgroundColor = UIColor.lightGray
        
        //按照惯例编码，闭包捕获了self实例，与后面run函数内self也捕获了闭包一起，构成循环引用
        run {
            print("run closure")
            self.view.backgroundColor = UIColor.lightGray
        }
        
        //适用于push等情况
        //若闭包与捕获的实例在这里总是同时销毁，采用 将闭包内的捕获定义为无主引用 的方式来避免循环引用
//        run { [unowned self] in
//            print("run closure")
//            self.view.backgroundColor = UIColor.lightGray
//        }
        
        //若闭包内被捕获的引用可能变为nil时，将闭包内的捕获定义为弱引用，弱引用总是可选类型
//        run {[weak self] in
//            print("run closure")
//            self?.view.backgroundColor = UIColor.lightGray
//        }
    }
    
    
    func run(clo: @escaping () -> ()) {
        print("run funcation")
//因为要给全局的闭包变量 closure 赋值，self引用了闭包
        self.closure = clo
        clo()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    deinit {
        print("ClosureClass is deinit")
    }

}

