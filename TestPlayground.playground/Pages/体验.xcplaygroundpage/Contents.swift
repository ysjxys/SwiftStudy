//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let label = UILabel(frame: CGRect(x:0,y:0,width:100,height:100))
label.textColor = UIColor.red
label.text = "xxx"


let btn = UIButton(type: UIButtonType.contactAdd)
let view = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
view.backgroundColor = UIColor.purple

view.addSubview(btn)
		