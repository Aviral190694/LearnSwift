//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func greet(_ person: String, on day: String) -> String {
  
  return "Hello \(person), today is \(day)."
  
}

//greet(person: "Aviral", day: "Monday")
//greet("Aviral", on: "Monday")

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
  
  var min = scores[0]
  var max = scores[0]
  var sum = 0
  
  for score in scores {
    
    if score > max {
      
      max = score
      
    } else if score < min {
      
      min = score
      
    }
    
    sum += score
    
  }
  
  return (min,max,sum)
  
}

//let stats = calculateStatistics(scores: [5,3,100,3,9])
//print(stats.sum)
//print(stats.2)

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
  
  for item in list {
    
    if condition(item) {
      
      return true
      
    }
    
  }
  
  return false
  
}

func lessThanTen(number: Int) -> Bool {
  
  return number < 10
  
}

//hasAnyMatches(list: [20,19,7,12], condition: lessThanTen)

//let numbers = [10,2,3,12,35,11]
//let sorted = numbers.sorted { $0 < $1 }
//print(sorted)
//print(numbers.sorted())

//let mapped = numbers.map({ (number: Int) -> Int in
//  let result = number * 3
//  return result
//})
//let mapped = numbers.map { number in number * 3 }
//let mapped = numbers.map { $0 * 3 }
//print(mapped)

class NamedShape {
  
  var numberOfSides: Int = 0
  var name: String
  
  func simpleDescription() -> String {
    return "A Shape with \(numberOfSides) number of sides."
  }
  
  init(name: String) {
    self.name = name
  }
  
}

class Square: NamedShape {
  
  var sideLength : Double
  
  init(sideLength: Double, name: String) {
    self.sideLength = sideLength
    super.init(name: name)
    numberOfSides = 4
  }
  
  func area() -> Double {
    return sideLength * sideLength
  }
  
  override func simpleDescription() -> String {
    return "A Square with side of length \(sideLength)."
  }
  
}

//let test = Square(sideLength: 5.1, name: "Avi")
//test.area()
//test.simpleDescription()


enum Rank : Int {
  
  case ace = 1
  case two, three, four, five, six, seven, eight, nine, ten
  case jack, queen, king
  
  func simpleDescription() -> String {
    switch self {
    case .ace:
      return "ace"
      
    case .jack:
      return "jack"
      
    case .queen:
      return "queen"
      
    case .king:
      return "king"
      
    default:
      return String(self.rawValue)
      
    }
  }
  
}

enum Suit {
  case spades, hearts, clubs, diamonds
  
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

struct Cards {
  var rank : Rank
  var suit : Suit
  
  func sampleDescription() -> String {
    return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    
  }
  
  func fullDeck() -> [Cards] {
    var pack: [Cards] = []
    var suits = [Suit.clubs,Suit.diamonds,Suit.hearts,Suit.spades]
    
    for suit in suits {
      for i in 1...13 {
        pack.append(Cards(rank: Rank.init(rawValue: i)!, suit: suit))
      }
    }
    return pack
  }
  
}
//
//let threeOfSpades = Cards(rank: Rank.three, suit: Suit.spades)
//threeOfSpades.sampleDescription()
//dump(threeOfSpades.fullDeck())


protocol ExampleProtocol {
  var simpleDescription: String { get }
  mutating func adjust()
}

class SimpleClass: ExampleProtocol {
  var simpleDescription: String = "A very simple class"
  var anotherProperty: Int = 69012
  
   func adjust() {
    simpleDescription += " 100% adjusted"
  }
  
}

//var a = SimpleClass()
//a.simpleDescription
//a.adjust()
//a.simpleDescription


struct SimpleStruct: ExampleProtocol {
  var simpleDescription: String = "A very simple class"
  var anotherProperty: Int = 69012
  mutating func adjust() {
    simpleDescription += " 100% adjusted"
  }
}
//var b = SimpleStruct()
//b.simpleDescription
//b.adjust()
//b.simpleDescription

extension Int: ExampleProtocol {
  mutating func adjust() {
    self += 47
  }

  var simpleDescription: String {
    return "The number \(self)"
  }
  
  
}

//print(7.simpleDescription)
//var test: Int = 7
//test.adjust()

extension Double {
  var abs: Double {
    get {
      if self < 0 {
        return self * -1
      }
      return self
    }
  }
}
//
//var val: Double = -20.3
//val.abs
//
//let protocolValue: ExampleProtocol = a
//print(protocolValue.simpleDescription)
// protocolValue.anotherProperty

enum PrintedError: Error {
  case outOfPaper
  case noToner
  case onFire
}

class SomeTextStorage: NSTextStorage {
  
  private var storage = NSTextStorage()
  
  // MARK: NSTextStorage Primitive Methods
  // https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/TextStorageLayer/Tasks/Subclassing.html
  
  override var string: String {
    return storage.string
  }
  
  override func attributes(at location: Int, effectiveRange range: NSRangePointer?) -> [String : Any] {
    return storage.attributes(at: location, effectiveRange: range)
  }
  
  override func replaceCharacters(in range: NSRange, with str: String) {
    beginEditing()
    storage.replaceCharacters(in: range, with: str)
    edited(.editedCharacters, range: range, changeInLength: (str as NSString).length - range.length)
    endEditing()
  }
  
  override func setAttributes(_ attrs: [String : Any]?, range: NSRange) {
    beginEditing()
    storage.setAttributes(attrs, range: range)
    edited(.editedAttributes, range: range, changeInLength: 0)
    endEditing()
  }
  
  
}



let textStore = SomeTextStorage()



