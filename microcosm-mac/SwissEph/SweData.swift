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
    var oec: SweEpsilon = SweEpsilon()
    var oec2000: SweEpsilon = SweEpsilon()
    var nut: SweNut = SweNut()
    var nut2000: SweNut = SweNut()
    var nutv: SweNut = SweNut()
    var ephe_path_is_set: Bool = false
    var ephepath: String
    var delta_t_userdef_is_set: Bool = false
    var delta_t_userdef: Double = 0
    var is_tid_acc_manual: Bool = false
    var tid_acc: Double = 0
    var swed_is_initialised: Bool = true
    var init_dt_done: Bool = false
    var sidd: SideData = SideData()
    var topd: TopoData = TopoData()
    var astro_models : [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
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
