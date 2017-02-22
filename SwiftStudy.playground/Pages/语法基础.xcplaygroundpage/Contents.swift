//: [Previous](@previous)

import Foundation
import UIKit

print("----- 标识符与关键字 -----")
//标识符就是给变量、常量、方法、函数、枚举、结构体、类、协议等指定的名
//与OC一样，区分大小写，可以由字母、数字、下划线甚至中文字符组成，其中首位不能为数字。
//根据代码规范，不建议在标识符中采用中文，采取驼峰命名的方式，类名的首字母采用大写字母开头，常量、变量与方法的首字母采用小写字母开头
//
//关键字释义：关键字是对编译器有特殊意义的保留标识符，具有特殊的意义，不能采用关键字作为标识符
//常见的关键字有：class、func、import、let、var、static、break、case，if，else，return，switch，self，Self等

print("----- 常量和变量 -----")
//swift中的重要概念之一，swift中一个类型声明时就应指明其为常量还是变量
//常量采用“let”进行声明，一旦赋值就无法改变内容，变量采用“var”进行声明，赋值后仍可更改
//考虑到程序安全性与性能，建议对无需改变的值，声明为常量，若一个值暂无法确定是否需要改变内容，建议也先声明为常量，后续需要变更内容时，可根据错误提示进行修改

//常量let 不可改变内容
let a = 10
//a = 15    error

//变量var 可以改变内容
var b = 20
b = 15
//一般首选let 在必须更改值的地方选择var


print("----- 运算符 -----")
//释义：检查、改变合并值的特殊符号或短语
//常用运算符：swift中大部分运算符与OC相同，比如 赋值运算符：=，求和：+，求差：-，乘法：*，求商：/，取余：% 等等
//特殊运算符与用法：
//==  与 != 可用于字符串内容的比较，类似与OC中的isEqualToString，而非OC中的==的指针比较
//===   !==   判断两个比较对象是否是一个对象的同一个实例
//??   swift中特有的三目运算符，可以快速便捷地通过判断值是否为空进入不同的赋值分支
class ClassA {}
let class1 = ClassA()
let class2 = ClassA()

if class1 === class2 {
    print("equal 实例")
}else{
    print("unequal 实例")
}

let emptyStr: String? = nil
let str = emptyStr ?? "is nil"
//...  与  ..<	区间运算符，如a...b与a..<b分别表示 a到b的所有值且包含b、a到b的所有值但不包含b，常用于for循环
for i in 0...10 {
    print(i)
}

