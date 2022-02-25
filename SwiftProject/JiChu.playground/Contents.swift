import UIKit
var greeting = "Hello, playground"




//数字的类型有 Int、Float 和 Double

// Int
let i1 = 100
let i2 = 22
print(i1 / i2) // 向下取整得 4

// Float
let f1: Float = 100.0
let f2: Float = 22.0
print(f1 / f2) // 4.5454545

let f3: Float16 = 5.0 // macOS 还不能用
let f4: Float32 = 5.0
let f5: Float64 = 5.0
let f6: Float80 = 5.0
print(f4, f5, f6) // 5.0 5.0 5.0

// Double
let d1: Double = 100.0
let d2: Double = 22.0
print(d1 / d2) // 4.545454545454546

// 字面量
print(Int(0b10101)) // 0b 开头是二进制
print(Int(0x00afff)) // 0x 开头是十六进制
print(2.5e4) // 2.5x10^4 十进制用 e
print(0xAp2) // 10*2^2  十六进制用 p
print(2_000_000) // 2000000

// isMultiple(of:) 方法检查一个数字是否是另一个数字的倍数
let i3 = 36
print(i3.isMultiple(of: 9)) // true
//处理数字有 floor、ceil、round。floor 是向下取整，只取整数部分；cell 是向上取整，只要有不为零的小数，整数就加1;round 是四舍五入。
//布尔数有 true 和 false 两种值，还有一个能够切换这两个值的 toggle 方法。

var b = false
b.toggle() // true
b.toggle() // false

//元组里的值类型可以是不同的。元组可以看成是匿名的结构体。

let t1 = (p1: 1, p2: "two", p3: [1,2,3])
print(t1.p1)
print(t1.p3)

// 类型推导
let t2 = (1, "two", [1,2,3])

// 通过下标访问
print(t2.1) // two

// 分解元组
let (dp1, dp2, _) = t2
print(dp1)
print(dp2)

let s1 = "Hi! This is a string. Cool?"

/// 转义符 \n 表示换行。
/// 其它转义字符有 \0 空字符)、\t 水平制表符 、\n 换行符、\r 回车符
let s2 = "Hi!\nThis is a string. Cool?"

// 多行
let s3 = """
Hi!
This is a string.
Cool?
"""

// 长度
print(s3.count)
print(s3.isEmpty)

// 拼接
print(s3 + "\nSure!")

// 字符串中插入变量
let i = 1
print("Today is good day, double \(i)\(i)!")

/// 遍历字符串
/// 输出：
/// o
/// n
/// e
for c in "one" {
    print(c)
}

// 查找
print(s3.lowercased().contains("cool")) // true

// 替换
let s4 = "one is two"
let newS4 = s4.replacingOccurrences(of: "two", with: "one")
print(newS4)

// 删除空格和换行
let s5 = " Simple line. \n\n  "
print(s5.trimmingCharacters(in: .whitespacesAndNewlines))

// 切割成数组
let s6 = "one/two/three"
let a1 = s6.components(separatedBy: "/") // 继承自 NSString 的接口
print(a1) // ["one", "two", "three"]

let a2 = s6.split(separator: "/")
print(a2) // ["one", "two", "three"] 属于切片，性能较 components 更好

// 判断是否是某种类型
let c1: Character = "🤔"
print(c1.isASCII) // false
print(c1.isSymbol) // true
print(c1.isLetter) // false
print(c1.isNumber) // false
print(c1.isUppercase) // false

// 字符串和 Data 互转
let data = Data("hi".utf8)
let s7 = String(decoding: data, as: UTF8.self)
print(s7) // hi

// 字符串可以当作集合来用。
let revered = s7.reversed()
print(String(revered))
//Unicode、Character 和 SubString 等内容参见官方字符串文档：Strings and Characters — The Swift Programming Language (Swift 5.1)
//字符串字面符号可以参看《String literals in Swift》。


//原始字符串



// 原始字符串在字符串前加上一个或多个#符号。里面的双引号和转义符号将不再起作用了，如果想让转义符起作用，需要在转义符后面加上#符号。
let s8 = #"\(s7)\#(s7) "one" and "two"\n. \#nThe second line."#
print(s8)
/// \(s7)hi "one" and "two"\n.
/// The second line.

// 原始字符串在正则使用效果更佳，反斜杠更少了。
let s9 = "\\\\[A-Z]+[A-Za-z]+\\.[a-z]+"
let s10 = #"\\[A-Z]+[A-Za-z]+\.[a-z]+"#
print(s9) // \\[A-Z]+[A-Za-z]+\.[a-z]+
print(s10) // \\[A-Z]+[A-Za-z]+\.[a-z]+


//Swift的枚举有类的一些特性，比如计算属性、实例方法、扩展、遵循协议等等。

enum E1:String, CaseIterable {
    case e1, e2 = "12"
}

// 关联值
enum E2 {
    case e1([String])
    case e2(Int)
}
let e1 = E2.e1(["one","two"])
let e2 = E2.e2(3)

switch e1 {
case .e1(let array):
    print(array)
case .e2(let int):
    print(int)
}
print(e2)

// 原始值
print(E1.e1.rawValue)

// 遵循 CaseIterable 协议可迭代
for ie in E1.allCases {
    print("show \(ie)")
} 

// 递归枚举
enum RE {
    case v(String)
    indirect case node(l:RE, r:RE)
}

let lNode = RE.v("left")
let rNode = RE.v("right")
let pNode = RE.node(l: lNode, r: rNode)

switch pNode {
case .v(let string):
    print(string)
case .node(let l, let r):
    print(l,r)
    switch l {
    case .v(let string):
        print(string)
    case .node(let l, let r):
        print(l, r)
    }
    switch r {
    case .v(let string):
        print(string)
    case .node(let l, let r):
        print(l, r)
    }
}
//@unknown 用来区分固定的枚举和可能改变的枚举的能力。@unknown 用于防止未来新增枚举属性会进行提醒提示完善每个 case 的处理。

// @unknown
enum E3 {
    case e1, e2, e3
}

func fe1(e: E3) {
    switch e {
    case .e1:
        print("e1 ok")
    case .e2:
        print("e2 ok")
    case .e3:
        print("e3 ok")
    @unknown default:
        print("not ok")
    }
}
//符合 Comparable 协议的枚举可以进行比较。

// Comparable 枚举比较
enum E4: Comparable {
    case e1, e2
    case e3(i: Int)
    case e4
}
let e3 = E4.e4
let e4 = E4.e3(i: 3)
let e5 = E4.e3(i: 2)
let e6 = E4.e1
print(e3 > e4) // true
let m1 = [e3, e4, e5, e6]
let m2 = m1.sorted()
for i in m2 {
    print(i.self)
}
/// e1
/// e3(i: 2)
/// e3(i: 3)
/// e4

//泛型可以减少重复代码，是一种抽象的表达方式。where 关键字可以对泛型做约束。

func fn<T>(p: T) -> [T] {
    var r = [T]()
    r.append(p)
    return r
}
print(fn(p: "one"))

// 结构体
struct S1<T> {
    var arr = [T]()
    mutating func add(_ p: T) {
        arr.append(p)
    }
}

var struct1 = S1(arr: ["zero"])
struct1.add("one")
struct1.add("two")
print(struct1.arr) // ["zero", "one", "two"]
//关联类型

protocol pc {
    associatedtype T
    mutating func add(_ p: T)
}

struct S2: pc {
    typealias T = String // 类型推导，可省略
    var strs = [String]()
    mutating func add(_ p: String) {
        strs.append(p)
    }
}
//泛型适用于嵌套类型

struct S3<T> {
    struct S4 {
        var p: T
    }
    
    var p1: T
    var p2: S4
}








let fanxing1 = S3(p1: 1, p2: S3.S4(p: 3))








let fanxing2 = S3(p1: "one", p2: S3.S4(p: "three"))
print(fanxing1,fanxing2)




//不透明类型会隐藏类型，让使用者更关注功能。不透明类型和协议很类似，不同的是不透明比协议限定的要多，协议能够对应更多类型。

protocol P {
    func f() -> String
}
struct Fx1: P {
    func f() -> String {
        return "one\n"
    }
}
struct Fx2<T: P>: P {
    var p: T
    func f() -> String {
        return p.f() + "two\n"
    }
}
struct Fx3<T1: P, T2: P>: P {
    var p1: T1
    var p2: T2
    func f() -> String {
        return p1.f() + p2.f() + "three\n"
    }
}
func someP() -> some P {
    return Fx3(p1: Fx1(), p2: Fx2(p: Fx1()))
}

let r = someP()
print(r.f())
//函数调用者决定返回什么类型是泛型，函数自身决定返回什么类型使用不透明返回类型。
//Result 类型用来处理错误，特别适用异步接口的错误处理。

extension URLSession {
    func dataTaskWithResult(
        with url: URL,
        handler: @escaping (Result<Data, Error>) -> Void
    ) -> URLSessionDataTask {
        dataTask(with: url) { data, _, err in
            if let err = err {
                handler(.failure(err))
            } else {
                handler(.success(data ?? Data()))
            }
        }
    }
}

let url = URL(string: "https://ming1016.github.io/")!

// 以前网络请求
let rt1 = URLSession.shared.dataTask(with: url) {
    data, _, error in
    if let err = error {
        print(err)
    } else if let data = data {
        print(String(decoding: data, as: UTF8.self))
    }
}
rt1.resume()

// 使用 Result 网络请求
let rt2 = URLSession.shared.dataTaskWithResult(with: url) { result in
    switch result {
    case .success(let data):
        print(String(decoding: data, as: UTF8.self))
    case .failure(let err):
        print(err)
    }
}











rt2.resume()




//使用 is 关键字进行类型判断， 使用as 关键字来转换成子类。

class Lx {}
class Lx1: Lx {}
class Lx2: Lx {}

var a = [Lx]()
a.append(Lx1())
a.append(Lx2())
for e in a {
    // 类型判断
    if e is Lx1 {
        print("Type is S1")
    } else if e is Lx2 {
        print("Type is S2")
    }
    // 使用 as 关键字转换成子类
    if let lx1 = e as? Lx1 {
        print("As S1 \(lx1)")
    } else if let lx2 = e as? Lx2 {
        print("As S2 \(lx2)")
    }
}
