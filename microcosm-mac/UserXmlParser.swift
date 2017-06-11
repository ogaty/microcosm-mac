//
//  UserXmlParser.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/11/05.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class UserXmlParser: NSObject {
    let xmlhead: String = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    let xmltop: String = "<userdata xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\">.+</userdata>"
    let xmlend: String = "</userdata>"
    let usernameStart: String = "  <name>"
    let usernameEnd: String = "</name>"
    let userfuriganaStart: String = "  <furigana>"
    let userfuriganaEnd: String = "</furigana>"
    let userbirthyearStart: String = "  <birth_year>"
    let userbirthyearEnd: String = "</birth_year>"
    let userbirthmonthStart: String = "  <birth_month>"
    let userbirthmonthEnd: String = "</birth_month>"
    let userbirthdayStart: String = "  <birth_day>"
    let userbirthdayEnd: String = "</birth_day>"
    let userbirthhourStart: String = "  <birth_hour>"
    let userbirthhourEnd: String = "</birth_hour>"
    let userbirthminuteStart: String = "  <birth_minute>"
    let userbirthminuteEnd: String = "</birth_minute>"
    let userbirthsecondStart: String = "  <birth_second>"
    let userbirthsecondEnd: String = "</birth_second>"
    let userlatStart: String = "  <lat>"
    let userlatEnd: String = "</lat>"
    let userlngStart: String = "  <lng>"
    let userlngEnd: String = "</lng>"
    let userbirthplaceStart: String = "  <birth_place>"
    let userbirthplaceEnd: String = "</birth_place>"
    let usermemo: String = "  <memo />"
    let usermemoStart: String = "  <memo>"
    let usermemoEnd: String = "</memo>"
    let usertimezoneStart: String = "  <timezone>"
    let usertimezoneEnd: String = "</timezone>"

    func XmlToUser(_ xml: NSString) -> UserData {
        let udata: UserData = UserData()
//        var inUserData: Bool = false
        
        xml.enumerateLines {
            line, stop in
            var tmpLine : String = ""
            if (line == self.xmlhead) {
                tmpLine = line.replacingOccurrences(of: self.xmlhead, with: "")
            } else if (line.contains(self.xmltop)) {
//                inUserData = true
                tmpLine = line.replacingOccurrences(of: self.xmltop, with: "")
            } else if (line.contains(self.xmlend)) {
//                inUserData = false
                tmpLine = line.replacingOccurrences(of: self.xmlend, with: "")
            } else if (line.contains(self.usernameStart)) {
                tmpLine = line.replacingOccurrences(of: self.usernameStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.usernameEnd, with: "")
                udata.name = tmpLine
            } else if (line.contains(self.userfuriganaStart)) {
                tmpLine = line.replacingOccurrences(of: self.userfuriganaStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.userfuriganaEnd, with: "")
                udata.furigana = tmpLine
            } else if (line.contains(self.userbirthyearStart)) {
                tmpLine = line.replacingOccurrences(of: self.userbirthyearStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.userbirthyearEnd, with: "")
                udata.birth_year = (Int)(tmpLine)!
            } else if (line.contains(self.userbirthmonthStart)) {
                tmpLine = line.replacingOccurrences(of: self.userbirthmonthStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.userbirthmonthEnd, with: "")
                udata.birth_month = (Int)(tmpLine)!
            } else if (line.contains(self.userbirthdayStart)) {
                tmpLine = line.replacingOccurrences(of: self.userbirthdayStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.userbirthdayEnd, with: "")
                udata.birth_day = (Int)(tmpLine)!
            } else if (line.contains(self.userbirthhourStart)) {
                tmpLine = line.replacingOccurrences(of: self.userbirthhourStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.userbirthhourEnd, with: "")
                udata.birth_hour = (Int)(tmpLine)!
            } else if (line.contains(self.userbirthminuteStart)) {
                tmpLine = line.replacingOccurrences(of: self.userbirthminuteStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.userbirthminuteEnd, with: "")
                udata.birth_minute = (Int)(tmpLine)!
            } else if (line.contains(self.userbirthsecondStart)) {
                tmpLine = line.replacingOccurrences(of: self.userbirthsecondStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.userbirthsecondEnd, with: "")
                udata.birth_second = (Double)(tmpLine)!
            } else if (line.contains(self.userlatStart)) {
                tmpLine = line.replacingOccurrences(of: self.userlatStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.userlatEnd, with: "")
                udata.lat = (Double)(tmpLine)!
            } else if (line.contains(self.userlngStart)) {
                tmpLine = line.replacingOccurrences(of: self.userlngStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.userlngEnd, with: "")
                udata.lng = (Double)(tmpLine)!
            } else if (line.contains(self.userbirthplaceStart)) {
                tmpLine = line.replacingOccurrences(of: self.userbirthplaceStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.userbirthplaceEnd, with: "")
                udata.birth_place = tmpLine
            } else if (line.contains(self.usermemo)) {
                tmpLine = line
                tmpLine = line.replacingOccurrences(of: self.usermemo, with: "")
                udata.memo = ""
            } else if (line.contains(self.usermemoStart)) {
                tmpLine = line.replacingOccurrences(of: self.usermemoStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.usermemoEnd, with: "")
                udata.memo = tmpLine
            } else if (line.contains(self.usertimezoneStart)) {
                tmpLine = line.replacingOccurrences(of: self.usertimezoneStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.usertimezoneEnd, with: "")
                udata.timezone = tmpLine
            } else {
                tmpLine = line
            }
//            NSLog(tmpLine)
        }
        return udata
    }
    
    func UserToXml(_ udata: UserData) -> String {
        var ret: String = ""
        ret += xmltop
        ret += "\n"
        ret += xmlhead
        ret += "\n"
        ret += usernameStart
        ret += udata.name
        ret += usernameEnd
        ret += "\n"
        ret += userfuriganaStart
        ret += udata.furigana
        ret += userfuriganaEnd
        ret += "\n"
        ret += userbirthyearStart
        ret += (String)(udata.birth_year)
        ret += userbirthyearEnd
        ret += "\n"
        ret += userbirthmonthStart
        ret += (String)(udata.birth_month)
        ret += userbirthmonthEnd
        ret += "\n"
        ret += userbirthdayStart
        ret += (String)(udata.birth_day)
        ret += userbirthdayEnd
        ret += "\n"
        ret += userbirthhourStart
        ret += (String)(udata.birth_hour)
        ret += userbirthhourEnd
        ret += "\n"
        ret += userbirthminuteStart
        ret += (String)(udata.birth_minute)
        ret += userbirthminuteEnd
        ret += "\n"
        ret += userbirthsecondStart
        ret += (String)(udata.birth_second)
        ret += userbirthsecondEnd
        ret += "\n"
        ret += userbirthsecondStart
        ret += (String)(udata.birth_second)
        ret += userbirthsecondEnd
        ret += "\n"
        ret += userlatStart
        ret += (String)(udata.lat)
        ret += userlatEnd
        ret += "\n"
        ret += userlngStart
        ret += (String)(udata.lng)
        ret += userlngEnd
        ret += "\n"
        ret += userbirthplaceStart
        ret += udata.birth_place
        ret += userbirthplaceEnd
        ret += "\n"
        ret += usermemoStart
        ret += udata.memo
        ret += usermemoEnd
        ret += "\n"
        ret += usertimezoneStart
        ret += udata.timezone
        ret += usertimezoneEnd
        ret += "\n"
        ret += xmlend
        ret += "\n"
        
        return ret
    }

    func FileToUser(_ filePath: String) -> UserData? {
        let udata: UserData = UserData()
        // var inUserData: Bool = false
        let url: NSURL = NSURL(fileURLWithPath: filePath)
        var text: NSString
        do {
            text = try NSString(contentsOf: url as URL, encoding: String.Encoding.utf8.rawValue)
        } catch let error as NSError {
            NSLog(error.localizedDescription)
            return nil
        }
        
        text.enumerateLines {
            line, stop in
            var tmpLine : String = ""
            if (line == self.xmlhead) {
                tmpLine = line.replacingOccurrences(of: self.xmlhead, with: "")
            } else if (line.contains(self.xmltop)) {
//                inUserData = true
                tmpLine = line.replacingOccurrences(of: self.xmltop, with: "")
            } else if (line.contains(self.xmlend)) {
//                inUserData = false
                tmpLine = line.replacingOccurrences(of: self.xmlend, with: "")
            } else if (line.contains(self.usernameStart)) {
                tmpLine = line.replacingOccurrences(of: self.usernameStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.usernameEnd, with: "")
                udata.name = tmpLine
            } else if (line.contains(self.userfuriganaStart)) {
                tmpLine = line.replacingOccurrences(of: self.userfuriganaStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.userfuriganaEnd, with: "")
                udata.furigana = tmpLine
            } else if (line.contains(self.userbirthyearStart)) {
                tmpLine = line.replacingOccurrences(of: self.userbirthyearStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.userbirthyearEnd, with: "")
                udata.birth_year = (Int)(tmpLine)!
            } else if (line.contains(self.userbirthmonthStart)) {
                tmpLine = line.replacingOccurrences(of: self.userbirthmonthStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.userbirthmonthEnd, with: "")
                udata.birth_month = (Int)(tmpLine)!
            } else if (line.contains(self.userbirthdayStart)) {
                tmpLine = line.replacingOccurrences(of: self.userbirthdayStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.userbirthdayEnd, with: "")
                udata.birth_day = (Int)(tmpLine)!
            } else if (line.contains(self.userbirthhourStart)) {
                tmpLine = line.replacingOccurrences(of: self.userbirthhourStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.userbirthhourEnd, with: "")
                udata.birth_hour = (Int)(tmpLine)!
            } else if (line.contains(self.userbirthminuteStart)) {
                tmpLine = line.replacingOccurrences(of: self.userbirthminuteStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.userbirthminuteEnd, with: "")
                udata.birth_minute = (Int)(tmpLine)!
            } else if (line.contains(self.userbirthsecondStart)) {
                tmpLine = line.replacingOccurrences(of: self.userbirthsecondStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.userbirthsecondEnd, with: "")
                udata.birth_second = (Double)(tmpLine)!
            } else if (line.contains(self.userlatStart)) {
                tmpLine = line.replacingOccurrences(of: self.userlatStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.userlatEnd, with: "")
                udata.lat = (Double)(tmpLine)!
            } else if (line.contains(self.userlngStart)) {
                tmpLine = line.replacingOccurrences(of: self.userlngStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.userlngEnd, with: "")
                udata.lng = (Double)(tmpLine)!
            } else if (line.contains(self.userbirthplaceStart)) {
                tmpLine = line.replacingOccurrences(of: self.userbirthplaceStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.userbirthplaceEnd, with: "")
                udata.birth_place = tmpLine
            } else if (line.contains(self.usermemo)) {
                tmpLine = line
                tmpLine = line.replacingOccurrences(of: self.usermemo, with: "")
                udata.memo = ""
            } else if (line.contains(self.usermemoStart)) {
                tmpLine = line.replacingOccurrences(of: self.usermemoStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.usermemoEnd, with: "")
                udata.memo = tmpLine
            } else if (line.contains(self.usertimezoneStart)) {
                tmpLine = line.replacingOccurrences(of: self.usertimezoneStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.usertimezoneEnd, with: "")
                udata.timezone = tmpLine
            } else {
                tmpLine = line
            }
            //            NSLog(tmpLine)
        }
        return udata
    }
    
    func trim(text: String) -> String {
        return String(text.characters.filter {$0 != " "})
    }
}
