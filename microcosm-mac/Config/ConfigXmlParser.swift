//
//  configXmlParse.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/10/07.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class ConfigXmlParser: NSObject {
    let xmlhead: String = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    let xmltop: String = "<ConfigData xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\">"
    let xmlend: String = "</ConfigData>"

    let ephepathStart: String = "  <ephepath>"
    let ephepathEnd: String = "</ephepath>"
    let centricStart: String = "  <centric>"
    let centricEnd: String = "</centric>"
    let siderealStart: String = "  <sidereal>"
    let siderealEnd: String = "</sidereal>"
    let placeStart: String = "  <defaultPlace>"
    let placeEnd: String = "</defaultPlace>"
    let latStart: String = "  <lat>"
    let latEnd: String = "</lat>"
    let lngStart: String = "  <lng>"
    let lngEnd: String = "</lng>"
    let timezoneStart: String = "  <defaultTimezone>"
    let timezoneEnd: String = "</defaultTimezone>"
    let progressionStart: String = "  <progression>"
    let progressionEnd: String = "</progression>"
    let bandsStart: String = "  <defaultbands>"
    let bandsEnd: String = "</defaultbands>"
    let houseStart: String = "  <house>"
    let houseEnd: String = "</house>"
    let zodiacOuterWidthStart: String = "  <zodiacOuterWidth>"
    let zodiacOuterWidthEnd: String = "</zodiacOuterWidth>"
    let zodiacWidthStart: String = "  <zodiacWidth>"
    let zodiacWidthEnd: String = "</zodiacWidth>"
    let zodiacCenterStart: String = "  <zodiacCenter>"
    let zodiacCenterEnd: String = "</zodiacCenter>"
    let decimalDispStart: String = "  <decimalDisp>"
    let decimalDispEnd: String = "</decimalDisp>"
    let dispPatternStart: String = "  <dispPattern>"
    let dispPatternEnd: String = "</dispPattern>"
    
    func XmlToUser(_ xml: NSString) -> ConfigData {
        let config: ConfigData = ConfigData()
        var inUserData: Bool = false
        
        xml.enumerateLines {
            line, stop in
            var tmpLine : String = ""
            if (line == self.xmlhead) {
                tmpLine = line.replacingOccurrences(of: self.xmlhead, with: "")
            } else if (line.contains(self.xmltop)) {
                inUserData = true
                tmpLine = line.replacingOccurrences(of: self.xmltop, with: "")
            } else if (line.contains(self.xmlend)) {
                inUserData = false
                tmpLine = line.replacingOccurrences(of: self.xmlend, with: "")
            } else if (line.contains(self.ephepathStart)) {
                tmpLine = line.replacingOccurrences(of: self.ephepathStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.ephepathEnd, with: "")
                config.ephepath = tmpLine
            } else if (line.contains(self.centricStart)) {
                tmpLine = line.replacingOccurrences(of: self.centricStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.centricEnd, with: "")
                config.centric = tmpLine
            } else if (line.contains(self.siderealStart)) {
                tmpLine = line.replacingOccurrences(of: self.siderealStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.siderealEnd, with: "")
                config.sidereal = tmpLine
            } else if (line.contains(self.placeStart)) {
                tmpLine = line.replacingOccurrences(of: self.placeStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.placeEnd, with: "")
                config.sidereal = tmpLine
            } else if (line.contains(self.latStart)) {
                tmpLine = line.replacingOccurrences(of: self.latStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.latEnd, with: "")
                config.lat = (Double)(tmpLine)!
            } else if (line.contains(self.lngStart)) {
                tmpLine = line.replacingOccurrences(of: self.lngStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.lngEnd, with: "")
                config.lng = (Double)(tmpLine)!
            } else if (line.contains(self.timezoneStart)) {
                tmpLine = line.replacingOccurrences(of: self.timezoneStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.timezoneEnd, with: "")
                config.defaultTimezone = tmpLine
            } else if (line.contains(self.progressionStart)) {
                tmpLine = line.replacingOccurrences(of: self.progressionStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.progressionEnd, with: "")
                config.progression = tmpLine
            } else if (line.contains(self.bandsStart)) {
                tmpLine = line.replacingOccurrences(of: self.bandsStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.bandsEnd, with: "")
                config.defaultBands = (Int)(tmpLine)!
            } else if (line.contains(self.houseStart)) {
                tmpLine = line.replacingOccurrences(of: self.houseStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.houseEnd, with: "")
                config.houseCalc = tmpLine
            } else if (line.contains(self.zodiacOuterWidthStart)) {
                tmpLine = line.replacingOccurrences(of: self.zodiacOuterWidthStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.zodiacOuterWidthEnd, with: "")
                config.zodiacOuterWidth = (Int)(tmpLine)!
            } else if (line.contains(self.zodiacWidthStart)) {
                tmpLine = line.replacingOccurrences(of: self.zodiacWidthStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.zodiacWidthEnd, with: "")
                config.zodiacWidth = (Int)(tmpLine)!
            } else if (line.contains(self.zodiacCenterStart)) {
                tmpLine = line.replacingOccurrences(of: self.zodiacCenterStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.zodiacCenterEnd, with: "")
                config.zodiacCenter = (Int)(tmpLine)!
            } else if (line.contains(self.decimalDispStart)) {
                tmpLine = line.replacingOccurrences(of: self.decimalDispStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.decimalDispEnd, with: "")
                config.decimalDisp = tmpLine
            } else if (line.contains(self.dispPatternStart)) {
                tmpLine = line.replacingOccurrences(of: self.dispPatternStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispPatternEnd, with: "")
                config.dispPattern = (Int)(tmpLine)!
            }
        }
        
        return config
    }
}
