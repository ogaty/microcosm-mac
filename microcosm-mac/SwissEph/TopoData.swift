//
//  TopoData.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/08/27.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class TopoData: NSObject {
    var geolon: Double = 0
    var geolat: Double = 0
    var geoalt: Double = 0
    var teval: Double = 0
    var tjd_ut: Double = 0
    var xobs: [Double] = [0, 0, 0, 0, 0, 0]
}
