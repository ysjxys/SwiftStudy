//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


//let set: [SetAny] = ["audi",false,1]

//完整写法
let set: Set<String> = ["a","b","c"]
//类型推断
let set2: Set = [2,3,1]
//空集合
var set3 = Set<Int>()
//添加数据
set3.insert(2)
set3.insert(3)
print(set3)
//删除数据
set3.remove(2)
print(set3)
		