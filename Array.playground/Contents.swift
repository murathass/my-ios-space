var sayi = [Int]()
var sayi1 = (1,2,3,4)
sayi1.2
var dizi=[5,4,1,5]
dizi[1]

dizi.append(9)

dizi.count

var strings = ["Ali","Fatma","Dilek","Duygu","Murat"];
var strs:[String]=[]
strs.append("Ali")
strs.append("Fatma")
strings.insert(strs[1], at: 4)
strings.remove(at: 1)
strings.reverse()
strings.removeFirst()

var arr1=Array<Any>(repeatElement(2.1, count: 3));
var arr2=Array<Any>(repeatElement(2.4, count: 3));

var arr3=arr1+arr2

for eleman in arr3
{
    print(eleman);
}

for (index,eleman) in strings.enumerated()
{
    print("\(index+1). eleman = \(eleman)")
}

/// Dictionary (Key-Value)

var diller = ["TR":"Turkce","EN":"Inglısh","FR":"French"]

var count = diller.count

print(count)

for k in diller.keys
{
    print(k)
}

diller["TR"] = nil
diller.remove(at: diller.startIndex) // remove
diller.updateValue("Fransız", forKey: "FR") // update
diller["UK"] = "Ukranie" // delete
diller