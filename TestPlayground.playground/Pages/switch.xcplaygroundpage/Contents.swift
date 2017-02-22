//: [Previous](@previous)

import Foundation

//判断值可以是任意类型
let name: String = "hehe"

switch name {
case "hehe":
    print(name)
default:
    print("not courrent")
}

enum ss: String{
    case a = "aaa"
    case b,c,d
}

print(ss.a)
print(ss.b.rawValue)


print("--------")
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


let array = [1,2,3,4,5,6,7,8,9,10]
for num in array {
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




//作用域仅在case内部
//没有break
//每一个case都要有代码
let num = 1
switch num {
case 0:
    let temp = 0
    print(temp)
case 1:
//    print(temp) //error 作用域仅在上个case
    print(1)
case 2:
    print(2)
//case 3: //error
//case 4: break //添加break后空case也可编译通过
default:
    print("default")
}


