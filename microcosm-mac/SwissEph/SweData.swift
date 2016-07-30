//
//  SweData.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/07/26.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class SweData: NSObject {
    var pldat: [PlanData] = []
    var fidat: [FileData] = []
    var savedat: [SavePositions] = []
    var ephe_path_is_set: Bool = false
    var ephepath: String
    
    override init() {
        for i in 0..<SEI_NPLANETS {
            pldat[i] = PlanData()
        }

        for i in 0..<SE_NPLANETS+1 {
            savedat[i] = SavePositions()
        }
        for i in 0..<SEI_NEPHFILES {
            fidat[i] = FileData()
        }
        ephepath = ""
    }

}
