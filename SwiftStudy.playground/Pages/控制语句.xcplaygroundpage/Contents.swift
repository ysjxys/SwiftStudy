//: [Previous](@previous)

import Foundation

print("----- switch及结合enum -----")
//switch语句必须是完备的，每一个可能的值都必须至少有一个 case 分支与之对应，或使用default分支来涵盖其它所有没有对应的值，switch的判断值可以为任意类型
let someCharacter = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}
//枚举类型enum常与switch合用返回特定值，通过定义的enum，可以返回各个case值的下标、case值本身、自定义的case值以及通过switch处理后的值
enum Rank: Int{
    case a = 10
    case b,c,x,y,z = 20
    case d
    case e
    
    func description() -> String {
        switch self {
        case .a:
            return "A"
        case .c:
            return "C"
        default:
            return String(self.rawValue)
        }
    }
}
print(Rank.z)               //输出z本身
print(Rank.z.rawValue)      //自定义值
print(Rank.z.hashValue)     //从0开始按顺序排列的下标值
print(Rank.c.description())//自定义switch处理后的值
print(Rank.d.rawValue)//未显示指定的值为之前值+1递增

print("----- if语句 -----")
//取消了没有（）
//必须有{}
//不存在非零即真，只有true和false
let num = 10

//if num {      //error，不存在非零即真
//    print("xx")
//}

if num > 5{     //需明确写明判断条件
    print("> 5")
}

var str1: String? = "Hello, playground"
var str2 = "Hello, playground"
if (str1 != nil) || (str2 == ""){
    print("xxx")
}
//用于if内可选绑定的必须为明确写明的“可选类型”
//if let a = str2 {             //error，str2不是可选类型
//    print("a is alive")
//}
if let a = str1 {           //需用可选类型进行可选绑定
    print(a)
}


//多个if判断条件之间用“，”分割 &&
//if let 判断并且赋值 确保let后的一定有值 才会进入分支
var str3: String? = nil
let x: Int! = 1
let y: String? = "yy"
let z: String? = nil

if let y = x, let ss = str1, x == 1 || str3 != nil {
    print(ss+String(x))
}

if let yy = y, let zz = z {
    print("inside")
}else{
    print("not inside")
}

print("----- 循环语句 -----")
//swift中常用for进行循环操作，且相比于OC中的for循环有较大的改变，废弃了C语法风格的for循环编写方式，采用for...in进行编写
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
let dictionary = ["a": 1, "b": 2, "c": 3, "d": 4, "e": 5]
for i in dictionary {
    print(i.key + String(i.value))
}

var numCircle: Int = 5
while numCircle > 0 {
    if numCircle == 3 {
        break
    }
    print(numCircle)
    numCircle = numCircle - 1
}

print("----- 跳转语句 -----")
//continue：中止此次循环，进行下一次循环
//break：中止该循环，在switch中使用时会中止并跳出switch
//fallthrough：在switch的case中使用，使得switch的case会类似与OC进行贯穿执行
//guard-else{}：提前退出，采用可选绑定的方式判断是否为nil，若为nil执行else后大括号内代码并return，非nil则跳转到大括号外继续执行

print("----- where子语句 -----")
//swift2.X版本中，where被用在可选绑定内两个绑定之间的联结，swift3.0时已用逗号代替where子句
//swift3.X版本内，where常被用在switch-case中的额外条件以及声明泛型函数参数的额外要求
let arrayNum = [1,2,3,4,5,6,7,8,9,10]
for num in arrayNum {
    switch num {
    case 1...2:
        print("1-2");
    case 3:
        print("3")
    case let num where num < 5:
        print("<5")
    case let num where num > 5:
        print("num > 5")
    default:
        print("default");
    }
}

print("----- guard -----")
//guard-else，与if相反，guard是符合条件则跳过，不符合条件则进入else分支
func testGuard(){
    let compare = 0
    guard compare > 1 else {
        print("in guard")
        return
    }
}
testGuard()

func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    print("name: \(name)")
    guard let location = person["location"] else {
        print("no location")
        return
    }
    print("location: \(location)")
}
greet(person: ["name": "jack"])


