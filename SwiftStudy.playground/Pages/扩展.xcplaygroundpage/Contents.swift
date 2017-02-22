//: [Previous](@previous)

import Foundation

print("----- 扩展语法 -----")
//扩展 就是为一个已有的类、结构体、枚举类型或者协议类型添加新功能。与OC 中的分类类似，但Swift的扩展没有名字，而OC的分类有分类名
//1、扩展语法
//使用 extension 关键字来声明扩展
class Person: NSObject {
    
}

extension Person {
    func showMsg(){
        print("showMsg")
    }
}

print("----- 扩展计算属性 -----")
//2、扩展计算属性
//扩展可以为已有类型添加计算型实例属性和计算型类型属性
extension Double {
    var km: Double {return self*1000}
}
let distance = 1.2.km
print("\(distance)")

print("----- 扩展构造器 -----")
//3、扩展构造器
struct Size {
    var width = 0.0
    var height = 0.0
}
struct Point {
    var x = 0.0
    var y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}

extension Rect {
    init(center: Point, size: Size) {
        let x = center.x - size.width/2
        let y = center.y - size.height/2
        self.init(origin: Point(x: x, y: y), size: size)
    }
}
let rect = Rect(center: Point(x: 1, y: 2), size: Size(width: 5, height: 5))

print("----- 扩展方法 -----")
//4、扩展方法
extension Int{
    func isSmallerThanTen() -> Bool {
        return self<10
    }
}
let nine: Int = 9
nine.isSmallerThanTen()


