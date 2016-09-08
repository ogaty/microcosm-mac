//
//  SweRet.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/07/26.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class SweRet: NSObject {
    var iflag: Int = 0
    var xx: [Double] = [0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0]
    var serr: String = ""

    // for deltaT
    var tid_acc: Double = 0
    var denum: Int = 0
    var deltat: Double = 0

    var date: NSDateComponents = NSDateComponents()
    var tmp: UInt = 0
    var tmpInt: Int = 0
    var tmpDbl6: [Double] = [0, 0, 0, 0, 0, 0,
                             0, 0, 0, 0, 0, 0,
                             0, 0, 0, 0, 0, 0,
                             0, 0, 0, 0, 0, 0]
    var jut: Double = 0
    
    var cusps: [Double] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    var ascmc: [Double] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
}
