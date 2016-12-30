//
//  DatepickHelper.swift
//  microcosm
//
//  Created by Yuji Ogata on 2016/12/30.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class DatepickHelper: NSObject {
    var p: NSDatePicker = NSDatePicker()
    
    init (_ pick: NSDatePicker) {
        p = pick
    }
    
    func getMyDateTime() -> MyDateTime {
        let d: MyDateTime = MyDateTime()
        let input: NSDate = p.dateValue as NSDate
        let cal: NSCalendar = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!
        d.year = cal.components(.year, from: input as Date).year!
        d.month = cal.components(.month, from: input as Date).month!
        d.day = cal.components(.day, from: input as Date).day!
        d.hour = cal.components(.hour, from: input as Date).hour!
        d.minute = cal.components(.minute, from: input as Date).minute!
        d.second = cal.components(.second, from: input as Date).second!
        
        return d
    }
    
    func getYear() -> Int {
        let input: NSDate = p.dateValue as NSDate
        let cal: NSCalendar = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!
        let year: Int = cal.components(.year, from: input as Date).year!

        return year
    }

    func getMonth() -> Int {
        let input: NSDate = p.dateValue as NSDate
        let cal: NSCalendar = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!
        let month: Int = cal.components(.month, from: input as Date).month!

        return month
    }

    func getDay() -> Int {
        let input: NSDate = p.dateValue as NSDate
        let cal: NSCalendar = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!
        let day: Int = cal.components(.day, from: input as Date).day!
        
        return day
    }
    
    func getHour() -> Int {
        let input: NSDate = p.dateValue as NSDate
        let cal: NSCalendar = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!
        let hour: Int = cal.components(.hour, from: input as Date).hour!
        
        return hour
    }
    
    func getMinute() -> Int {
        let input: NSDate = p.dateValue as NSDate
        let cal: NSCalendar = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!
        let minute: Int = cal.components(.minute, from: input as Date).minute!
        
        return minute
    }
    
    func getSecond() -> Int {
        let input: NSDate = p.dateValue as NSDate
        let cal: NSCalendar = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!
        let second: Int = cal.components(.second, from: input as Date).second!
        
        return second
    }
    
}
