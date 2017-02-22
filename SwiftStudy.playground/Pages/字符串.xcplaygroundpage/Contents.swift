//: [Previous](@previous)

import Foundation


print("----- 初始化字符串 -----")
//采用字符串自面量  字符串字面量是由双引号 ("") 包裹着的具 有固定顺序的文本字符集
let str = "Hello，playground"
//采用初始化String实例
var emptyString = String()

print("----- 字符串是值属性 -----")
var str2 = str
str2 = "xx"
print(str)
print(str2)

print("----- 字符串遍历字符 -----")
for character in str.characters {
    print(character)
}

print("----- 字符串连接 -----")
var str3 = str+str2
var str4 = "s4"
str4 += str

print("----- 字符串插值 -----")
var str5 = "zifuchan:\(str)"

print("----- 字符串的特殊字符输入 -----")
//转义字符 \0 (空字符)、 \\ (反斜线)、 \t (水平制表符)、 \n (换行符)、 \r (回车符)、 \" (双引号)、 \' (单引号)。
//Unicode 标量，写成 \u{n} (u为小写)，其中 n 为任意一到八位十六进制数且可用的 Unicode 位码
var str6 = "\"\\ \u{24}"

print("----- 访问和修改字符串 -----")
//截取第2位至倒数第5位之间的字符串
//转换成NSString方式
(str as NSString).substring(with: NSMakeRange(2, str.characters.count-5-2))

//swift方式
//先获得需要的下标
//"Hello，playground"
let index1 = str.index(str.startIndex, offsetBy: 2)//其实也可以直接写个2...
let index2 = str.index(str.endIndex, offsetBy: -5)
//进行截取
str.substring(with: index1..<index2)

//截取指定字符串play之后的3位
let range1 = str.range(of: "play")
let startIndex = range1!.upperBound
let lastIndex = str.index(startIndex, offsetBy: 3)
str.substring(with: startIndex..<lastIndex)
