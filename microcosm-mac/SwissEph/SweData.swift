//
//  SweData.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/07/26.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class SweData: NSObject {
    var pldat: [PlanData] = [PlanData]()
    var fidat: [FileData] = [FileData]()
    var savedat: [SavePositions] = [SavePositions]()
    var gcdat: GenConst
    var ephe_path_is_set: Bool = false
    var ephepath: String
    
    override init() {
        for _ in 0..<SEI_NPLANETS {
            pldat.append(PlanData())
        }

        for _ in 0..<SE_NPLANETS+1 {
            savedat.append(SavePositions())
        }
        for _ in 0..<SEI_NEPHFILES {
            fidat.append(FileData())
        }
        gcdat = GenConst()
        ephepath = ""
    }

}
