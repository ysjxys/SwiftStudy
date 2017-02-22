//: [Previous](@previous)

import Foundation

print("----- 枚举语法 -----")
// 在Swift 中，枚举类型是一等(first-class)类型。具有很多与类相似的特性，例如计算型属性(computed properties)，用于提供枚举值的附加信息，实例方法(instance methods)，用于提供和枚举值相关联的功能。枚举也可以定义构造函数(initializers)来提供一个初始值;可以在原始实现的基础上扩展它们的功能;还可以遵守协议(protocols)来提供标准的功能
// Swift的枚举成员在被创建时不会被赋予一个默认的值。这些枚举成员本身 就是完备的值，这些值的类型是已经明确定义好的 CompassPoint 类型
enum Season{
    case Spring
    case Summer
    case Autumn
    case Winter
}

print("----- 结合switch语句进行匹配 -----")
//switch 必须穷尽枚举的所有类型，或用default为其余值设置默认返回值
var season = Season.Spring

func seasonInfo(season: Season) -> Void{
    switch season {
    case .Spring:
        print("month 1、2、3")
    case .Summer:
        print("month 4、5、6")
    case .Autumn:
        print("month 7、8、9")
        //    case .Winter:
    //        print("month 10、11、12")
    default:
        print("not spring or summer or autumn")
    }
}
seasonInfo(season: season)
season = Season.Winter
seasonInfo(season: season)

print("----- 关联值 -----")
//swift内的各个枚举类型还可以与其他不同类型的值进行关联,并赋予其各自的值
enum SchoolPeople {
    case teacher(subject: String, teacherID: Int)
    case student(grade: Int, gradeClass:Int, studentID: Int)
}

let jay = SchoolPeople.student(grade: 3, gradeClass: 2, studentID: 18)
let wang = SchoolPeople.teacher(subject: "Math", teacherID: 12)

//可以在switch中使用关联枚举对象的关联值，根据情况对关联值赋予变量（var）或常量（let）的标识符，还可对其进行修改
func schoolPeopleInfo(people: SchoolPeople){
    switch people {
    case .student(let grade, let gradeClass, var studentID):
        studentID = 100
        print("grade:\(grade)  gradeClass:\(gradeClass)  studentID:\(studentID)")
    case let .teacher(subject, teacherID):
        print("subject:\(subject)  teacherID:\(teacherID)")
    }
}
schoolPeopleInfo(people: jay)
schoolPeopleInfo(people: wang)

print("----- rawValue -----")
//枚举成员可以被赋予默认初始值，以case.rawValue的形式调用,赋予初始值前需要明确指明case的值类型
enum Gender: String{
    case male = "男"
    case female = "女"
}
print(Gender.male.rawValue)
print(Gender.female.rawValue)

//隐式赋值：当枚举对象类型为整数或字符串时，系统会自动为其赋默认值
//String的默认值为case本身
enum Gender2: String{
    case male
    case female
}
print(Gender2.male.rawValue)
print(Gender2.female.rawValue)

//整数的默认值为从0开始递增的数
enum ComputerNum: Int{
    case falseNum
    case trueNum
}
print(ComputerNum.trueNum.rawValue)
print(ComputerNum.falseNum.rawValue)

//相反，也可以通过rawValue获得case
let computerNum1 = ComputerNum(rawValue: 1)
let genderMale = Gender(rawValue: "男")
let gender2Female = Gender2(rawValue: "female")

print("----- 引用类型or值类型 -----")
// 枚举为值类型，且Swift中，所有的基本类型：整数(Integer)、浮点数(floating-point)、布尔值(Booleans)、字符串(string)、数组(array)和字典(dictionaries)，都是值类型，并且都是以结构体的形式在后台所实现
//值类型具有诸多优点，如值类型的实例，以及实例中所包含的任何值类型属性，在代码中传递的时候都会被复制，不会存在OC中因浅拷贝等而引起的问题




