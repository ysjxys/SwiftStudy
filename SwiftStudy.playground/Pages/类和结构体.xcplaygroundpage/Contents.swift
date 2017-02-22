//: [Previous](@previous)

import Foundation
print("----- 类和结构体的区别 -----")
//类和结构体对比
//Swift 中类和结构体有很多共同点。共同处在于:
//定义属性用于存储值
//定义方法用于提供功能
//定义下标操作使得可以通过下标语法来访问实例所包含的值
//定义构造器用于生成初始化值
//通过扩展以增加默认实现的功能
//实现协议以提供某种标准功能

//与结构体相比，类还有如下的附加功能:
//继承允许一个类继承另一个类的特征
//类型转换允许在运行时检查和解释一个类实例的类型
//析构器允许一个类实例释放任何其所被分配的资源
//引用计数允许对一个类的多次引用
struct BodyData {
    var height = 170
    var weight = 70
}

class Human {
    var bodyData = BodyData()
    var name: String = "name"
    var age: Int?
}

//类允许继承
class Chinese: Human {
    var province: String?
}

//结构体无法继承
//struct WHCompare:BodyData{}

print("----- 类和结构体的类型 -----")
//结构体是值类型，被赋予一个变量、常量或以参数的形式传递给函数时，会进行复制
//类是引用类型，同样的情况下不会复制

//值类型，传递时拷贝
var hanmei = BodyData()
var lilei = hanmei
print(hanmei)
print(lilei)
lilei.height = 180
print(hanmei)
print(lilei)
//引用类型，传递时不拷贝
var zhangsan = Human()
var lisi = zhangsan
print(zhangsan.name)
print(lisi.name)
lisi.name = "lisi"
print(zhangsan.name)
print(lisi.name)
//恒等符号  ===   !==  表示两个类类型(class)的常量或者变量引用同一个类实例
print(zhangsan === lisi)

print("----- 类和结构体的选择 -----")
//因为结构体有拷贝的特性，及无法被继承，在下列情况下应优先选择结构体
//该数据结构的主要目的是用来封装少量相关简单数据值。
//有理由预计该数据结构的实例在被赋值或传递时，封装的数据将会被拷贝而不是被引用。
//该数据结构中储存的值类型属性，也应该被拷贝，而不是被引用。
//该数据结构不需要去继承另一个既有类型的属性或者行为。

print("----- 字符串、数组、字典类型的赋值与复制 -----")
//OC中 NSString、NSArray和NSDictionary类型在被赋值或者被传入函数或方法时，不会发生值拷贝，而是传递现有实例的引用
//Swift中，String、Array和Dictionary类型均以"结构体的形式"实现。这意味着被赋值给新的常量或变量，或者被传入函数或方法中时，它们的值会被拷贝。
var array1 = [1,2,3]
var array2 = array1
print("array1: \(array1) array2: \(array2)")
array1.remove(at: 0)
print("array1: \(array1) array2: \(array2)")


print("----- 实例方法与类方法 -----")
//实例方法与类方法
class School {
    var schoolName = "schoolName"
    
    func schoolDescription() {
        print("this is a school")
    }
    static func schoolType() {
        print("this is school's type")
    }
}

let school = School()
School.schoolType()
school.schoolDescription()

print("----- 类继承 -----")
//一个类可以继承另一个类的方法，属性和其它特性,当一个类继承其它类时，继承类叫子类，被继承类叫超类
//类可以调用和访问超类的方法，属性和下标，并且可以重写这些方法，属性和下标
//可以为类中继承来的任何存储属性添加属性观察器，当属性值改变时，类就会被通知

class College: School{
    override func schoolDescription() {
        print("this is a college")
    }
    //重写的属性需要通过 set get 的方式来实现
    override var schoolName: String {
        willSet{
            print("willSet " + newValue)
        }
        didSet{
            print(oldValue + " didSet " + schoolName)
        }
    }
}

var college = College()
college.schoolDescription()
college.schoolName = "collegeName"


print("----- 类之间的循环引用与解决 -----")
//当两个类互相持有对方的实例时，会产生强引用，两个对象都无法回收
class Worker {
    var workerID: Int
    var department: Department?
    init(workerID: Int) {
        self.workerID = workerID
    }
    deinit {
        print("Worker is deinit")
    }
}

class Department {
    var departmentID: Int
    var worker: Worker?
    init(departmentID: Int) {
        self.departmentID = departmentID
    }
    deinit {
        print("Department is deinit")
    }
}

var xiaowang: Worker? = Worker(workerID: 12)
var business: Department? = Department(departmentID: 2)

xiaowang!.department = business
business!.worker = xiaowang

//循环引用后，虽然置为nil，但析构函数未调用
xiaowang = nil
business = nil

//采用弱引用(weak)或无主引用(unowned)来解决类之间循环引用的问题
//对于生命周期中会变为 nil 的实例使用弱引用，对于初始化赋值后再也不会被赋值为 nil 的实例，使用无主引用

class Worker2 {
    var workerID: Int
    var department: Department2?
    init(workerID: Int) {
        self.workerID = workerID
    }
    deinit {
        print("Worker2 is deinit")
    }
}

//弱引用 weak只能用于可选类型
class Department2 {
    var departmentID: Int
    weak var worker: Worker2?
    init(departmentID: Int) {
        self.departmentID = departmentID
    }
    deinit {
        print("Department2 is deinit")
    }
}

var xiaohong: Worker2? = Worker2(workerID: 10)
var market: Department2? = Department2(departmentID: 10)
xiaohong!.department = market
market!.worker = xiaohong
//析构函数正常运行
xiaohong = nil
market = nil


//一个引用为可选类型，一个引用为非可选类型
//无主引用只能用于非可选类型
class Worker3 {
    var workerID: Int
//    var department: Department3
    //采用无主引用
    unowned var department: Department3
    init(workerID: Int, department: Department3) {
        self.workerID = workerID
        self.department = department
    }
    deinit {
        print("Worker3 is deinit")
    }
}

class Department3 {
    var departmentID: Int
    //采用弱引用
//    weak var worker: Worker3?
    var worker: Worker3?
    init(departmentID: Int) {
        self.departmentID = departmentID
    }
    deinit {
        print("Department3 is deinit")
    }
}

var technology: Department3? = Department3(departmentID: 10)
var xiaohuang: Worker3? = Worker3(workerID: 10, department: technology!)
technology!.worker = xiaohuang

//析构函数正常运行
xiaohuang = nil
technology = nil


//两个引用均为非可选类型
class Worker4 {
    var workerID: Int
    var department: Department4!
    init(workerID: Int, departmentID: Int) {
        self.workerID = workerID
        self.department = Department4(departmentID: departmentID, worker: self)
    }
    deinit {
        print("Worker4 is deinit")
    }
}

class Department4 {
    var departmentID: Int
//    var worker: Worker4
    unowned var worker: Worker4
    init(departmentID: Int, worker: Worker4) {
        self.departmentID = departmentID
        self.worker = worker
    }
    deinit {
        print("Department4 is deinit")
    }
}

var xiaozhang: Worker4? = Worker4(workerID: 10, departmentID: 5)

//析构函数正常运行
xiaozhang = nil

