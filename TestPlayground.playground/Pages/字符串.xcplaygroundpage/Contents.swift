//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//截取第2位至倒数第5位之间的字符串

//转换成NSString方式
(str as NSString).substring(with: NSMakeRange(2, str.characters.count-5-2))

//swift方式
//先获得需要的下标
let index1 = str.index(str.startIndex, offsetBy: 2)//其实也可以直接写个2...
let index2 = str.index(str.endIndex, offsetBy: -5)
//进行截取
str.substring(with: index1..<index2)


//截取指定字符串play之后的3位

//let range1 = str.range(of: "play")
//let index = range1?.upperBound
//str.substring(from: <#T##String.Index#>)

let range1 = str.range(of: "play")
let index = range1?.upperBound
(str as NSString).substring(with: NSMakeRange(1, 3))






