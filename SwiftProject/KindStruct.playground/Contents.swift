import UIKit
var greeting = "Hello, playground"




//类可以定义属性、方法、构造器、下标操作。类使用扩展来扩展功能，遵循协议。类还以继承，运行时检查实例类型。

 class C {
     var p: String
     init(_ p: String) {
         self.p = p
     }
     
     // 下标操作
     subscript(s: String) -> String {
         get {
             return p + s
         }
         set {
             p = s + newValue
         }
     }
 }
 
 let c = C("hi")
 print(c.p)
 print(c[" ming"])
 c["k"] = "v"
 print(c.p)






//结构体是值类型，可以定义属性、方法、构造器、下标操作。结构体使用扩展来扩展功能，遵循协议。



struct S {
    var p1: String = ""
    var p2: Int
}

extension S {
    func f() -> String {
        return p1 + String(p2)
    }
}

var s = S(p2: 1)
s.p1 = "1"
print(s.f()) // 11









//类、结构体或枚举里的变量常量就是他们的属性。

struct K {
    static let sp = "类型属性" // 类型属性通过类型本身访问，非实例访问
    var p1: String = ""
    var p2: Int = 1
    // cp 是计算属性
    var cp: Int {
        get {
            return p2 * 2
        }
        set {
            p2 = newValue + 2
        }
    }
    // 只有 getter 的是只读计算属性
    var rcp: Int {
        p2 * 4
    }
}
print(K.sp)
print(K().cp) // 2
var k = K()
k.cp = 3
print(k.p2) // 5
print(K().rcp) // 4
//willSet 和 didSet 是属性观察器，可以在属性值设置前后插入自己的逻辑处理。

//键路径表达式作为函数

struct KS2 {
    let p1: String
    let p2: Int
}

let ks2 = KS2(p1: "one", p2: 1)
let ks3 = KS2(p1: "two", p2: 2)
let a1 = [ks2, ks3]
let a2 = a1.map(\.p1)
print(a2) // ["one", "two"]

enum E: String {
    case one, two, three
    func showRawValue() {
        print(rawValue)
    }
}

let e = E.three
e.showRawValue() // three

// 可变的实例方法，使用 mutating 标记
struct KC {
    var p: String
    mutating func addFullStopForP() {
        p += "."
    }
}
var kc = KC(p: "hi")
kc.addFullStopForP()
print(kc.p)

// 类方法
class Kw {
    class func cf() {
        print("类方法")
    }
}
//static和class关键字修饰的方法类似 OC 的类方法。static 可以修饰存储属性，而 class 不能；class 修饰的方法可以继承，而 static 不能。在协议中需用 static 来修饰。

//静态下标方法

// 静态下标
struct S2 {
    static var sp = [String: Int]()
    
    static subscript(_ s: String, d: Int = 10) -> Int {
        get {
            return sp[s] ?? d
        }
        set {
            sp[s] = newValue
        }
    }
}

S2["key1"] = 1
S2["key2"] = 2
print(S2["key2"]) // 2
print(S2["key3"]) // 10

//自定义类型中实现了 callAsFunction() 的话，该类型的值就可以直接调用。

// callAsFunction()
struct S3 {
    var p1: String
    
    func callAsFunction() -> String {
        return "show \(p1)"
    }
}
let s2 = S3(p1: "hi")
print(s2()) // show hi



//类能继承另一个类，继承它的方法、属性等。

// 类继承
class C1 {
    var p1: String
    var cp1: String {
        get {
            return p1 + " like ATM"
        }
        set {
            p1 = p1 + newValue
        }
    }
    init(p1: String) {
        self.p1 = p1
    }
    func sayHi() {
        print("Hi! \(p1)")
    }
}

class C2: C1 {
    var p2: String
    init(p2: String) {
        self.p2 = p2
        super.init(p1: p2 + "'s father")
    }
}

C2(p2: "Lemon").sayHi() // Hi! Lemon's father

// 重写父类方法
class C3: C2 {
    override func sayHi() {
        print("Hi! \(p2)")
    }
}

C3(p2: "Lemon").sayHi() // Hi! Lemon

// 重写计算属性
class C4: C1 {
    override var cp1: String {
        get {
            return p1 + " like Out of the blade"
        }
        set {
            p1 = p1 + newValue
        }
    }
}

print(C1(p1: "Lemon").cp1) // Lemon like ATM
print(C4(p1: "Lemon").cp1) // Lemon like Out of the blade
//通过 final 关键字可以防止类被继承，final 还可以用于属性和方法。使用 super 关键字指代父类。
