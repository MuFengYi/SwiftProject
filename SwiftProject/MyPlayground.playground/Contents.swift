import UIKit
var greeting = "Hello, playground"

let aa  =   "I have +\(7) apples"


let qq  =   """
aa
aaaaaaaaaa
1111111111
7777777777
"""
var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = nil
var greetinga = "Hello!"
if let name = optionalName {
    greetinga = "Hello, \(name)"
}
print(greetinga)



//函数嵌套
func qiantao() -> Int {
    var a   =   1
    let b   =   7
    func add(){
        a   =   a+b
    }
    add()
    
    
    
    return a;
}




qiantao()




//函数闭包 你可以使用 {} 来创建一个匿名闭包。使用 in 将参数和返回值类型的声明与闭包函数体进行分离。




//大括号+参数+返回值类型+in+函数体代码











var bibao   =   {(aa:Int)->Int in
    
    
    return  aa*aa
}

bibao(1024)














var numbers =   [21,17,1,2,3,4,5,6,7];






numbers.map({
    (number:Int)->Int in
   

    
    return number
    
    
    print(number)
})
let mappedNumbers = numbers.map({ number in 3 * number })



print(mappedNumbers)
//对象和类

class Shape {
    var numberOfSides = 0
    
    
    
    
    let aa  =   17
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    
    
    
    
    func haha(qq:String) -> Void {
        print(qq+"\(aa)")
    }
}

var shape   =   Shape()
shape.numberOfSides
shape.simpleDescription()





shape.haha(qq: "177777777qq")



//枚举和结构体 使用 enum 来创建一个枚举。就像类和其他所有命名类型一样，枚举可以包含方法。
enum Rank:Int{
    
    case ac2    =   1;
    case two ,three,four,five,six,seven
    func simpleDescription() -> String {
        switch self {
        case .ac2:
            return "ac2"
        case .two:
            return "two"
        case .three:
            return  "three"
        case .four:
            return  "four"
        case .five:
            return  "five"
        case .six:
            return  "six"
        case .seven:
            return  "seven"
        }
    }
}




let ac2 =   Rank.ac2
let ac2Value    =   ac2.rawValue

enum Suit {
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()

//使用 struct 来创建一个结构体。结构体和类有很多相同的地方，包括方法和构造器。它们之间最大的一个区别就是结构体是传值，类是传引用。
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()


//协议和扩展 使用 protocol 来声明一个协议。类、枚举和结构体都可以遵循协议。


protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}





class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription







//泛型 在尖括号里写一个名字来创建一个泛型函数或者类型。
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result: [Item] = []
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes: 4)
//你也可以创建泛型函数、方法、类、枚举和结构体。
// 重新实现 Swift 标准库中的可选类型
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)






//在类型名后面使用 where 来指定对类型的一系列需求，比如，限定类型实现某一个协议，限定两个类型是相同的，或者限定某个类必须有一个特定的父类。
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Element: Equatable, T.Element == U.Element
{
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [3])


//练习 修改 anyCommonElements(_:_:) 函数来创建一个函数，返回一个数组，内容是两个序列的共有元素。
func anyCommonElementsaa<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) ->Any
    where T.Element: Equatable, T.Element == U.Element
{
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return [1,2,3,5,6,7]
            }
        }
    }
    return [1,2,3,4,5,6,7]
}


anyCommonElementsaa([1,2,3,4,5,6,7], [1,2,3,4,5,6,7])


func haha()->Any{
    return ["111111","77777777"]
}















































































































//集合类型







//继承




