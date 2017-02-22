//: [Previous](@previous)

import Foundation

print("----- 协议概念及语法 -----")
//协议概念及语法
//协议是一种规定了用来实现某一特定任务或者功能的方法、属性，以及其他需要的东西的东东
protocol FirstProtocol {
    //协议的定义部分
}

protocol SecondProtocol {}
protocol ThirdProtocol {}

//实现协议
class ClassA: NSObject, FirstProtocol{
    
}
//继承父类并实现多个协议
class ClassB: ClassA, SecondProtocol, ThirdProtocol{
    
}

print("----- 协议的属性 -----")
//协议总是用 var 关键字来声明变量属性，必须在类型声明后加上 {set get} 或 {get} 来表示属性是可读可写的还是仅为可读
//在协议中定义类型属性时，总是使用 static 关键字作为前缀。当类类型采纳协议时，除了 static 关键字，还可以使用 class 关键字来声明类型属性

protocol Human {
    var name: String {set get}  //可读可写实例属性
    var age: Int {get}          //可读实例属性
    static var description: String {get}    //可读类型属性
    static var skinColor: String {set get}  //可读可写类型属性
}

class Police: Human {//实现human接口
    var age: Int = 0
    var name: String = ""
    static var call: String = " police"//类的存储类型属性，必须初始化
    class var description: String {//实现协议后类的计算类型属性
        return "ss"
    }
    class var skinColor: String {//实现协议后类的可读可写计算类型属性
        set {
            call = newValue + call
        }
    
        get {
            return call
        }
    }
    
    init(age: Int, name: String) {
        self.age = age
        self.name = name
    }
}

let whithePeople: Police = Police(age: 22, name: "jack")
whithePeople.age = 11
print(whithePeople.name)
print(whithePeople.age)
Police.skinColor = "white"
print(Police.skinColor)
print(Police.description)

print("----- 协议方法 -----")
//协议可以要求采纳协议的类型实现某些指定的实例方法或类方法。这些方法作为协议的一部分，像普通方法一样放在协议的定义中，但是不需要大括号和方法
//同属性一样，在协议中定义 类方法 的时候，总是使用 static 关键字作为前缀。当类类型采纳协议时，除了 static 关键字，还可以使用 class 关键字作为前缀
protocol CarBrand{
    static func countryCarBrand (country: String) -> (String)
}

class GermanyCarBrand: CarBrand{
    class func countryCarBrand(country: String) -> (String) {
        if country == "Germany" {
            return "dazhong"
        }else{
            return "else"
        }
    }
}

print(GermanyCarBrand.countryCarBrand(country: "Germany"))

print("----- 协议改变实例类型 -----")
//改变调用实例类型的关键字 mutating
protocol ProgramNum{
    mutating func programNum()
}

enum ComputerNum: ProgramNum{
    case ZeroNum ,OneNum
    mutating func programNum() {
        switch self {
        case .ZeroNum:
            self = .OneNum
        case .OneNum:
            self = .ZeroNum
        }
    }
}
var zeroNum = ComputerNum.ZeroNum
zeroNum.programNum()
//var afterNum = zeroNum.programNum()
//print(afterNum)

print("----- 协议构造器 -----")
//协议可以要求采纳协议的类型实现指定的构造器,需要加上 required 关键字
protocol SomeProtocol {
    init(someParameter: Int)
}

class SomeClass: SomeProtocol {
    var parameter: Int
    
    required init(someParameter: Int) {
        parameter = someParameter
    }
}

let someClass = SomeClass(someParameter: 101)
print(someClass.parameter)

print("----- 代理模式 -----")
protocol ClassDelegate {
    func passMsg(msg: String) -> Void
}

class ClassPassMsg{
    var delegate: ClassDelegate?
    
    func printMsg () {
        if delegate != nil {
            delegate?.passMsg(msg: "hehe")
        }
    }
}

class DualMsg: ClassDelegate{
    var classPassMsg: ClassPassMsg?
    func passMsg(msg: String) {
        print(msg)
    }
}

let dualMsg = DualMsg()

let passMsg = ClassPassMsg()
passMsg.delegate = dualMsg
passMsg.printMsg()

print("----- 通过扩展添加协议一致性 -----")
//协议可以添加到扩展内，其与添加到主文件效果完全一致
protocol MoreIntDescribute {
    func IntDesc()
}

extension Int: MoreIntDescribute {
    func IntDesc() {
        print("this is protocol & extension")
    }
}

let int = 1
int.IntDesc()

print("----- 通过扩展采纳协议 -----")
//当一个类型已经符合了某个协议中的所有要求，却还没有声明采纳该协议时，可以通过空扩展体的扩展来采纳该协议
//相当于一个扩展用来采纳协议，一个扩展用来实现协议
extension Double{
    func IntDesc() {
        print("this is protocol & extension")
    }
}
extension Double: MoreIntDescribute{}
let double = 1.0
double.IntDesc()

print("----- 协议数组 -----")
//协议数组,相当于数组内每个元素都是继承该协议的,若不继承则会报错
//let threeNumber = "str"
//let array: [MoreIntDescribute] = [int,double,threeNumber]
let array: [MoreIntDescribute] = [int,double]
for number in array {
    number.IntDesc()
}

print("----- 类类型专属协议 -----")
//通过添加 class 关键字来限制协议只能被类类型采纳，而结构体或枚举不能采纳 该协议。class 关键字必须第一个出现在协议的继承列表中，在其他继承的协议之前
protocol ClassProtocol: class, MoreIntDescribute{
    func classProtocolDesc()
}

class ClassProtocolClass: ClassProtocol{
    func IntDesc() {
        print("ClassPassMsg  IntDesc()  method")
    }
    func classProtocolDesc() {
        print("ClassPassMsg  classProtocolDesc()  method")
    }
}
let classProtocolClass = ClassProtocolClass()
classProtocolClass.classProtocolDesc()

//non-class type 'ClassProtocolNotClass' cannot conform to class protocol 'ClassProtocol'    无法继承类类型专属协议
//enum ClassProtocolNotClass: ClassProtocol{
//    func IntDesc() {
//        <#code#>
//    }
//}

