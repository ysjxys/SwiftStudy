//: [Previous](@previous)

import Foundation

/*
    1.没有（）
    2.必须有{}
    3.不存在非零即真，只有true和false
*/
let num = 10

//if num {      error
//    print("xx")
//}

if num > 5{
    print("> 5")
}

var str1: String? = "Hello, playground"
var str2 = "Hello, playground"
//用于if内判断的必须为明确写明的可选类型
//if let a = str2 {     error
//    print("a is alive")
//}
if let a = str1 {
    print(a)
}
//多个if判断条件之间用“，”分割
let x: Int! = 1
if let y = x, let ss = str1 {
    print(ss+String(x))
}

//ss
var non: String
let s1 = str1 ?? "no str"
let s2 = non ?? "no str"










