//
//  PlanData.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/07/27.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class PlanData: NSObject {
    var x:[Double] = [0, 0, 0, 0, 0, 0]
    var xpmret:[Double] = [0, 0, 0, 0, 0, 0]
    var xreturn:[Double] = [0,0,0,0,0,0,
                            0,0,0,0,0,0,
                            0,0,0,0,0,0,
                            0,0,0,0,0,0]
    var xflgs: Int = 0
    var teval: Double = 0
    
    override init() {
        
    }

}
