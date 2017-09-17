//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let x = ("abc","def");

print(x.1);

var sabit = 1

print(sabit)

sabit = 2

print(sabit)

let sabit1:String = "Swift"

print(sabit1)

print("Ben bu aralar \(sabit1) Ogreniyorum");

var prime = (2,3,5,7)
var (_,_,t,_)=prime;

print(t)

var number = "1234"
var strinber = Int(number)

print(strinber!)

var temp:Int?

temp=432

if temp == nil {
    print("Nil Karaibrahimgil")
}else{
    print("Nil Diil")
}

var name1 = "Murat"
var name2 = "murat"

if name1 == name2 {
    print(name1 + "=" + name2)
}else{
    print(name1 + "!=" + name2)
}


class insan{
    var ad:String?
    var soyad:String?
    var boy:Double?
}

var ins = insan()
ins.ad = "Murat"
ins.soyad = "Has"
ins.boy = 1.78

print(ins.ad!)








