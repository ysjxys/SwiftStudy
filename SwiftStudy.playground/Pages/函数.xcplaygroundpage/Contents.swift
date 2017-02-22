//: [Previous](@previous)

import Foundation

print("----- 函数的定义与调用 -----")
//函数是一段完成特定任务的独立代码片段，可以通过给函数命名来标识某个函数的功能，这个名字可以被用来在需要的时候"调用"这个函数来完成它的任务
//  func 函数名(参数列表) -> (返回类型) {
//       函数实现
//  }

print("----- 函数的参数与返回值 -----")
//函数根据参数与返回值的存在与否，具有多种简略写法

//有参数有返回值的函数，多个参数之间以","分隔
func func1(firstParam: String, secondParam: Int) -> String {
    return firstParam+": \(secondParam)"
}

//有参数无返回值的函数，以下形式均可
func func2(firstParam: String) -> () {}
func func3(firstParam: String) -> Void {}
func func4(firstParam: String) {}

//无参有返回值的函数
func func5() -> String {
    return "hello"
}

//无参无返回值的函数
func func6() {}

print("----- 函数参数标签与名称 -----")
//参数标签：供调用时使用，相当于参数的外部别名，写在参数名称前，以空格分隔
func func7(number param: Int){
    print("\(param)")
}
func7(number: 1)

//输入输出参数：若要求函数可以修改参数的值，并且想要在这些修改在函数调用结束后仍然存在，那么应该把这个参数定义为输入输出参数，在函数的定义中使用inout关键字来表明输入输出参数，在调用函数时在参数前加取地址符&，表示这个值可以被函数修改
func func8(param: inout String){
    param = param+" update"
}
//必须使用变量作为参数传入，常量或参数字面量均不可
//func8(param: &"test inout")     //error
var param = "test inout"
func8(param: &param)
print(param)

print("----- 函数类型 -----")
//函数作为一种类型可以像String、Int一样赋予给变量或常量
func addTwoInts (addParam1: Int, addParam2: Int) -> Int{
    return addParam1 + addParam2
}
var addFunc: (Int, Int) -> Int = addTwoInts
addFunc(2, 3)

//函数类型作为参数
func func9 (paramFunc: (Int, Int) -> Int, addParam1: Int, addParam2: Int){
    print("\(paramFunc(addParam1, addParam2))")
}
func9(paramFunc: addFunc, addParam1: 5, addParam2: 10)

//函数类型作为返回值
func func10 () ->  (Int, Int) -> Int {
    return addFunc
}
let resultFunc = func10()
resultFunc(1, 2)




