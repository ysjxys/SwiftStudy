//
//  Student.swift
//  TestSwift
//
//  Created by ysj on 2016/12/8.
//  Copyright © 2016年 ysj. All rights reserved.
//

import Foundation

class Student: Person {
    
    var number: Int?
    
    
    //便利构造函数
//  只有便利构造函数中可以调用 self.init()
//  便利构造函数不能被重写或者 super
//  指定构造函数必须调用其直接父类的的指定构造函数（除非没有父类）
//  便利构造函数必须调用同一类中定义的其他指定构造函数或者用 self. 的方式调用父类的便利构造函数
//  便利构造函数可以返回 nil、
    
    override init(name: String, age: Int) {
        print("override init(name: String, age: Int)")
        super.init(name: name, age: age)
    }
    
    convenience init?(name: String, age: Int, number: Int){
        if number < 0 {
            return nil
        }
        self.init(name: name, age: age)
        self.number = number
        print("convenience init?(name: String, age: Int, number: Int)")
    }
}
