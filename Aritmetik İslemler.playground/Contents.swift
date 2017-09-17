//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//var a = 3
//let b = 4
//a = b

//print(a)

var a = 4.0
var b = 9.0

print("\(a + b)")

print("\(a - b)")

print("\(a * b)")

print("\(a/b)")


var str1 = "abc"
var str2 = "abcc"

if(str1 > str2){
    print("\(str1) > \(str2)");
}else{
    print("\(str1) < \(str2)");
}

var name1 = "Murat"
var name2 = "murat"

if name1 == name2 {
    print(name1 + "=" + name2)
}else{
    print(name1 + "!=" + name2)
}

var countString = "Abdulbaki Historia"

print(countString.characters.count)

print(countString[countString.startIndex])

for character in "Dog!🐶".characters {
    print(character)
}

print(countString[countString.index(countString.startIndex,offsetBy: 3)])








