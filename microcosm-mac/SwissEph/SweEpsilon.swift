//
//  SweEpsilon.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/08/14.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa
/* obliquity of ecliptic */
class SweEpsilon: NSObject {
    /* jd, eps, sin(eps), cos(eps) */
    var teps: Double = 0
    var eps: Double = 0
    var seps: Double = 0
    var ceps: Double = 0
}
