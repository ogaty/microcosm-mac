//
//  SwissEph.swift
//  SwissEph for Swift
//
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/07/10.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa
import Swift

let SE_ECL_NUT = -1
let SEFLG_JPLEPH = 1 /* use JPL ephemeris */
let SEFLG_SWIEPH = 2 /* use SWISSEPH ephemeris */
let SEFLG_MOSEPH = 4 /* use Moshier ephemeris */
let SEFLG_EPHMASK = 7

let SEFLG_SPEED3 = 128
/* speed from 3 positions (do not use it,
 SEFLG_SPEED is faster and more precise.) */

let SEFLG_EQUATORIAL = (2*1024)    /* equatorial positions are wanted */
let SEFLG_XYZ        = (4*1024)    /* cartesian, not polar, coordinates */
let SEFLG_RADIANS    = (8*1024)    /* coordinates in radians, not degrees */

class SwissEph: NSObject {

    override init() {
        
    }
    
    func aaa() -> Void {
        let filePath = NSBundle.mainBundle().pathForResource("/path/to/data.csv", ofType: "json")
        let fileHandle : NSFileHandle! = NSFileHandle(forReadingAtPath: filePath!)
        let data : NSData = fileHandle.readDataToEndOfFile()
        
    }

    // tjd : Julian day, Universal time
    // ipl : body number(SUN, MOON, etc)
    // iflag : setting flags
    // xx: array(longitude, latitude, distance, speed in lng, speed in lat, speed in dist)
    func swe_calc ( tjd: Double, ipl: Int, var iflag: Int32,
                       inout xx: Double, inout serr: String) -> Int {
        
        var epheflag: Int
        var epheflag_sv: Int
        var iflgcoor: Int32
        var x: Double
        var iflagInt : Int = Int(iflag)
        
        epheflag_sv = 0
        
        // トレース部分削除
        
        // swiss ephemeris only.
        iflagInt = iflagInt & ~SEFLG_EPHMASK
        iflagInt = iflagInt & ~SEFLG_EPHMASK
        iflagInt |= SEFLG_SWIEPH
        
        /* if ephemeris flag != ephemeris flag of last call,
         * we clear the save area, to prevent swecalc() using
         * previously computed data for current calculation.
         * except with ipl = SE_ECL_NUT which is not dependent
         * on ephemeris, and except if change is from
         * ephemeris = 0 to ephemeris = SEFLG_DEFAULTEPH
         * or vice-versa.
         */
        epheflag = iflagInt & SEFLG_EPHMASK;
        if ((epheflag & SEFLG_SWIEPH) > 0) {
            epheflag = 0
        }
        if (epheflag_sv != epheflag && ipl != SE_ECL_NUT) {
            // iflagエラー
            swe_close()
            epheflag_sv = epheflag
        }

        
        return 0
    }

    func swe_close () -> Void {
        
    }
}
