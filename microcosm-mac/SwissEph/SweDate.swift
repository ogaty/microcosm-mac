//
//  SweDate.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/07/29.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class SweDate: NSObject {

    /*** swe_revjul ******************************************************
     swe_revjul() is the inverse function to swe_julday(), see the description
     there.
     Arguments are julian day number, calendar flag (0=julian, 1=gregorian)
     return values are the calendar day, month, year and the hour of
     the day with decimal fraction (0 .. 23.999999).
     
     Be aware the we use astronomical year numbering for the years
     before Christ, not the historical year numbering.
     Astronomical years are done with negative numbers, historical
     years with indicators BC or BCE (before common era).
     Year  0 (astronomical)        = 1 BC historical year
     year -1 (astronomical)        = 2 BC historical year
     year -234 (astronomical)      = 235 BC historical year
     etc.
     
     Original author Mark Pottenger, Los Angeles.
     with bug fix for year < -4711 16-aug-88 Alois Treindl
     *************************************************************************/
    // 時刻を求める
    func swe_revjul (_ jd: Double, gregflag: Bool) -> SweRet
    {
        var u0: Double
        var u1: Double
        var u2: Double
        var u3: Double
        var u4: Double
        let ret: SweRet = SweRet()
        u0 = jd + 32082.5
        if (gregflag == SE_GREG_CAL) {
            u1 = u0 + floor (u0/36525.0) - floor (u0/146100.0) - 38.0
            if (jd >= 1830691.5) {
                u1 = u1 + 1
            }
            u0 = u0 + floor (u1/36525.0) - floor (u1/146100.0) - 38.0
        }
        u2 = floor (u0 + 123.0)
        u3 = floor ( (u2 - 122.2) / 365.25)
        u4 = floor ( (u2 - floor (365.25 * u3) ) / 30.6001)
        ret.date.month = Int(u4 - 1.0)
        if (ret.date.month! > 12) {
            ret.date.month = ret.date.month! - 12
        }
        ret.date.day = Int(u2 - floor (365.25 * u3) - floor (30.6001 * u4))
        ret.date.year = Int(u3 + floor ( (u4 - 2.0) / 12.0) - 4800)
        ret.jut = (jd - floor (jd + 0.5) + 0.5) * 24.0
        
        return ret
    }

}
