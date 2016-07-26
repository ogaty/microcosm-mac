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

let SEFLG_DEFAULTEPH = 2


let SEFLG_SPEED3 = 128
/* speed from 3 positions (do not use it,
 SEFLG_SPEED is faster and more precise.) */
let SEFLG_SPEED	= 256     /* high precision speed  */

let SEFLG_EQUATORIAL = (2*1024)    /* equatorial positions are wanted */
let SEFLG_XYZ        = (4*1024)    /* cartesian, not polar, coordinates */
let SEFLG_RADIANS    = (8*1024)    /* coordinates in radians, not degrees */

let ERR = -1

let MOON_SPEED_INTV = 0.00005
let PLAN_SPEED_INTV = 0.0001
let NODE_CALC_INTV_MOSH = 0.1

let SE_SUN = 0
let SE_MOON = 1
let SE_MEAN_NODE = 10
let SE_TRUE_NODE = 11
let SE_MEAN_APOG = 12
let SE_OSCU_APOG = 13
let SE_NPLANETS = 21

let DEGTORAD = 0.0174532925199433

class SwissEph: NSObject {
    
    var swed: SweData // struct swe_data
    var swe_ret: SweRet // 戻り値用
    var sd_idx : Int // sdポインタのindex
    var xs_idx : Int // xsポインタのindex

    override init() {
        swed = SweData()
        swe_ret = SweRet()
        sd_idx = 0
        xs_idx = 0
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
    func swe_calc ( tjd: Double, ipl: Int, iflag: Int32,
                       inout xx: Double, inout serr: String) -> SweRet {
        var i: Int
        var j: Int
        var iflagInt : Int = Int(iflag)
        var iflagSave : Int = Int(iflag)
        var epheflag: Int
        var epheflag_sv: Int
        var iflgcoor: Int
        var x: [Double] = [0, 0, 0, 0, 0, 0]
        var dt: Double
        
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

        /* high precision speed prevails fast speed */
        // SPEEDとSPEED3のフラグが立っていたらSPEEDだけにする
        if ((iflagInt & SEFLG_SPEED3) > 0 && (iflagInt & SEFLG_SPEED) > 0) {
            iflagInt = iflagInt & ~SEFLG_SPEED3
        }
        /* cartesian flag excludes radians flag */
        // XYZとRADIANのフラグが立っていたらXYZだけにする
        if ((iflagInt & SEFLG_XYZ) > 0 && (iflagInt & SEFLG_RADIANS) > 0) {
            iflagInt = iflagInt & ~SEFLG_RADIANS
        }
        /* pointer to save area */
        // セーブポイントセット
        if (ipl < SE_NPLANETS && ipl >= SE_SUN) {
            sd_idx = ipl
        }
        else {
            /* other bodies, e.g. asteroids called with ipl = SE_AST_OFFSET + MPC# */
            sd_idx = SE_NPLANETS
        }

        /*
         * if position is available in save area, it is returned.
         * this is the case, if tjd = tsave and iflag = iflgsave.
         * coordinate flags can be neglected, because save area
         * provides all coordinate types.
         * if ipl > SE_AST(EROID)_OFFSET, ipl must be checked,
         * because all asteroids called by MPC number share the same
         * save area.
         */
        iflgcoor = SEFLG_EQUATORIAL | SEFLG_XYZ | SEFLG_RADIANS;
        if (swed.savedat[sd_idx].tsave == tjd && tjd != 0 && ipl == swed.savedat[sd_idx].ipl) {
            if ((swed.savedat[sd_idx].iflgsave & ~iflgcoor) == (iflagInt & ~iflgcoor)) {
                // end_swe_calc部分
                // 既に計算済みの場合（たぶん）
                if ((iflagInt & SEFLG_EQUATORIAL) > 0) {
                    xs_idx = sd_idx + 12 /* equatorial coordinates */
                }
                else {
                    xs_idx = sd_idx      /* ecliptic coordinates */
                }
                if ((iflagInt & SEFLG_XYZ) > 0) {
                    xs_idx = sd_idx + 6  /* cartesian coordinates */
                }
                if (ipl == SE_ECL_NUT) {
                    i = 4
                }
                else {
                    i = 3
                }

                for j in 0..<i {
                    x[j] = swed.savedat[sd_idx].xsaves[xs_idx + j]
                }
                for j in i..<6 {
                    x[j] = 0;
                }
                if ((iflagInt & (SEFLG_SPEED3 | SEFLG_SPEED)) > 0) {
                    for j in 3..<6 {
                        x[j] = swed.savedat[sd_idx].xsaves[xs_idx + j]
                    }
                }
            
            }
            if ((iflagInt & SEFLG_RADIANS) > 0) {
                if (ipl == SE_ECL_NUT) {
                    for j in 0..<4 {
                        x[j] *= DEGTORAD;
                    }
                } else {
                    for j in 0..<2 {
                        x[j] *= DEGTORAD;
                    }
                    if ((iflagInt & (SEFLG_SPEED3 | SEFLG_SPEED)) > 0) {
                        for j in 3..<5 {
                            x[j] *= DEGTORAD;
                        }
                    }
                }
            }
            for i in 0..<6 {
                swe_ret.xx[i] = x[i]
            }
            iflagInt = swed.savedat[sd_idx].iflgsave
            /* if no ephemeris has been specified, do not return chosen ephemeris */
            if ((iflagSave & SEFLG_EPHMASK) == 0) {
                iflagInt = iflagInt & ~SEFLG_DEFAULTEPH
            }
            
            swe_ret.iflag = iflagInt
            
            return swe_ret
        
        }

        /*
         * otherwise, new position must be computed
         */
        if ((iflagInt & SEFLG_SPEED3) == 0) {
            /*
             * with high precision speed from one call of swecalc()
             * (FAST speed)
             */
            swed.savedat[sd_idx].tsave = tjd;
            swed.savedat[sd_idx].ipl = ipl;
            
            let ret: SweRet = swecalc(tjd, ipl: ipl, iflagInt: iflagInt)
            if (ret.iflag == ERR) {
                // return_error
                for i in 0..<6 {
                    swe_ret.xx[i] = 0
                }
                swe_ret.iflag = ERR
                return swe_ret
            }
            
        } else {
            /*
             * with speed from three calls of swecalc(), slower and less accurate.
             * (SLOW speed, for test only)
             */
            // SPEED3フラグが立っている場合
            // 遅いから使うな、ですってよ
            swed.savedat[sd_idx].tsave = tjd
            swed.savedat[sd_idx].ipl = ipl

            switch(ipl) {
            case SE_MOON:
                dt = MOON_SPEED_INTV
                break
            case SE_OSCU_APOG:
                dt = NODE_CALC_INTV_MOSH
                break
            case SE_TRUE_NODE:
                /* this is the optimum dt with Moshier ephemeris, but not with
                 * JPL ephemeris or SWISSEPH. To avoid completely false speed
                 * in case that JPL is wanted but the program returns Moshier,
                 * we use Moshier optimum.
                 * For precise speed, use JPL and FAST speed computation,
                 */
                dt = NODE_CALC_INTV_MOSH
                break;
            default:
                dt = PLAN_SPEED_INTV
                break;
            }
            let ret: SweRet = swecalc(tjd-dt, ipl: ipl, iflagInt: iflagInt)
            if (ret.iflag == ERR) {
                // return_error
                for i in 0..<6 {
                    swe_ret.xx[i] = 0
                }
                swe_ret.iflag = ERR
                return swe_ret
            } else {
                swed.savedat[sd_idx].iflgsave = ret.iflag
            }
            let ret2: SweRet = swecalc(tjd+dt, ipl: ipl, iflagInt: iflagInt)
            if (ret2.iflag == ERR) {
                // return_error
                for i in 0..<6 {
                    swe_ret.xx[i] = 0
                }
                swe_ret.iflag = ERR
                return swe_ret
            } else {
                swed.savedat[sd_idx].iflgsave = ret.iflag
            }
            let ret3: SweRet = swecalc(tjd, ipl: ipl, iflagInt: iflagInt)
            if (ret3.iflag == ERR) {
                // return_error
                for i in 0..<6 {
                    swe_ret.xx[i] = 0
                }
                swe_ret.iflag = ERR
                return swe_ret
            } else {
                swed.savedat[sd_idx].iflgsave = ret.iflag
            }
            
//            denormalize_positions(ret.xx, sd->xsaves, ret2.xx)
//            calc_speed(ret.xx, ret3.xx, ret2.xx, dt);
        }

        if ((iflagInt & SEFLG_EQUATORIAL) > 0) {
            xs_idx = sd_idx + 12 /* equatorial coordinates */ /* 赤道座標系 */
        }
        else {
            xs_idx = sd_idx      /* ecliptic coordinates */ /* 黄道座標系 */
        }
        
        if ((iflagInt & SEFLG_XYZ) > 0) {
            xs_idx = sd_idx + 6  /* cartesian coordinates */ /* 直交座標系 */
        }
        
        if (ipl == SE_ECL_NUT) {
            i = 4
        } else {
            i = 3
        }

        for j in 0..<i {
//            x[j] = *(xs + j);
        }
        for j in i..<6 {
//            x[j] = 0;
        }
        
        if ((iflagInt & (SEFLG_SPEED3 | SEFLG_SPEED)) > 0) {
            for j in 3..<6 {
//                x[j] = *(xs + j);
            }
        }
        
        if ((iflagInt & SEFLG_RADIANS) > 0) {
            if (ipl == SE_ECL_NUT) {
                for j in 0..<4 {
                    x[j] *= DEGTORAD
                }
            } else {
                for j in 0..<2 {
                    x[j] *= DEGTORAD
                }
                if ((iflagInt & (SEFLG_SPEED3 | SEFLG_SPEED)) > 0) {
                    for j in 3..<5 {
                        x[j] *= DEGTORAD
                    }
                }
            }
        }

        for i in 0..<6  {
//            xx[i] = x[i];
        }
        swe_ret.iflag = swed.savedat[sd_idx].iflgsave
        /* if no ephemeris has been specified, do not return chosen ephemeris */
        if ((iflagSave & SEFLG_EPHMASK) == 0) {
            swe_ret.iflag = iflagInt & ~SEFLG_DEFAULTEPH
        }
        return swe_ret
    }

    func swecalc (tjd: Double, ipl: Int, iflagInt: Int) -> SweRet {
        
        return swe_ret
    }
    
    func swe_close () -> Void {
        
    }
}
