//: Playground - noun: a place where people can play

import UIKit

print("----- 基本数据类型及其之间的转换 -----")
let a = 10
var b = 20
let c = 1.5
//is  类型检查
//print(c is Double)
//swift 对类型敏感，不同类型的值不能隐式转换相加
//let d1 = a + c //error
//相同类型才可以相加
let d2 = a + b

//根据等号右侧数值自动推导目标为浮点型，而原b类型为整型，不可以隐式转换为浮点类型
//b = 1.5   error

//整型变浮点类型，或者浮点类型变整型才可以进行计算
let e1 = Double(a) + c
let e2 = a + Int(d2)

//类型指定 指定类型为double,可正常计算
let i1: Double = 10
let i2 = 1.5
let i3 = i1 + i2

//类型转换为CGFloat，才可进行计算
let m1: CGFloat = 10.1
let m2 = 1.1
//let m3 = m1 + m2 error
let m3 = m1 + CGFloat(m2)

print("----- 元组类型 -----")
//数据类型里的“奇美拉”，可以将多种数据类型组合在一起，兼有array与dictionary 的部分特点
//定义一个元组 qimeila，其中包含两个元素，类型分别为String与Int，取别名desc与num
let qimeila: (desc: String, Int) = ("haha", 123)
//通过下标可获得对应的值
print(qimeila.0)
//通过别名也可获得对应的值
print(qimeila.desc)

print("----- 类型别名 -----")
//可以用 typealias 关键字位类型定义一个别名，然后使用别名来定义该类型
typealias customInt = Int
var hour: customInt = 24
let min = 1
hour += min

print("----- 可选类型基本概念 -----")
//可选类型"?"是swift中的重要概念，用于表示一个类型的值可能为nil，nil的概念与OC中的nil不同，OC中的nil指向一个不存在对象的指针，而swift中的nil为一个表示值缺失的确定的值，且任意类型都可被设为该值
//表示str可能为nil，被标为可选类型的对象无需在init方法中强制初始化的规定
let string: String?

print("----- 可选解包 -----")
//由于可选类型并不一定有值，对于需要用到可选类型的地方需要进行解包才能进行后续操作，具体就是在标识符后添加一个叹号!，近似于表示“这个可选类型保准有值，放心吧，万一没有值crash了我来背锅“
let maybeNone: String? = "maybeNone"
//print(maybeNone)	//warning   未进行解包，出现警告
print(maybeNone!)		//解包后无警告

print("----- 隐式解包 -----")
//隐式解包的可选类型可以理解为每次使用时自动解包的可选类型，在定义时在类型后添加叹号!，之后在使用时可不用解包即可使用
let cannotBeNone: String! = " cannotBeNone"
print(cannotBeNone)

print("----- 可选绑定 -----")
//用来判断可选类型是否包含值，若包含，则把值赋给一个临时变量，常用在if、while、guard等需要判断进入分支的地方
//该段代码表示如若str不为nil，将str赋值给a，然后进入if分支，若str为nil，不进入if分支，进行后续的代码操作多个可选绑定使用逗号分隔，互相之间为“与“的关系
//注意能够进行可选绑定的参数必须为可选类型
let str: String? = "xx"
let str2: String? = nil
if let a = str , let b = str2 {
    print("victory")
}

print("----- 可选链式调用 -----")
//可选链式调用是一种在当前值可能为 nil 的可选值上请求和调用属性、方法及下标的方法。如果可选值有值，那么调用就会成功，如果可选值是 nil ，那么调用将返回 nil 。多个调用可以连接在一起形成一个调用链，如果其中任何一个节点为 nil ，整个调用链都会失败，即返回 nil
class Tiger {
    var number: Int = 1
}
class Zoo {
    var tiger: Tiger?
}

let zoo = Zoo()
//若这里采用强制解包 zoo.tiger!.number  则会报错
if let tigerNumber = zoo.tiger?.number  {
    print("tiger number is \(tigerNumber)")
}else{
    print("no tiger")
}

print("----- 向下转型 -----")
//某类型的一个常量或变量可能在幕后实际上属于一个子类。当确定是这种情况时，可以尝试向下转到它的子类型，用类型转换操作符(条件形式 as? 或强制形式 as!)
//当你不确定向下转型可以成功时，用类型转换的条件形式 as?
class Person{}
class Student: Person{}
class Teacher: Person{}

let person1 = Student()
let person2 = Teacher()
let person3 = Student()
let personArray = [person1, person2, person3]
for person in personArray {
    if ((person as? Student) != nil) {
        print("this is a Student")
    }else if ((person as? Teacher) != nil) {
        print("this is a Teacher")
    }else{
        print("this is not a Teacher or Student")
    }
}



