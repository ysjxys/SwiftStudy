//: [Previous](@previous)

import Foundation

//print("----- 类型参数 -----")
//func swapTwoInt ( a: inout Int, b: inout Int){
//    let tempInt = a
//    a = b
//    b = tempInt
//}
//var a = 10
//var b = 20
//swap(&a, &b)
//print("a:\(a)  b:\(b)")
//
////类型参数指定并命名一个占位在上面的类型，并且紧随在函数名后面，使用一对尖括号括起来，如<V>
//func swapTwoValue <V> (a: inout V, b: inout V){
//    let tempValue = a
//    a = b
//    b = tempValue
//}
//var str1 = "xx"
//var str2 = "ss"
//swap(&str1, &str2)
//print("str1:\(str1)  str1:\(str2)")
//
//
//print("----- 类型参数的命名 -----")
////在大多数情况下，类型参数具有一个描述性名字，例如 Dictionary<Key, Value> 中的 Key 和 Value，以及 Array<Element> 中的 Element 
//struct Stack<Element>{
//    var items: [Element] = []
//    mutating func push(item: Element) {
//        items.append(item)
//    }
//    mutating func pop() -> Element {
//        return items.removeLast()
//    }
//}
//
//print("----- 泛型类型的扩展 -----")
////扩展一个泛型类型的时候，不用在扩展的定义中提供类型参数列表，原始类型定义中声明的类型参数列表在扩展中可以直接使用
//extension Stack{
//    var topElement: Element?{
//        return items.isEmpty ? nil : items.first
//    }
//}
//
//var stack: Stack<String> = Stack(items: ["first", "second"])
//stack.push(item: "third")
//stack.push(item: "forth")
//stack.push(item: "fifth")
//stack.pop()
//stack.topElement
//
//
//print("----- 泛型的协议实现 -----")
////在一个类型参数名后面放置一个类名或者协议名，并用冒号进行分隔，来定义类型约束，它们将成为类型参数列表的一部分
//func findSame<Value: Equatable>(array: [Value], compareValue: Value) -> Int?{
//    for (index, value) in array.enumerated() {
//        if value == compareValue {
//            return index
//        }
//    }
//    return nil
//}
//
//findSame(array: ["first", "second", "third", "forth"], compareValue: "third")
//
//
//print("----- 关联类型 -----")
//protocol connect{
//    associatedtype ItemType
//    mutating func append(item: ItemType)
//    var count: Int {get}
//    subscript(i: Int) -> ItemType {get}
//}
//
//struct Stack2<Element>: connect{
//    var items: [Element] = []
////    typealias ItemType = Element
//    
//    subscript(i: Int) -> Element {
//        return items[i]
//    }
//
//    mutating func append(item: Element) {
//        items.append(item)
//    }
//    
//    var count: Int{
//        return items.count
//    }
//}
//
//var stack2 = Stack2<String>()
//stack2.append(item: "first")
//stack2.count
//stack2.append(item: "second")
//stack2[1]



//print("----- where子语句 -----")
//func testWhere<C1: connect, C2: connect>(c1: C1, c2: C2) -> Bool where C1.ItemType == C2.ItemType{
//    
//    
//    return true
//}


