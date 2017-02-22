//: [Previous](@previous)

import Foundation

print("----- 存储属性、计算属性 -----")
//存储属性:使用var、let定义
//  延时存储属性：使用lazy 关键字，只能使用var定义，
class DataImporter {
    var fileName = "data.txt"
}
class DataManager {
    lazy var importer = DataImporter()
    var data: [String] = []
}
//importer未被创建
let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
//importer被创建
print(manager.importer.fileName)

//计算属性:类、结构体、枚举可定义计算属性，计算属性不直接存储值，而是提供一个 getter 和一个可选的 setter，来间接获取和设置“其他属性或变量”的值
class Police {
    var age: Int = 0
    var name: String = ""
    var call: String = " police"//类的存储类型属性，必须初始化
    var description: String {//只读计算类型属性
        return "ss"
    }
    var skinColor: String {//可读可写计算类型属性
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
print(whithePeople.name)
whithePeople.skinColor = "white"
print(whithePeople.skinColor)
print(whithePeople.description)


print("----- 属性观察器 -----")
//属性观察器监控和响应存储属性值的变化，每次属性被设置值的时候都会调用属性观察器，即使新值和当前值相同的时候也不例外
//属性观察器分为willSet和didSet
//willSet:观察器会将新的属性值作为常量参数传入,若不设置名称，则默认为newValue
//didSet:观察器会将旧的属性值作为参数传入,默认旧值为oldValue
class Family {
    var familyName: String = "jack" {
        willSet{
            print("willSet " + newValue)
        }
        didSet{
            print(oldValue + " didSet " + familyName)
        }
    }
}

var family = Family()
family.familyName = "rose"

print("----- 全局变量与局部变量 -----")
//全局变量是在函数、方法、闭包或任何类型之外定义的变量。局部变量是在函数、方法或闭包内部定义的变量
class Company{
    var companyName: String = "company"
    func department() {
        let departmentName = "IT"
        print(departmentName)
    }
}
let company = Company()
print(company.companyName)
//print(company.department.departmentName)//error

print("----- 类属性 -----")
//类属性:类型本身定义的属性，无论创建了多少个该类型的实例，这些属性都只有唯一一份,用static定义，为class类型定义"计算型类型属性"时，还可用class来定义
//实例属性:属于一个特定类型的实例，每创建一个实例，实例都拥有属于自己的一套属性值，实例之间的属性相互独立

class MiddleSchool{
    static var schoolLevel: String = "middleSchool"
    var schoolName: String?
}

var expMiddleSchool = MiddleSchool()
var townMiddleSchool = MiddleSchool()
expMiddleSchool.schoolName = "exp"
townMiddleSchool.schoolName = "town"

print("schoolName :" + expMiddleSchool.schoolName! + " schoolLevel :"+MiddleSchool.schoolLevel)
print("schoolName :" + townMiddleSchool.schoolName! + " schoolLevel :"+MiddleSchool.schoolLevel)

MiddleSchool.schoolLevel = "highSchool"
print("schoolName :" + expMiddleSchool.schoolName! + " schoolLevel :"+MiddleSchool.schoolLevel)
print("schoolName :" + townMiddleSchool.schoolName! + " schoolLevel :"+MiddleSchool.schoolLevel)











