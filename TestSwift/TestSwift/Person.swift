//
//  Person.swift
//  TestSwift
//
//  Created by ysj on 2016/12/8.
//  Copyright © 2016年 ysj. All rights reserved.
//

import Foundation

class Person: NSObject {
    let name: String
    let age: Int
    
    //指定构造函数
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        
        print("name: \(name)  age: \(age)")
    }
}
