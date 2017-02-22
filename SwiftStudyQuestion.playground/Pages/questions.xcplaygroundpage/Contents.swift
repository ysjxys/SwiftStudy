//: [Previous](@previous)

import Foundation

//1、where子语句的 或 判断
let array = [1,2,3,4,5,6,7,8,9,10]
for num in array {
    switch num {
    case 1...2:
        print("1-2");
    case 3:
        print("3")
    case let num where num > 3 && num < 5:
//    case let num where num > 3, let num where num < 5:
//    case let num where num > 11, let num where num < 10:
        print("4")
    case let num where num > 5:
        print("num > 5")
    default:
        print("default");
    }
}



//2、return关键字在闭包中的省略
//当闭包实现内仅有一个 返回值类型符合闭包返回类型的函数时，可以省略return
//将 () -> (String) 类型闭包当做参数传入
func testClosureReturn() -> String {
    return "this is return string"
}
func arrayValue(returnClosure: () -> (String) ){
    print("this is returnClosure string:\(returnClosure())")
}
arrayValue { () -> (String) in
    testClosureReturn()
}



//3、类的计算类型属性设置值引起的循环调用
class Police {
    var age: Int = 0
    var name: String = ""
    class var description: String {
        return "ss"
    }
    class var skinColor: String {
        set {
            self.skinColor = newValue   //error
        }
        get {
            return "xx"
        }
    }
    init(age: Int, name: String) {
        self.age = age
        self.name = name
    }
}

//Police.skinColor = "color"
//error: Playground execution aborted: error: Execution was interrupted, reason: EXC_BAD_ACCESS (code=2, address=0x7fff5db6aff8).
//The process has been left at the point where it was interrupted, use "thread return -x" to return to the state before expression evaluation.




// 4、修改结构体的关键词 mutating  与枚举类型的结合使用 P172

//enum TriStateSwitch {
//    case Off, Low, High
//    mutating func next() {
//        switch self {
//        case Off:
//            self = Low
//        case Low:
//            self = High
//        case High:
//            self = Off }
//    } }
//var ovenLight = TriStateSwitch.Low ovenLight.next()
// ovenLight 现在等于 .High ovenLight.next()
// ovenLight 现在等于 .Off

//Enum case cannot have a raw value if the enum does not have a raw type
enum ComputerNum: Int {
    case zeroNum = 1
    case oneNum = 2
    mutating func programNum() -> ComputerNum {
        switch self {
        case .zeroNum:
            return .oneNum
        case .oneNum:
            return .zeroNum
        }
    }
}
var zeroNum = ComputerNum.zeroNum
zeroNum.programNum()
var afterNum: ComputerNum = zeroNum.programNum()
print(ComputerNum.zeroNum.rawValue)


// 5、range 的使用
//截取第2位至倒数第5位之间的字符串
var str = "Helloplayground"

//转换成NSString方式
(str as NSString).substring(with: NSMakeRange(2, str.characters.count-5-2))

//swift方式
//先获得需要的下标
let index1 = str.index(str.startIndex, offsetBy: 2)//其实也可以直接写个2...error
let index2 = str.index(str.endIndex, offsetBy: -5)
//进行截取
str.substring(with: index1..<index2)

//截取指定字符串play之后的3位
let range1 = str.range(of: "play")
let startIndex = range1!.upperBound
let lastIndex = str.index(startIndex, offsetBy: 3)
str.substring(with: startIndex..<lastIndex)


//6、属性观察器与set、get
//属性观察器（willSet、didSet）与set、get似乎不能同时使用?
//因为为属性观察器为存储属性的特性，而set、get为计算属性
class Family {
    var familyMember = "three member"
    //进行了初始化赋值，为存储属性
    var familyName: String = ""{
        willSet{
            print("willSet " + newValue)
        }
        didSet{
            print(oldValue + " didSet " + familyName)
        }
    }
    
    //有set、get方法，未进行赋值，为计算属性
    var familyName2: String{
        set{
            familyMember = newValue
        }
        get{
            return familyMember
        }
    }
    
}


// 7、SE-0046
//函数的第一个参数需要有名称与其对应，或者在声明里采用下标"_" 来明确表明不需要名称

func printParam (firstParam: String, secondParam: String) -> Void{
    print("firstParam: "+firstParam+" secondParam: "+secondParam)
}
printParam(firstParam: "hello", secondParam: "world")

//相当于占用了外部参数名的位置
func printParam2 (_ firstParam : String, secondParam: String) -> Void{
    print("firstParam: "+firstParam+" secondParam: "+secondParam)
}
printParam2("hello", secondParam: "world")

//甚至可以...
func printParam3 (_ firstParam : String, _ secondParam: String) -> Void{
    print("firstParam: "+firstParam+" secondParam: "+secondParam)
}
printParam3("hello", "world")



















