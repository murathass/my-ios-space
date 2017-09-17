//: Playground - noun: a place where people can play

import UIKit

var dateComp = DateComponents( year: 2017, month: 03, day: 12, hour: 11, minute: 13, second: 05)

let current = Calendar.current.date(from: dateComp)

let df = DateFormatter()
df.dateStyle = .medium
df.timeStyle = .medium
df.locale = Locale.init(identifier: "tr-TR")

let dateString = df.string(from: current!)

Date()