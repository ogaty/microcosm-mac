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
    var xx: [Double] = [0, 0, 0, 0, 0, 0]
    var serr: String = ""
    var deltat: Double = 0
    var date: NSDateComponents = NSDateComponents()
    var jut: Double
    
    override init() {
        
    }
}
