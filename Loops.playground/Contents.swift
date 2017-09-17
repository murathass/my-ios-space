//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var  i = 1

for i in 1...5{
    print(i)
}

while i <= 5{
    print(i);
    i=i+1;
}

func sayHi(){
    print("Hi")
}
sayHi()

func toplama(a:Int,b:Int)-> Int
{
    return (a+b)
}

var t = toplama(a: 7,b: 4)

print(t)


func charCount(yazi:String)->Int
{
    return yazi.characters.count
}

print(charCount(yazi: "Bismillahirrahmanirrahim"))


func getMaxMin(array:[Int])->(min:Int, max:Int)
{
    var currentMin = array[0];
    var currentMax = array[0];
    
    for k in array[1..<array.count]
    {
        if(currentMin > k){
            currentMin = k
        }
        
        if(currentMax < k){
            currentMax = k
        }
    }
    
    return (currentMin,currentMax)
}

var arr = [1,-123,12,54,12,-1,4]

getMaxMin(array: arr)


//Enumaration aynı tipteki benzer yapıların gruplamasında kullanılan güzel bir yapı

enum Yonler
    
{
    
    case dogu
    
    case bati
    
    case kuzey
    
    case guney
    
}

enum Gezegenler
    
{
    
    case merkur, venus, dunya, mars, jupiter, saturn, uranus, neptun
    
}

var evinCephesi = Yonler.bati //uzun gösterim

evinCephesi = .guney // kısa gösterim

enum Barcode{
    
    case upc(Int,Int,Int,Int) // tekboyutlu
    
    case qrCode(String) // iki boyutlu
    
}

var normalBarkod = Barcode.upc(22, 1234, 0, 536)

var kareKod = Barcode.qrCode("Türkçe Swift Programlama")





