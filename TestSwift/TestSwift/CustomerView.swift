//
//  CustomerView.swift
//  TestSwift
//
//  Created by ysj on 2016/12/7.
//  Copyright © 2016年 ysj. All rights reserved.
//

import UIKit


class CustomerView: UIView{
    var clickBlock: (() -> ())?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.lightGray
        
        let btn = UIButton(frame: CGRect(x: 30, y: 30, width: 50, height: 50))
        btn.backgroundColor = UIColor.purple
        self.addSubview(btn)
        btn.addTarget(self, action: #selector(btnClicked), for: UIControlEvents.touchUpInside)
    }
    
    func btnClicked() {
        if self.clickBlock != nil {
            self.clickBlock!()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
