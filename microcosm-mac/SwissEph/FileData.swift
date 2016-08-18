//
//  FileData.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/07/30.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class FileData: NSObject {
    var fileHandle: NSFileHandle? // FiilePointer
    var sweph_denum: UInt = 0
    var tfstart: Double = 0
    var tfend: Double = 0
    var npl: Int = 0
    var ipl: [UInt] = []

}
