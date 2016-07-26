//
//  SavePositions.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/07/26.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class SavePositions: NSObject {
    var ipl:Int = 0
    var tsave:Double = 0.0
    var iflgsave:Int = 0
    var xsaves:[Double] = [0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0]
    
    
    override init() {
    }
}
