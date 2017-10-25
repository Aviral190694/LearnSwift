//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func test(coordinate: (Int, Int)) -> (Int,Int) {
  var a = coordinate.0
  var b = coordinate.1
  a += 1
  b += 1
//  coordinate.0 += 1
//  coordinate.1 += 1
//  
  return (a,b)
}

var coordinate = (0,0)
var a = test(coordinate: coordinate)
print(a)