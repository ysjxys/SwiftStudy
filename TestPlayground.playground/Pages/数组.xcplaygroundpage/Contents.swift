//: [Previous](@previous)

import Foundation


//使用[]定义数组
//[NSString] 表示只能存放字符串
let array = ["miku","lily"]

for name in array {
    print(name)
}

//[Any] 任意类型
var array21: [Any] = ["miku",18,false]
//深拷贝
var arrar22 = array21
arrar22.insert("female", at: 1)
print(array21)
print(arrar22)
//增删内容
var array3 = ["miku","lucy"]
array3.append("Lily")
array3.insert("HanMei", at: 1)
array3.remove(at: 2)
//定义数组并指定容量 repeating 填充内容    count 容量
var array5 = [Int](repeating: 0, count: 10)
//数组的拼接     拼接的数组保存的数据类型需要一致
var array61 = [1,2,3,4,5]
var array62 = [6,7,8,9,10]
swap(&array62[0], &array62[1])
print(array62)
var array63 = array61 + array62
array61 += array62



//定义数组,数组内保存String 并实例化对象
var array41 = [String]()   //亦可
var array42 :[String] = []

print("-----------")

//数组容量
//数组容量初始为1，若数组容量不够，则*2
for i in 0..<10 {
    array41.append("name+\(i)")
    print("索引:\(i)  容量(capacity):\(array41.capacity)")
}








