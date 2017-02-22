//: [Previous](@previous)

import Foundation
import UIKit

var str = "Hello, playground"

//常量let 不可改变内容
let a = 10
//a = 15    error

//变量var 可以改变内容
var b = 20
b = 15
//一般首选let 在必须更改值的地方选择var

//swift 对类型敏感，不同类型的值不能隐式转换相加
let c = a + b

//原 b类型为整型，不可以隐式转换为浮点类型
//b = 1.5   error
//根据右侧数值自动推导为浮点型
let d = 1.5

//整型变浮点类型，或者浮点类型变整型才可以进行计算
let e1 = Double(a) + d
let e2 = a + Int(d)

//类型指定 指定类型为double,可正常计算
let i1: Double = 10
let i2 = 1.5
let i3 = i1 + i2

let m1: CGFloat = 10.1
let m2 = 1.1
//let m3 = m1 + m2 error
let m3 = m1 + CGFloat(m2)

let qimeila: (String, Int) = (desc:"haha", num:123)

print(qimeila.1)

