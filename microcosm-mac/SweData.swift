//
//  SweData.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/07/26.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class SweData: NSObject {
    var savedat: [SavePositions] = []
    
    override init() {
        for i in 0..<SE_NPLANETS+1 {
            savedat[i] = SavePositions()
        }
    }

}
