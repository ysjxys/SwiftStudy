//: [Previous](@previous)

import Foundation

//定义字典类型
//key:value  key通常是字符串，value可以为任意类型
var dictionary: [String:Any] = ["name":"miku","age":18]
var dictionary2 = dictionary
dictionary2["name"] = "Lucy"
print(dictionary)
print(dictionary2)
//遍历
for (k,v) in dictionary {
    print("key:\(k) value:\(v)")
}

dictionary["gender"] = "female"




let dic2 :[String:Any] = ["address":"where","wedding":true]
for (k,v) in dic2 {
    dictionary[k] = v
}

print("------")
for (k,v) in dictionary {
    print("key:\(k) value:\(v)")
}
