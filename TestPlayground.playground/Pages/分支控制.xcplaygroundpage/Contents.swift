//: [Previous](@previous)

import Foundation

//    1.没有（）
//    2.必须有{}
//    3.不存在非零即真，只有true和false
let num = 10

//if num {      error
//    print("xx")
//}

if num > 5{
    print("> 5")
}

var str1: String? = "Hello, playground"
var str2 = "Hello, playground"
if (str1 != nil) || (str2 == ""){
    print("xxx")
}
//用于if内判断的必须为明确写明的  可选类型
//if let a = str2 {             error
//    print("a is alive")
//}
if let a = str1 {
    print(a)
}

var str3 :String? = nil
if let a = str3 , str1 != nil{
    print("xxx")
}

//多个if判断条件之间用“，”分割 &&
//if let 判断并且赋值 确保let后的一定有值 才会进入分支
let x: Int! = 1
if let y = x, let ss = str1, x == 1 || str3 != nil {
    print(ss+String(x))
}

func test(){
    let compare = 0
    guard compare > 1 else {
        print("in guard")
        return
    }
}
test()

//三目
let a1 = 80
let a2 = 20
let a3 = a2 > a1 ? 100 : -100

//??   若??前的值不为nil 将??前的值赋予，否则将??后的值赋予
var non: String? = nil
let s1 = str1 ?? "no str"
let s2 = non ?? "no str"

print(s1+" hehe \(a1) "+s2)

//??常见应用场景 返回list数量
var dataList: [String]?
//dataList = ["hehe","hehe2"]
//dataList? 是一个整体，?表示dataList可能为空 若为空 .count返回为nil
let listCount = dataList?.count ?? 1








