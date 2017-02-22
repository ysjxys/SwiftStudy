//: [Previous](@previous)

import Foundation

//格式 
//func 函数名(形参列表) -> 返回类型 {
//    功能实现
//}
func sum(x: Int, y: Int) -> Int {
    return x + y
}

sum(x: 10, y: 20)

//外部参数，内部参数（别名？）
func sum2(sum1 x: Int, sum2 y: Int) -> Int{
    return x + y
}

sum2(sum1: 1, sum2: 3)

//空返回值
func empty1() {
    print("empty1")
}
empty1()


func empty2() -> (){
    print("empty2")
}
empty2()


func empty3() -> Void{
    print("empty3")
}
empty3()
