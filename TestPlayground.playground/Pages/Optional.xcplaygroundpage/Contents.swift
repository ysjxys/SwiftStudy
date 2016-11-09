//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//? 可选类型，可能为nil   ！强行解包，认为一定有值
// NSURL、NSURLRequest已经过期，分别用URL、URLRequest代替
let url = URL(string: "http://www.baidu.com/")


if url != nil{
    let request = URLRequest(url: url!)
}
