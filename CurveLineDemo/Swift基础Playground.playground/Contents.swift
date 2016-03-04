//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print("Hello World! Hello Swift! 世界你好，雨燕你好")
let 北京到上海距离:Int

北京到上海距离 = 1500


let 地球到月亮的距离 = 380_000

- Double.infinity

Double.NaN


let x = 3
let y = 0.14
let z = Double(x) + y

typealias 整型 = Int
整型(1.0123)

//元组

let xx = (a:"A", b:"B", c:"C")

xx.a
xx.2

var (a,b,c) = (3,4,5)
a
b
c

(a,b,c) = (c,b,a)
a
b
c


var sex : Bool? = true
//只有可选的才能与nil比较
if sex == nil {
    print("没有选择性别")
}else{
    print("选择了性别")
}


//拆包的时候要知道变量是否有值
if sex! == true {
    print("mmm")
}


var sex1 : Bool? = false

//可选绑定 检查判断是否为nil 格式if let临时常量 = 可选变量{}
if let sex2 = sex1 {
    
}else{
print("用户没有选择性别")
}
//多重绑定
var addr: String? = "上海市"
if let sex1 = sex1, addr = addr {
    print(sex1,addr)
}else{
    print("用户性别和地址不完善不符合")
}
//绑定判断  加where
if let sex1 = sex1, addr = addr where !sex1 && addr == "上海市" {
    print(addr, "的美女包邮哦")
}else{
    print("用户性别和地址不完善不符合")
}


var isNetwork: Bool = true

assert(isNetwork,"网络不通")



//可选空🈴操作符
var 午饭 : String?

午饭 = "年糕"
//两个问号只对可选类型有效
let 吃什么 = 午饭 ?? "没东西吃,好可怜"

var 一加一百的结果 = 0

for x in 1...100 {
    一加一百的结果 += x
}
一加一百的结果



var  m = "mmm"

if !m.isEmpty {
    print("通过")
}

//使用单个字符要写类型 否则会变成字符串
let e : Character = "A"
let f :Character = "小"

let g = "小波说雨燕"

for x in g.characters {
    if x == f {
       print("找到")
    }
}



var h = "波"
//字符串加字符串
h += g
//字符串加字符
h.append(e)

//字符串插值 \()
var name = "小波说雨燕"
let time = "2016.02.25"
let 票价 = 15.5

let 订票提示 = "旅客\(name)先生,您在\(time)订购了车票\(票价 * 2)元"

//successor后一个  predecessor前一个  advancedBy向前进位  indices 索引的区间相当于range
name.startIndex
name.endIndex
name[name.startIndex]
name[name.endIndex.predecessor()]
name[name.startIndex.successor().predecessor()]
name[name.startIndex.advancedBy(2)]
name[name.endIndex.advancedBy(-2)]
name.characters.indices

for a in name.characters.indices {
    print(a)
//    print(name[a])
//    print(name[a], separator: "", terminator: "--")
}

//插入删除
name.insert("!", atIndex: name.endIndex)
let i = "之Swift"
name.insertContentsOf(i.characters, at: name.endIndex.predecessor())

name.removeAtIndex(name.endIndex.predecessor())
name

let  范围 = name.endIndex.advancedBy(-(i.characters.count))..<name.endIndex

name.removeRange(范围)

//检查字符串是否包含特定前后缀
 let v = "小波说雨燕 之 Swift 2!"
let l = "小波说雨燕 之 iOS9闪电开发!"

let k = "小波说雨燕"
let u = "!"

v.hasPrefix(k)
l.hasPrefix(k)

v.hasSuffix(u)
v.hasSuffix(u)

var  数组: [String] = Array<String>()
var 京沪高铁 = ["1","2","3"]
var 沪杭高铁 = ["4", "5", "6"]
沪杭高铁.insert("郑州", atIndex: 1)
沪杭高铁.insertContentsOf(["开封", "商丘"], at: 2)
沪杭高铁.removeRange((0...3))
沪杭高铁.contains("5")



京沪高铁 += 沪杭高铁
var xcv = Array(1...100)

var cxv = Array<String>()
let  牛奶 = [String]()
xcv.removeRange(0...5)
xcv.append(1)
xcv.appendContentsOf((101...150))

var 集合:Set = ["q", "w", "e", "r", "r"]
var 集合2:Set = Set<String>()
集合.insert("y")
集合.remove("y")
集合.contains("y")
//对集合进行排序
let 排序 = 集合.sort()


//字典
var 字典:Dictionary<String,String> = ["sgyy":"三国演义"]
字典["shz"] = "水浒传"
字典.updateValue("水浒传2", forKey: "shz")
字典.removeValueForKey("shz")
字典["shz"] = "水浒传"
字典["xyj"] = "西游记"
for (key, value) in 字典 {
print("键:\(key)值:\(value)")
}


for _ in 1...5 {
    print("出来")
}



