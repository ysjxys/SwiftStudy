//: [Previous](@previous)

import Foundation

//0~9
for i in 0..<10 {
    print(i)
}

//0~10
for i in 0...10 {
    print(i)
}

//array遍历
let array = [0,1,2,3,4]
for i in array {
    print(i)
}

//dictionary遍历 返回 key-value 元组
let dictionary = ["a":1,"b":2,"c":3,"d":4,"e":5]
for i in dictionary {
    print(i.key + String(i.value))
}


//<>表示泛型
let range = 0...10
//let range = 0..<10    //亦可

for i in range {
    print(i)
}
