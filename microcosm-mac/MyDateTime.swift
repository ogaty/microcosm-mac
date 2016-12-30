//
//  MyDateTime.swift
//  microcosm
//
//  Created by Yuji Ogata on 2016/12/30.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class MyDateTime: NSObject {
    var year: Int
    var month: Int
    var day: Int
    var hour: Int
    var minute: Int
    var second: Int
    
    override init() {
        year = 2000
        month = 1
        day = 1
        hour = 12
        minute = 0
        second = 0
        super.init()
    }

    func now() -> NSDate {
        return NSDate()
    }

    func getNSDate() -> NSDate {
        let df: DateFormatter = DateFormatter()
        df.locale = NSLocale(localeIdentifier: "ja_JP") as Locale!
        df.dateFormat = "yyyy/MM/dd HH:mm:ss"
        let s: String = NSString(format: "%04d/%02d/%02d %02d:%02d:%02d", year, month, day, hour, minute, second) as String
        return df.date(from: s)! as NSDate
    }
}
