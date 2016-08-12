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
    var ibdy: Int = 0
    var lndx0: Int = 0   	/* file position of begin of planet's index */
    var iflg: Int = 0
    var ncoe: Int = 0
    var rmax: Double = 0
    var tfstart: Double = 0
    var tfend: Double = 0
    var dseg: Double = 0
    var nndx: Int = 0
    var telem: Double = 0
    var prot: Double = 0
    var dprot: Double = 0
    var qrot: Double = 0
    var dqrot: Double = 0
    var peri: Double = 0
    var dperi: Double = 0
    var tseg0: Double = 0
    var tseg1: Double = 0
    var neval: Int = 0
    var iephe: Int = 0
    var refep: [Double] = [0, 0, 0, 0, 0, 0]
    var segp: [Double] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                          0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                          0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                          0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                          0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                          0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                          0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                          0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    override init() {
        
    }

}
