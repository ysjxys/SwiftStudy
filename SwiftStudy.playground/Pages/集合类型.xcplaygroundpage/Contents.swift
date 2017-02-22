//: [Previous](@previous)

import Foundation

print("----- array -----")

//swift的数组比OC更灵活，可以在数组内存放基础数据类型的值，也无需数组内的值类型一致，但需将数组声明为Any类型，数组为值类型，传递时为拷贝
//定义数组,数组内保存String 并实例化对象
var array02: [String] = []
var array01 = [String]()    //亦可，但不推荐
//数组类型默认可以省略
let array1 = ["miku", "lily"]
for name in array1 {
    print(name)
}
//[Any] 任意类型，数组初始化内含多种类型的，不能省略[Any] 若为[String] 表示只能存放字符串
var array21: [Any] = ["miku", 18, false]
//array为值类型，传递时为拷贝
var arrar22 = array21
arrar22.insert("female", at: 1)
print(array21)
print(arrar22)
//增删内容
var array3 = ["miku","lucy"]
array3.append("Lily")
array3.insert("HanMei", at: 1)
array3.remove(at: 2)
//定义数组并指定容量，repeating:填充内容  count:容量
var array5 = [Int](repeating: 0, count: 10)
//数组的拼接     拼接的数组保存的数据类型需要一致
var array61 = [1,2,3,4,5]
var array62 = [6,7,8,9,10]
var array63 = array61 + array62
array61 += array62

//数组容量初始为1，若数组容量不够，则*2
for i in 0..<10 {
    array01.append("name+\(i)")
    print("索引:\(i)  容量(capacity):\(array01.capacity)")
}


print("----- dictionary -----")
//swift中的字典类型写法与OC中不同，采用中括号而非大括号，字典为值类型，传递时为拷贝，遍历时采用组合类型表示key-value对
//定义字典类型  key:value  key通常是字符串，value可以为任意类型
var dictionary02: [String: String] = [:]
dictionary02.count
var dictionary01 = [String: String]()   //亦可，但不推荐
//dictionary为值类型，传递时为拷贝
var dictionary1: [String: Any] = ["name": "miku", "age": 18]
var dictionary2 = dictionary1
dictionary2["name"] = "Lucy"
print(dictionary1)
print(dictionary2)
//遍历
for (k,v) in dictionary1 {
    print("key:\(k) value:\(v)")
}
//新增键值对
dictionary1["gender"] = "female"
print(dictionary1)

print("----- set -----")
//swift中的set类型与OC一样，只能存放同种类型的数据
//set声明与初始化
let set: Set<String> = ["a","b","c"]
//不指明类型 而进行类型推断
let set2: Set = [2,3,1]
//空set
var set3 = Set<Int>()
//添加数据
set3.insert(2)
set3.insert(3)
print(set3)
//删除数据
set3.remove(2)
print(set3)










