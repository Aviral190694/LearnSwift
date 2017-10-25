//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//var total = 0
//
//for i in 0...4 {
//    total += i
//}
//print(total)
//
//func returnFifteen() -> Int
//{
//    var y = 10
//    func add()
//    {
//        y += 5
//    }
//    add()
//    return y
//}
//print(returnFifteen())
//
//
//func makeIncrementer() -> ((Int,Int) -> Int) {
//    func addOne(number: Int,number2 : Int) -> Int {
//        return 1 + number + number2
//    }
//    return addOne
//}
//var increment = makeIncrementer()
//increment(7,5)
//
//var numbers = [5,10,15,20]
//
//numbers = numbers.map({ (number : Int) -> Int in
//    let result = number * 3;
//    return result
//})

//numbers.map({$0 * $0})
let names = ["alan","brian","charlie"]
let csv = names.reduce("===") {text, name in "\(text),\(name)"}

//dump(numbers)
