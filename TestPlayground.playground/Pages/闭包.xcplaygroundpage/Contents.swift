//: [Previous](@previous)

import Foundation

//闭包的定义：
//1.一组预先准备好的代码
//2.可以当做参数传递
//3.在需要的时候执行
//类似于block


func sum(sum1 x:Int, sum2 y:Int) -> Int{
    return x + y
}
sum(sum1: 10, sum2: 20)

//amazing
let sumFunc = sum
sumFunc(1,2)

//闭包的定义
let funcation = {
    print("hehe")
}

// 格式
// { (形参列表) -> 返回类型(返回为空则省略) in
//    闭包实现
// }

//闭包全部书写在{}内
// in 用于区分参数定义与实现
let funcation2 = {(x: Int, y: Int) -> Int in
    return x + y
}
funcation2(1, 2)
//无返回值简写
let funcation3 = {(x: Int, y: Int) in
    print("\(x)  \(y)")
}
funcation3(1,2)
//无参简写
let function4 = { () -> String in
    return "result is here"
}
function4()
//既无参数也无返回值简写
let function5 = {
    print("there is no data")
}
function5()



func testLastClosure(closure:(String) -> Void ){
    print("here is func testLastClosure")
    closure("input value")
}
//正常闭包写法
testLastClosure(closure: {(msg) -> Void in
    print(msg)
})
//尾随闭包写法
testLastClosure { (msg) in
    print(msg)
}

//值捕获  创建一个参数为int，返回值为函数类型：() -> (Int) 的函数
func catchValue(increaseNum num: Int) -> () -> (Int){
    var total = 0
    
    func catchClosure() -> (Int){
        total = total + num
        return total
    }
    return catchClosure
}
//将函数赋值给常量 然后反复执行
let funcValue = catchValue(increaseNum: 10)
funcValue()
funcValue()
funcValue()
//将funcValue赋值给新的常量funValue2，其实指向的是同一个引用的函数
let funcValue2 = funcValue
funcValue2()

//逃逸闭包
func loadData(finishedHandle: @escaping (String, Int) -> ()){
    DispatchQueue.global().async {
        print("loading...\(Thread.current)")
        
        DispatchQueue.main.async {
            print("回调\(Thread.current)")
            finishedHandle("show message", 1)
        }
    }
}

//将 () -> (String) 类型闭包当做参数传入，不包含 @autoclosure 情况下
var array = ["a","b","c"]
func arrayValue(removeItem: () -> (String) ){
    print("not autoclosure \(removeItem()) was removed")
}
//调用函数时 需要赋予函数标准的 () -> (String) 类型的闭包作为参数
arrayValue(removeItem: {
    return array.remove(at: 0)
})
//代码自动补全 为我们推荐了尾随闭包的代码补全方案
arrayValue { () -> (String) in
    array.remove(at: 0)
}
//在函数的定义中 添加 @autoclosure 后
var array2 = ["a","b","c"]
func arrayValue2(removeItem: @autoclosure () -> (String) ){
    print("autoclosure \(removeItem()) was removed")
}
//这时再调用函数，仅需补全 原() -> (String) 闭包的返回类型String即可
arrayValue2(removeItem: array2.remove(at: 0))
