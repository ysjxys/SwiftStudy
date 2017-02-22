//: [Previous](@previous)

import Foundation
import UIKit

print("----- 闭包表达式 -----")
//闭包是一段之后能被调取的代码，其使用与OC中的block有诸多相似之处，但其实现原理则不同，在swift中，函数是一种特殊的闭包，而在OC中，block是匿名函数，即为一种特殊的函数
//闭包的声明：   let 闭包标识符: （形参列表）-> 返回类型
//闭包表达式是一种利用简洁语法构建内联闭包的方式，表现为
//    {（形参列表）-> 返回类型 in
//        闭包实现
//    }
//闭包全部书写在{}内  用"in"来区分参数的定义与实现
let closure: (String) -> Void
let closure2 = {(x: Int, y: Int) -> Int in
    return x + y
}
print(closure2(1, 2))
//无返回值简写
let closure3 = {(x: Int, y: Int) in
    print("\(x)  \(y)")
}
closure3(1,2)
//无参简写
let closure4 = { () -> String in
    return "result is here"
}
print(closure4())
//既无参数也无返回值简写
let closure5 = {
    print("there is no data")
}
closure5()

print("----- 尾随闭包 -----")
//当闭包作为函数的最后一个参数时，可以省略前面的括号，使代码更简洁易懂
//函数最后一个参数为 (String) -> String 类型的闭包
func testLastClosure(closure: (String) -> String){
    print("here is func testLastClosure")
    closure("input value")
}
//调用函数 正常闭包写法
testLastClosure(closure: {(msg) -> String in
    print(msg)
    return msg
})

//尾随闭包写法
testLastClosure { (msg) in
    print(msg)
    return msg
}

print("----- 值捕获与循环引用 -----")
//闭包可以在其被定义的上下文中捕获常量或变量，即使定义这些常量与变量的原作用域已经不存在，闭包仍可在闭包实现内使用和修改这些值。
//因此若在闭包内需要用闭包外的值，可以不将这些值通过参数传入闭包即可直接使用。

//创建一个参数为int，返回值为函数类型：() -> (Int) 的函数/闭包
func catchValue(increaseNum num: Int) -> () -> Int{
    var total = 0
    
    func catchClosure() -> (Int){
        total = total + num
        return total
    }
    
//    let catchClosure2: () -> Int = {
//        total = total + num
//        return total
//    }
    return catchClosure
}
//将函数返回值赋值给常量 然后反复执行
let funcValue = catchValue(increaseNum: 10)
funcValue()
funcValue()
funcValue()
//将funcValue赋值给新的常量funValue2，其实指向的是同一个引用的函数
let funcValue2 = funcValue
funcValue2()

//需要注意的时，若将闭包赋值给一个类实例的属性，并且该闭包通过访问该实例或其成员而捕获了该实例，会在闭包和该实例间创建一个循环强引用
//可以通过定义捕获列表的方法来打破闭包的循环引用，捕获列表中的每一项都由一对元素组成，一个元素是 weak 或 unowned 关键字，另一个元素是类实例的引用(例如self)或初始化过的变量(如delegate = self.delegate)
//如 [unowned self, weak delegate = self.delegate!]  将其放在闭包实现{...}的最前



print("----- 引用类型or值类型 -----")
//显然闭包是引用类型
print("----- 逃逸闭包 -----")
//当一个闭包作为参数传递给函数时，若闭包在函数返回后才执行，如异步回调函数，则该闭包被称为逃逸闭包，需要再闭包的标识符前加 @escaping 来指明允许该闭包逃逸并被使用，否则会产生编译错误
func loadData(finishedHandle: @escaping (String, Int) -> ()){
    DispatchQueue.global().async {
        print("loading...\(Thread.current)")
        
        DispatchQueue.main.async {
            print("回调\(Thread.current)")
            finishedHandle("show message", 1)
        }
    }
}

print("----- 自动闭包 -----")
//通过@autoclosure来将一个无输入参数的闭包声明为自动闭包，常用于闭包作为参数传递给函数的情况，此时作为参数的闭包可以省略大括号，简化书写

//将 () -> (String) 类型闭包当做参数传入，不包含 @autoclosure 情况下
var array = ["a","b","c"]
func arrayValue(removeItem: () -> String ){
    print("not autoclosure \(removeItem()) was removed")
}
//调用函数时 需要赋予函数标准的 () -> (String) 类型的闭包作为参数
arrayValue(removeItem: {
    return array.remove(at: 0)
})


func testReturn () -> String{
    return "xxx"
}
//代码自动补全 为我们推荐了尾随闭包的代码补全方案
arrayValue { () -> String in
    return array.remove(at: 0)
    //当闭包实现内仅有一个返回值符合条件的函数时，可以省略return
//    print("xx")
//    return array.remove(at: 0)//亦可
//    testReturn()
}
//在函数的定义中 添加 @autoclosure 后
var array2 = ["a","b","c"]
func arrayValue2(removeItem: @autoclosure () -> String ){
    print("autoclosure \(removeItem()) was removed")
}
//这时再调用函数，仅需补全 原() -> (String) 闭包的返回类型String即可
arrayValue2(removeItem: array2.remove(at: 0))








