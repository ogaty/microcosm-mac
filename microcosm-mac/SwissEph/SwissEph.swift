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

let J2000 = 2451545.0

let SE_ECL_NUT = -1
let SEFLG_JPLEPH = 1 /* use JPL ephemeris */
let SEFLG_SWIEPH = 2 /* use SWISSEPH ephemeris */
let SEFLG_MOSEPH = 4 /* use Moshier ephemeris */
let SEFLG_EPHMASK = 7

let SE_MODEL_DELTAT = 7

let SEI_FLG_ROTATE = 2

let SEFLG_DEFAULTEPH = 2

let SE_AST_OFFSET = 10000

let SEFLG_SPEED3 = 128
/* speed from 3 positions (do not use it,
 SEFLG_SPEED is faster and more precise.) */
let SEFLG_SPEED	= 256     /* high precision speed  */

let SEFLG_EQUATORIAL = (2*1024)    /* equatorial positions are wanted */
let SEFLG_XYZ        = (4*1024)    /* cartesian, not polar, coordinates */
let SEFLG_RADIANS    = (8*1024)    /* coordinates in radians, not degrees */

let OK = 0
let ERR = -1
let NOT_AVAILABLE = -2

let MOON_SPEED_INTV = 0.00005
let PLAN_SPEED_INTV = 0.0001
let NODE_CALC_INTV_MOSH = 0.1

let SE_SUN = 0
let SE_MOON = 1
let SE_PLUTO = 9
let SE_MEAN_NODE = 10
let SE_TRUE_NODE = 11
let SE_MEAN_APOG = 12
let SE_OSCU_APOG = 13
let SE_NPLANETS = 21

let SEFLG_TRUEPOS = 16
let SEFLG_J2000 = 32

let SEFLG_ICRS = 128 * 1024

let SEI_EMB = 0
let SEI_EARTH = 0
let SEI_SUN = 0
let SEI_MOON = 1
let SEI_MERCURY = 2
let SEI_VENUS = 3
let SEI_MARS = 4
let SEI_JUPITER = 5
let SEI_SATURN = 6
let SEI_URANUS = 7
let SEI_NEPTUNE = 8
let SEI_PLUTO = 9
let SEI_SUNBARY = 10      /* barycentric sun */
let SEI_ANYBODY = 11      /* any asteroid */
let SEI_CHIRON = 12
let SEI_PHOLUS = 13
let SEI_CERES = 14
let SEI_PALLAS = 15
let SEI_JUNO = 16
let SEI_VESTA = 17
let SEI_NPLANETS = 18

let SEI_FILE_PLANET = 0
let SEI_FILE_MOON = 1
let SEI_FILE_MAIN_AST = 2
let SEI_FILE_ANY_AST = 3
let SEI_FILE_FIXSTAR = 4

let SEI_FILE_BIGNDIAN = 0
let SEI_FILE_LITENDIAN = 1

let SEI_NEPHFILES = 7

let SEI_FLG_ELLIPSE = 4
let SEI_FLG_EMBHEL = 8

let DO_SAVE = true
let NO_SAVE = false

let SE_GREG_CAL = true

let SE_TIDAL_DE200 = -23.8946
let SE_TIDAL_DE403 = -25.580
let SE_TIDAL_DE404 = -25.580 /* was (-25.8) until V. 1.76.2 */
let SE_TIDAL_DE405 = -25.826
let SE_TIDAL_DE406 = -25.826
let SE_TIDAL_DE421 = -25.85
let SE_TIDAL_DE422 = -25.85
let SE_TIDAL_DE430 = -25.82
let SE_TIDAL_DE431 = -25.80
let SE_DE_NUMBER = 431
let SE_TIDAL_DEFAULT = SE_TIDAL_DE431

let PI = 3.14159265358979323846
let DEG_TO_RAD = 0.0174532925199433

let AS_MAXCH = 256

let SEMOD_DELTAT_ESPENAK_MEEUS_2006 = 1

let TAB2_START = -1000
let TAB2_END = 1600
let TAB2_STEP = 100
let TABSTART = 1620
let TABEND = 2019

let dt: [Double] = [
    /* 1620.0 thru 1659.0 */
    124.00, 119.00, 115.00, 110.00, 106.00, 102.00, 98.00, 95.00, 91.00, 88.00,
    85.00, 82.00, 79.00, 77.00, 74.00, 72.00, 70.00, 67.00, 65.00, 63.00,
    62.00, 60.00, 58.00, 57.00, 55.00, 54.00, 53.00, 51.00, 50.00, 49.00,
    48.00, 47.00, 46.00, 45.00, 44.00, 43.00, 42.00, 41.00, 40.00, 38.00,
    /* 1660.0 thru 1699.0 */
    37.00, 36.00, 35.00, 34.00, 33.00, 32.00, 31.00, 30.00, 28.00, 27.00,
    26.00, 25.00, 24.00, 23.00, 22.00, 21.00, 20.00, 19.00, 18.00, 17.00,
    16.00, 15.00, 14.00, 14.00, 13.00, 12.00, 12.00, 11.00, 11.00, 10.00,
    10.00, 10.00, 9.00, 9.00, 9.00, 9.00, 9.00, 9.00, 9.00, 9.00,
    /* 1700.0 thru 1739.0 */
    9.00, 9.00, 9.00, 9.00, 9.00, 9.00, 9.00, 9.00, 10.00, 10.00,
    10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 10.00, 11.00, 11.00, 11.00,
    11.00, 11.00, 11.00, 11.00, 11.00, 11.00, 11.00, 11.00, 11.00, 11.00,
    11.00, 11.00, 11.00, 11.00, 12.00, 12.00, 12.00, 12.00, 12.00, 12.00,
    /* 1740.0 thru 1779.0 */
    12.00, 12.00, 12.00, 12.00, 13.00, 13.00, 13.00, 13.00, 13.00, 13.00,
    13.00, 14.00, 14.00, 14.00, 14.00, 14.00, 14.00, 14.00, 15.00, 15.00,
    15.00, 15.00, 15.00, 15.00, 15.00, 16.00, 16.00, 16.00, 16.00, 16.00,
    16.00, 16.00, 16.00, 16.00, 16.00, 17.00, 17.00, 17.00, 17.00, 17.00,
    /* 1780.0 thru 1799.0 */
    17.00, 17.00, 17.00, 17.00, 17.00, 17.00, 17.00, 17.00, 17.00, 17.00,
    17.00, 17.00, 16.00, 16.00, 16.00, 16.00, 15.00, 15.00, 14.00, 14.00,
    /* 1780.0 thru 1799.0 */
    17.00, 17.00, 17.00, 17.00, 17.00, 17.00, 17.00, 17.00, 17.00, 17.00,
    17.00, 17.00, 16.00, 16.00, 16.00, 16.00, 15.00, 15.00, 14.00, 14.00,
    /* 1800.0 thru 1819.0 */
    13.70, 13.40, 13.10, 12.90, 12.70, 12.60, 12.50, 12.50, 12.50, 12.50,
    12.50, 12.50, 12.50, 12.50, 12.50, 12.50, 12.50, 12.40, 12.30, 12.20,
    /* 1820.0 thru 1859.0 */
    12.00, 11.70, 11.40, 11.10, 10.60, 10.20, 9.60, 9.10, 8.60, 8.00,
    7.50, 7.00, 6.60, 6.30, 6.00, 5.80, 5.70, 5.60, 5.60, 5.60,
    5.70, 5.80, 5.90, 6.10, 6.20, 6.30, 6.50, 6.60, 6.80, 6.90,
    7.10, 7.20, 7.30, 7.40, 7.50, 7.60, 7.70, 7.70, 7.80, 7.80,
    /* 1860.0 thru 1899.0 */
    7.88, 7.82, 7.54, 6.97, 6.40, 6.02, 5.41, 4.10, 2.92, 1.82,
    1.61, 0.10, -1.02, -1.28, -2.69, -3.24, -3.64, -4.54, -4.71, -5.11,
    -5.40, -5.42, -5.20, -5.46, -5.46, -5.79, -5.63, -5.64, -5.80, -5.66,
    -5.87, -6.01, -6.19, -6.64, -6.44, -6.47, -6.09, -5.76, -4.66, -3.74,
    /* 1900.0 thru 1939.0 */
    -2.72, -1.54, -0.02, 1.24, 2.64, 3.86, 5.37, 6.14, 7.75, 9.13,
    10.46, 11.53, 13.36, 14.65, 16.01, 17.20, 18.24, 19.06, 20.25, 20.95,
    21.16, 22.25, 22.41, 23.03, 23.49, 23.62, 23.86, 24.49, 24.34, 24.08,
    24.02, 24.00, 23.87, 23.95, 23.86, 23.93, 23.73, 23.92, 23.96, 24.02,
    -2.72, -1.54, -0.02, 1.24, 2.64, 3.86, 5.37, 6.14, 7.75, 9.13,
    10.46, 11.53, 13.36, 14.65, 16.01, 17.20, 18.24, 19.06, 20.25, 20.95,
    21.16, 22.25, 22.41, 23.03, 23.49, 23.62, 23.86, 24.49, 24.34, 24.08,
    24.02, 24.00, 23.87, 23.95, 23.86, 23.93, 23.73, 23.92, 23.96, 24.02,
    /* 1940.0 thru 1979.0 */
    24.33, 24.83, 25.30, 25.70, 26.24, 26.77, 27.28, 27.78, 28.25, 28.71,
    29.15, 29.57, 29.97, 30.36, 30.72, 31.07, 31.35, 31.68, 32.18, 32.68,
    33.15, 33.59, 34.00, 34.47, 35.03, 35.73, 36.54, 37.43, 38.29, 39.20,
    40.18, 41.17, 42.23, 43.37, 44.49, 45.48, 46.46, 47.52, 48.53, 49.59,
    /* 1980.0 thru 1999.0 */
    50.54, 51.38, 52.17, 52.96, 53.79, 54.34, 54.87, 55.32, 55.82, 56.30,
    56.86, 57.57, 58.31, 59.12, 59.98, 60.78, 61.63, 62.30, 62.97, 63.47,
    /* 2000.0 thru 2009.0 */
    63.83, 64.09, 64.30, 64.47, 64.57, 64.69, 64.85, 65.15, 65.46, 65.78,
    /* 2010.0 thru 2016.0 */
    /* newest value of 2016 was taken from:
     * http://maia.usno.navy.mil/ser7/deltat.data*/
    66.07, 66.32, 66.60, 66.907,67.281,67.644,68.1024,
    /* Extrapolated values, 2017 - 2019 */
    68.50, 69.00, 69.50
]

let dt2: [Int] = [
    /*-1000  -900  -800  -700  -600  -500  -400  -300  -200  -100*/
    25400,23700,22000,21000,19040,17190,15530,14080,12790,11640,
    /*    0   100   200   300   400   500   600   700   800   900*/
    10580, 9600, 8640, 7680, 6700, 5710, 4740, 3810, 2960, 2200,
    /* 1000  1100  1200  1300  1400  1500  1600,                 */
    1570, 1090,  740,  490,  320,  200,  120,
]


class SwissEph: NSObject {

    var swe_date: SweDate
    
    var swed: SweData = SweData() // struct swe_data
    var swe_ret: SweRet // 戻り値用
    var sd_idx : Int // sdポインタのindex
    var xs_idx : Int // xsポインタのindex
    var fileName: String
    var fileHandle: NSFileHandle? // FiilePointer
    var buf: Array<UInt8>

    override init() {
        swe_date = SweDate()
        swe_ret = SweRet()
        sd_idx = 0
        xs_idx = 0
        fileName = ""
        fileHandle = nil
        buf = []
    }
    
    // tjd : Julian day, Universal time
    // ipl : body number(SUN, MOON, etc)
    // iflag : setting flags
    // xx: array(longitude, latitude, distance, speed in lng, speed in lat, speed in dist)
    // 本移植版ではiflag,serr,xxをクラスにぶちこんで返す
    func swe_calc ( tjd: Double, ipl: Int, iflag: Int) -> SweRet {
        var i: Int
        var epheflag: Int
        var iflgcoor: Int
        var x: [Double] = [0, 0, 0, 0, 0, 0]
        var iplInt:Int = ipl
        var iflagInt : Int = iflag
        var iflagSave: Int = iflag
        var epheflag_sv: Int = SEFLG_SWIEPH
        
        
        // トレース部分削除

        /* function calls for Pluto with asteroid number 134340
         * are treated as calls for Pluto as main body SE_PLUTO.
         * Reason: Our numerical integrator takes into account Pluto
         * perturbation and therefore crashes with body 134340 Pluto. */
        if (iplInt == SE_AST_OFFSET + 134340) {
            iplInt = SE_PLUTO
        }
        
        // swiss ephemeris only.
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
        if (epheflag_sv != epheflag && iplInt != SE_ECL_NUT) {
            // iflagエラー
            swe_close()
            epheflag_sv = epheflag
        }

        // swiss ephemerisのみサポートのためlast_epheflagのif文削除

        /* high precision speed prevails fast speed */
        // 面倒なのでSPEED3は未対応にする
        // topo centricも当面いいや
        if ((iflagInt & SEFLG_SPEED3) > 0 && (iflagInt & SEFLG_SPEED) > 0) {
            iflagInt = iflagInt & ~SEFLG_SPEED3
        }
        iflagInt = iflagInt | SEFLG_SPEED
        /* cartesian flag excludes radians flag */
        // XYZとRADIANのフラグが立っていたらXYZだけにする
        if ((iflagInt & SEFLG_XYZ) > 0 && (iflagInt & SEFLG_RADIANS) > 0) {
            iflagInt = iflagInt & ~SEFLG_RADIANS
        }
        /* pointer to save area */
        // セーブポイントセット
        if (iplInt < SE_NPLANETS && iplInt >= SE_SUN) {
            sd_idx = iplInt
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
        // SEFLG_COORDSYS
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
                if (iplInt == SE_ECL_NUT) {
                    for j in 0..<4 {
                        x[j] *= DEG_TO_RAD;
                    }
                } else {
                    for j in 0..<2 {
                        x[j] *= DEG_TO_RAD;
                    }
                    if ((iflagInt & (SEFLG_SPEED3 | SEFLG_SPEED)) > 0) {
                        for j in 3..<5 {
                            x[j] *= DEG_TO_RAD;
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
//        if ((iflagInt & SEFLG_SPEED3) == 0) {
            /*
             * with high precision speed from one call of swecalc()
             * (FAST speed)
             */
            swed.savedat[sd_idx].tsave = tjd;
            swed.savedat[sd_idx].ipl = iplInt;
            
            let ret: SweRet = swecalc(tjd, ipl: iplInt, iflag: iflagInt)
            if (ret.iflag == ERR) {
                // return_error
                for i in 0..<6 {
                    swe_ret.xx[i] = 0
                }
                swe_ret.iflag = ERR
                return swe_ret
            }
            
//        }

// end_swe_calc:
        if ((iflagInt & SEFLG_EQUATORIAL) > 0) {
            xs_idx = sd_idx + 12 /* equatorial coordinates */ /* 赤道座標系 */
        }
        else {
            xs_idx = sd_idx      /* ecliptic coordinates */ /* 黄道座標系 */
        }
        
        if ((iflagInt & SEFLG_XYZ) > 0) {
            xs_idx = sd_idx + 6  /* cartesian coordinates */ /* 直交座標系 */
        }
        
        if (iplInt == SE_ECL_NUT) {
            i = 4
        } else {
            i = 3
        }

        for j in 0..<i {
            x[j] = swed.savedat[sd_idx].xsaves[xs_idx + j]
        }
        for j in i..<6 {
            x[j] = 0
        }
        
        if ((iflagInt & (SEFLG_SPEED3 | SEFLG_SPEED)) > 0) {
            for j in 3..<6 {
                x[j] = swed.savedat[sd_idx].xsaves[xs_idx + j]
            }
        }
        
        if ((iflagInt & SEFLG_RADIANS) > 0) {
            if (iplInt == SE_ECL_NUT) {
                for j in 0..<4 {
                    x[j] *= DEG_TO_RAD
                }
            } else {
                for j in 0..<2 {
                    x[j] *= DEG_TO_RAD
                }
                if ((iflagInt & (SEFLG_SPEED3 | SEFLG_SPEED)) > 0) {
                    for j in 3..<5 {
                        x[j] *= DEG_TO_RAD
                    }
                }
            }
        }

        for i in 0..<6  {
            swe_ret.xx[i] = x[i]
        }
        swe_ret.iflag = swed.savedat[sd_idx].iflgsave
        /* if no ephemeris has been specified, do not return chosen ephemeris */
        if ((iflagSave & SEFLG_EPHMASK) == 0) {
            swe_ret.iflag = iflagInt & ~SEFLG_DEFAULTEPH
        }
        return swe_ret
    }

    func swe_calc_ut ( tjd_ut: Double, ipl: Int, iflag: Int) -> SweRet {
        var epheflag:Int = iflag & SEFLG_EPHMASK
        var iflagInt:Int = iflag
        if (epheflag == 0) {
            epheflag = SEFLG_SWIEPH
            iflagInt = iflag | SEFLG_SWIEPH
        }
        var deltatRet:SweRet = swe_deltat_ex(swed, tjd: tjd_ut, iflag: iflag)
        var retval:SweRet = swe_calc(2451545.000000, ipl: ipl, iflag: iflag)
        /* if ephe required is not ephe returned, adjust delta t: */
        if ((retval.iflag & SEFLG_EPHMASK) != epheflag) {
            deltatRet = swe_deltat_ex(swed, tjd: tjd_ut, iflag: iflag)
            
            retval = swe_calc(2451545.000000, ipl: ipl, iflag: iflagInt)
//            retval = swe_calc(tjd_ut + deltatRet.deltat, ipl: ipl, iflag: iflagInt)
        }

        return retval
    }

    func swe_set_ephe_path(path: String) {
        swed.ephe_path_is_set = true
        swed.ephepath = path

        // この時点でswe_calcが動いている
        let iflag: Int = SEFLG_SWIEPH|SEFLG_J2000|SEFLG_TRUEPOS|SEFLG_ICRS
        let retc: SweRet = swe_calc(J2000, ipl: SE_MOON, iflag: iflag)
        if (swed.fidat[SEI_FILE_MOON].fileHandle != nil) {
            swi_set_tid_acc(0, iflag: (Int)(swed.fidat[SEI_FILE_MOON].sweph_denum), denum: 0)
        }
    }
    
    
    func swecalc (tjd: Double, ipl: Int, iflag: Int) -> SweRet {
        var iflagInt:Int = iflag
        let epheflag:Int = SEFLG_SWIEPH
        var ipli: Int
        var pdp_idx: Int
        /******************************************
         * iflag plausible?                       *
         ******************************************/
//        iflagInt = plaus_iflag(iflag, ipl, tjd, serr);

        if (!swed.ephe_path_is_set) {
            swe_set_ephe_path("")
        }

        /* todo sidereal 後回し
        if ((iflag & SEFLG_SIDEREAL) && !swed.ayana_is_set) {
            swe_set_sid_mode(SE_SIDM_FAGAN_BRADLEY, 0, 0);
        }
        */

        // todo varidate 後回し
        /******************************************
         * obliquity of ecliptic 2000 and of date *
         ******************************************/
//        swi_check_ecliptic(tjd, iflag);
        /******************************************
         * nutation                               *
         ******************************************/
//        swi_check_nutation(tjd, iflag);

        /******************************************
         * select planet and ephemeris            *
         *                                        *
         * ecliptic and nutation                  *
         ******************************************/
        if (ipl == SE_ECL_NUT) {
            // todo 歳差 後回し
        } else if (ipl == SE_MOON) {
            /* internal planet number */
            ipli = SEI_MOON;
            pdp_idx = ipli

            switch(epheflag) {
            case SEFLG_SWIEPH:
                let retc:SweRet = sweplan(tjd, ipli: ipli, ifno: SEI_FILE_MOON, iflag: iflag, do_save: DO_SAVE)
                if (retc.iflag == ERR) {
//                    goto return_error;
                }
                
                /* if sweph file not found, switch to moshier */
                // ↑というけどエラーでいいや
                if (retc.iflag == NOT_AVAILABLE) {
//                  goto return_error
                }
                break
            default:
                break
            }
            
            /* heliocentric, lighttime etc. */
            // todo
//            if ((retc = app_pos_etc_moon(iflag, serr)) != OK) {
//                goto return_error; /* retc may be wrong with sidereal calculation */
//            }
        }
        
        // todo
        
        return swe_ret
    }
        

    /* SWISSEPH
     * this function computes
     * 1. a barycentric planet
     * plus, under certain conditions,
     * 2. the barycentric sun,
     * 3. the barycentric earth, and
     * 4. the geocentric moon,
     * in barycentric cartesian equatorial coordinates J2000.
     *
     * these are the data needed for calculation of light-time etc.
     *
     * tjd          julian date
     * ipli         SEI_ planet number
     * ifno         ephemeris file number
     * do_save      write new positions in save area
     * xp           array of 6 doubles for planet's position and velocity
     * xpe                                 earth's
     * xps                                 sun's
     * xpm                                 moon's
     * serr         error string
     *
     * xp - xpm can be NULL. if do_save is TRUE, all of them can be NULL.
     * the positions will be written into the save area (swed.pldat[ipli].x)
     */
    func sweplan(tjd:Double, ipli: Int, ifno: Int, iflag: Int, do_save: Bool) -> SweRet {
        let ret: SweRet = SweRet()
        var retc: SweRet = SweRet()
        var do_earth: Bool = false
        var do_sunbary: Bool = false
        var do_moon: Bool = false
        var xps: [Double] = [0, 0, 0, 0, 0, 0]
        var xpm: [Double] = [0, 0, 0, 0, 0, 0]
        var i: Int
        let sunb: SweSunb = SweSunb()

        /* xps (barycentric sun) may be necessary because some planets on sweph
         * file are heliocentric, other ones are barycentric. without xps,
         * the heliocentric ones cannot be returned barycentrically.
         */
//        if (do_save || ipli == SEI_SUNBARY || (swed.pldat[ipli].iflg & SEI_FLG_HELIO) > 0
//            || xpsret != NULL || (iflag & SEFLG_HELCTR) > 0) {
//            do_sunbary = true
//        }
//        if (do_save || ipli == SEI_EARTH || xperet != NULL) {
//            do_earth = TRUE
//        }
        if (ipli == SEI_MOON) {
            do_earth = true
//            do_sunbary = true
        }
        if (do_save || ipli == SEI_MOON || ipli == SEI_EARTH) {
            do_moon = true
        }
        /* barycentric sun */
        if (do_sunbary) {
            /* if planet has already been computed for this date, return
             * if speed flag has been turned on, recompute planet */
            if (tjd == swed.pldat[SEI_SUNBARY].teval
                ) {
                for i in 0..<6 {
                    xps[i] = swed.pldat[SEI_SUNBARY].x[i]
                }
            } else {
                retc = sweph(tjd, ipli: SEI_SUNBARY, ifno: SEI_FILE_PLANET, xsunb: sunb, iflag: iflag, do_save: do_save)/**/
                //todo xpsを戻す
                if (retc != OK) {
                    return(retc)
                }
            }
//            if (xpsret != NULL) {
//                for i in 0..<6 {
//                    xpsret[i] = xps[i]
//                }
//            }
            for i in 0..<6 {
                ret.xx[i] = xps[i]
            }
        }
        
        /* moon */
        if (do_moon) {
            if (tjd == swed.pldat[SEI_MOON].teval) {
                for i in 0..<6 {
                    xpm[i] = swed.pldat[SEI_MOON].x[i]
                }
            } else {
                let retc: SweRet = sweph(tjd, ipli: SEI_MOON, ifno: SEI_FILE_MOON, xsunb: sunb, iflag: iflag, do_save: do_save)
                if (retc.iflag == ERR) {
                    return retc
                }
                //todo xpmを戻す

                /* if moon file doesn't exist, take moshier moon */
//                if (swed.fidat[SEI_FILE_MOON].fptr == NULL) {
//                    if (serr != NULL && strlen(serr) + 35 < AS_MAXCH)
//                    strcat(serr, " \nusing Moshier eph. for moon; ");
//                    retc = swi_moshmoon(tjd, do_save, xpm, serr);
//                    if (retc != OK)
//                    return(retc);
//                }
           }
            for i in 0..<6 {
                swed.pldat[SEI_MOON].xpmret[i] = xpm[i]
            }
        }
        if (do_earth) {
        }
        if (ipli == SEI_MOON) {
            for i in 0..<6 {
                swed.pldat[SEI_MOON].x[i] = xpm[i]
            }
        } else if (ipli == SEI_EARTH) {
        } else if (ipli == SEI_SUN) {
            for i in 0..<6 {
                swed.pldat[SEI_SUNBARY].x[i] = xpm[i]
            }
        } else {
            /* planet */
            // todo
        }
        
        ret.iflag = 0
        return ret
    }

    /*
     * this function looks for an ephemeris file,
     * opens it, if not yet open,
     * reads constants, if not yet read,
     * computes a planet, if not yet computed
     * attention: asteroids are heliocentric
     *            other planets barycentric
     *
     * tjd          julian date
     * ipli         SEI_ planet number
     * ifno         ephemeris file number
     * xsunb        INPUT (!) array of 6 doubles containing barycentric sun
     *              (must be given with asteroids)
     * do_save      boolean: save result in save area
     * xp           return array of 6 doubles for planet's position
     * serr         error string
     */
    func sweph(tjd: Double, ipli: Int, ifno: Int, xsunb: SweSunb, iflag: Int, do_save: Bool) -> SweRet
    {
        var ret:SweRet = SweRet()
        var retc:SweRet = SweRet()
        var ipl:Int = ipli
        var xx:[Double] = [0, 0, 0, 0, 0, 0]
        var t: Double
        var tsv: Double
        var need_speed: Bool = true
        let sunb: SweSunb = SweSunb()

        
        if (ipli > SE_AST_OFFSET) {
            ipl = SEI_ANYBODY
        }

        /* if planet has already been computed for this date, return.
         * if speed flag has been turned on, recompute planet */
        /*
        speedf1 = pdp->xflgs & SEFLG_SPEED;
        speedf2 = iflag & SEFLG_SPEED;
        if (tjd == pdp->teval
            && pdp->iephe == SEFLG_SWIEPH
            && (!speedf2 || speedf1)
            && ipl < SEI_ANYBODY) {
            if (xpret != NULL)
            for (i = 0; i <= 5; i++)
            xpret[i] = pdp->x[i];
            return(OK);
         }
         */
        if (swed.fidat[ifno].fileHandle != nil) {
            /* if tjd is beyond file range, close old file.
             * if new asteroid, close old file. */
            if (tjd < swed.fidat[ifno].tfstart || tjd > swed.fidat[ifno].tfend
                || (ipl == SEI_ANYBODY && ipli != swed.pldat[ipl].ibdy)) {
//                fclose(fdp->fptr);
//                fdp->fptr = NULL;
//                if (pdp->refep != NULL)
//                free((void *) pdp->refep);
//                pdp->refep = NULL;
//                if (pdp->segp != NULL)
//                free((void *) pdp->segp);
//                pdp->segp = NULL;
            }
        }
        if (swed.fidat[ifno].fileHandle == nil) {
            fileName = swi_gen_filename(tjd, ipli: ipli)
            fileHandle = swi_fopen(ifno, filename: fileName, ephepath: swed.ephepath)
        }
        
        ret = read_const(ifno)
        if (ret.iflag == ERR) {
            return ret
        }

        /* if first ephemeris file (J-3000), it might start a mars period
         * after -3000. if last ephemeris file (J3000), it might end a
         * 4000-day-period before 3000. */
        if (tjd < swed.fidat[ifno].tfstart || tjd > swed.fidat[ifno].tfend) {
            if (tjd < swed.fidat[ipli].tfstart) {
                ret.serr = "jd " + (String)(tjd) + " < Swiss Eph. lower limit " + (String)(swed.fidat[ipli].tfstart)
            } else {
                ret.serr = "jd " + (String)(tjd) + " > Swiss Eph. upper limit " + (String)(swed.fidat[ipli].tfend)
            }
            ret.iflag = NOT_AVAILABLE
            return ret
        }

        /******************************
         * get planet's position
         ******************************/
        /* get new segment, if necessary */
        if (swed.pldat[ipli].segp.count == 0 || swed.pldat[ipli].tseg0 == 0 || swed.pldat[ipli].tseg1 == 0) {
            retc = get_new_segment(tjd, ipli: ipl, ifno: ifno, buf: buf)
        }
        if (retc.iflag != OK) {
            return retc
        }
        /* rotate cheby coeffs back to equatorial system.
         * if necessary, add reference orbit. */
        if ((swed.pldat[ipli].iflg & SEI_FLG_ROTATE) > 0) {
            rot_back(ipli)
        } else {
            swed.pldat[ipli].neval = swed.pldat[ipli].ncoe
        }
        /* evaluate chebyshew polynomial for tjd */
        t = (tjd - swed.pldat[ipli].tseg0) / swed.pldat[ipli].dseg
        t = t * 2 - 1

        /* speed is needed, if
         * 1. true position is being computed before applying light-time etc.
         *    this is the position saved in pdp->x.
         *    in this case, speed is needed for light-time correction.
         * 2. the speed flag has been specified.
         */
        if ((iflag & SEFLG_SPEED) > 0) {
            need_speed = true
        } else if (do_save) {
            need_speed = true
        }
        for i in 0..<3 {
            if (do_save) {
                swed.pldat[ipli].x[i]  = swi_echeb(t, coef: swed.pldat[ipli].segp, ncf: swed.pldat[ipli].neval, index: i*swed.pldat[ipli].ncoe)
                if (need_speed) {
                    swed.pldat[ipli].x[i+3] = swi_edcheb(t, coef: swed.pldat[ipli].segp, ncf: swed.pldat[ipli].neval, index: i*swed.pldat[ipli].ncoe) / swed.pldat[ipli].dseg * 2
                } else {
                    swed.pldat[ipli].x[i+3] = 0 /* von Alois als billiger fix, evtl. illegal */
                }
            } else {
                ret.xx[i] = swi_echeb(t, coef: swed.pldat[ipli].segp, ncf: swed.pldat[ipli].neval, index: i*swed.pldat[ipli].ncoe)
                if (need_speed) {
                    ret.xx[i+3] = swi_edcheb(t, coef: swed.pldat[ipli].segp, ncf: swed.pldat[ipli].neval, index: i*swed.pldat[ipli].ncoe) / swed.pldat[ipli].dseg * 2
                } else {
                    ret.xx[i+3] = 0 /* von Alois als billiger fix, evtl. illegal */
                }
            }
        }

        /* if planet wanted is barycentric sun and must be computed
         * from heliocentric earth and barycentric earth: the
         * computation above gives heliocentric earth, therefore we
         * have to compute barycentric earth and subtract heliocentric
         * earth from it. this may be necessary with calls from
         * sweplan() and from app_pos_etc_sun() (light-time). */
        if (ipl == SEI_SUNBARY && ((swed.pldat[ipli].iflg & SEI_FLG_EMBHEL) > 0)) {
            /* sweph() calls sweph() !!! for EMB.
             * Attention: a new calculation must be forced in any case.
             * Otherwise EARTH (instead of EMB) will possibly taken from
             * save area.
             * to force new computation, set pedp->teval = 0 and restore it
             * after call of sweph(EMB).
             */
            tsv = swed.pldat[ipli].teval
            swed.pldat[ipli].teval = 0
            retc = sweph(tjd, ipli: SEI_EMB, ifno: ifno, xsunb: sunb, iflag: iflag | SEFLG_SPEED, do_save: NO_SAVE)
            if (retc.iflag != OK) {
                return retc
            }
            swed.pldat[SEI_EARTH].teval = tsv
            for i in 0..<3 {
                swed.pldat[ipli].x[i] = retc.xx[i]
            }
            for i in 3..<5 {
                swed.pldat[ipli].x[i] = retc.xx[i]
            }
        }
        /* asteroids are heliocentric.
         * if JPL or SWISSEPH, convert to barycentric */
        if ((iflag & SEFLG_JPLEPH) > 0 || (iflag & SEFLG_SWIEPH) > 0) {
            if (ipl >= SEI_ANYBODY) {
                for i in 0..<3 {
                    swed.pldat[ipli].x[i] = swed.pldat[ipli].x[i]
                }
                for i in 0..<6 {
                    swed.pldat[ipli].x[i] = swed.pldat[ipli].x[i]
                }
            }
        }

       if (do_save) {
            swed.pldat[ipli].teval = tjd
            swed.pldat[ipli].xflgs = -1    /* do new computation of light-time etc. */
            if (ifno == SEI_FILE_PLANET || ifno == SEI_FILE_MOON) {
                swed.pldat[ipli].iephe = SEFLG_SWIEPH
            } else {
                swed.pldat[ipli].iephe = swed.pldat[SEI_SUNBARY].iephe
            }
        }
        for i in 0..<6 {
            let a:Double = swed.pldat[ipli].x[i]
            ret.xx[i] = a
        }

        return ret
    }

    /* SWISSEPH
     * reads constants on ephemeris file
     * ifno         file #
     * serr         error string
     */
    func read_const(ifno: Int) -> SweRet
    {
        let ret: SweRet = SweRet()
        let data : NSData = fileHandle!.readDataToEndOfFile()
        var index: Int
        var ipli: UInt = 0
        var pdp_idx: Int
        
        var aBuffer = Array<UInt8>(count: data.length, repeatedValue: 0)
        data.getBytes(&aBuffer, length: data.length)
        buf = aBuffer
        if (aBuffer[0] != 83 || aBuffer[1] != 87 || aBuffer[2] != 73 || aBuffer[3] != 83 || aBuffer[4] != 83) { // SWISS
            ret.serr = "file damage."
        }
        var i: Int = 0
        var lfCnt: Int = 0
        // validate面倒なのでlf３回カウントまで進める
        while (lfCnt < 3) {
            i = i + 1
            if (aBuffer[i] == 10) {
                lfCnt = lfCnt + 1
            }
        }
        index = i + 1
        
        /****************************************
         * orbital elements, if single asteroid *
         ****************************************/
        if (ifno == SEI_FILE_ANY_AST) {
            // 後でいいや
        }
        
        // 本来は検証すべきだけどIntelなんだから
        // let _fendian:Int = SEI_FILE_LITENDIAN
        // endian
        // 074-077 63 62 61 00
        index = index + 4
        
        // lng
        // 078-07b c3 e8 13 00(semo)
        //         d7 62 07 00(sepl)
        index = index + 4
        
        /**********************************************************
         * DE number of JPL ephemeris which this file is based on *
         **********************************************************/
        var tmp: UInt = 0
        var bufRet: SweRet = do_fread(aBuffer, index: index)

        // 07c-07f    af 01 00 00
        swed.fidat[ifno].sweph_denum = bufRet.tmp
        index = index + 4
        
        // 080-087 1d 63 16 c7 7b 25 42 41(semo)  2378487.555371
        //         00 00 00 40 80 25 42 41(sepl)  2378496.500000
        swed.fidat[ifno].tfstart = do_fread8(aBuffer, index: index)
        index = index + 8

        // 088-08f 75 cd 8d 3a 8c d1 43 41(semo)
        //         4c 85 f8 ad 89 d1 43 41(sepl)
        swed.fidat[ifno].tfend = do_fread8(aBuffer, index: index)
        index = index + 8

        /*************************************
         * how many planets are in file?     *
         *************************************/
        // 090-091
        // semo:1, sepl:10(0x0a)
        bufRet = do_fread2(aBuffer, index: index)
        index = index + 2

        var nplan = bufRet.tmp
        swed.fidat[ifno].npl = (Int)(nplan)
        var nbytes_ipl:Int = 0
        if (nplan > 256) {
            nbytes_ipl = 4
            nplan = nplan % 256
        } else {
            nbytes_ipl = 2
        }
        swed.fidat[ifno].npl = (Int)(nplan)
        
        /* which ones?                       */
        if (nbytes_ipl == 4) {
            for i in 0..<nplan {
                bufRet = do_fread(aBuffer, index: index)
                index = index + 4
                // swed.fidat[ifno].ipl[i] = bufRet.tmp だとコンパイル通らず
                if (i == 0) {
                    swed.fidat[ifno].ipl0 = bufRet.tmp
                } else if (i == 1) {
                    swed.fidat[ifno].ipl1 = bufRet.tmp
                }
            }
        } else {
            // こっちを通る
            // 092-093
            // semo:1, sepl:2
            for i in 0..<nplan {
                bufRet = do_fread2(aBuffer, index: index)
                index = index + 2
                if (i == 0) {
                    swed.fidat[ifno].ipl0 = bufRet.tmp
                } else if (i == 1) {
                    swed.fidat[ifno].ipl1 = bufRet.tmp
                }
            }
        }
        
        if (ifno == SEI_FILE_ANY_AST) {
            // 後で
        }
        
        /*************************************
         * check CRC                         *
         *************************************/
        /* read CRC from file */
        // ここらへん本家だと整合性チェックとかしててめんどい。。。
        // 一旦飛ばす。
        // tmp = Int(aBuffer[index]) << 24
        // tmp = tmp + Int(aBuffer[index + 1]) << 16
        // tmp = tmp + Int(aBuffer[index + 2]) << 8
        // tmp = tmp + Int(aBuffer[index + 3])
        
        // let ulng:Int = tmp
        /* read check area from file */
        // fseek(fp, 0L, SEEK_SET);

        index = index + 4

        
        /*************************************
         * read general constants            *
         *************************************/
        /* clight, aunit, helgravconst, ratme, sunradius
         * these constants are currently not in use */
        var doubles: [Double] = [Double]()

        doubles.append(do_fread8(aBuffer, index: index))
        index = index + 8
        doubles.append(do_fread8(aBuffer, index: index))
        index = index + 8
        doubles.append(do_fread8(aBuffer, index: index))
        index = index + 8
        doubles.append(do_fread8(aBuffer, index: index))
        index = index + 8
        doubles.append(do_fread8(aBuffer, index: index))
        index = index + 8

        swed.gcdat.clight = doubles[0]
        swed.gcdat.aunit = doubles[1]
        swed.gcdat.helgravconst = doubles[2]
        swed.gcdat.ratme = doubles[3]
        swed.gcdat.sunradius = doubles[4]
        /*************************************
         * read constants of planets         *
         *************************************/
        for kpl in 0..<swed.fidat[ifno].npl {
            /* get SEI_ planet number */
            if (kpl == 0) {
                ipli = swed.fidat[ifno].ipl0
            } else if (kpl == 1) {
                ipli = swed.fidat[ifno].ipl1
            } else {
                ipli = 0
            }
            if (ipli >= (UInt)(SE_AST_OFFSET)) {
                pdp_idx = SEI_ANYBODY
            }
            else {
                pdp_idx = (Int)(ipli)
            }
            swed.pldat[pdp_idx].ibdy = (Int)(ipli)
            /* file position of planet's index */
            bufRet = do_fread(aBuffer, index: index)
            index = index + 4
            swed.pldat[pdp_idx].lndx0 = (Int)(bufRet.tmp)

            /* flags: helio/geocentric, rotation, reference ellipse */
            tmp = UInt(aBuffer[index])
            index = index + 1
            swed.pldat[pdp_idx].iflg = (Int)(tmp)

            /* number of chebyshew coefficients / segment  */
            /* = interpolation order +1                    */
            tmp = UInt(aBuffer[index])
            index = index + 1
            swed.pldat[pdp_idx].ncoe = (Int)(tmp)
            
            /* rmax = normalisation factor */
            bufRet = do_fread(aBuffer, index: index)
            index = index + 4
            let lng: Int = (Int)(bufRet.tmp)
            swed.pldat[pdp_idx].rmax = (Double)((Double)(lng) / 1000.0)

            /* start and end epoch of planetary ephemeris,   */
            /* segment length, and orbital elements          */
            var doubles2: [Double] = [Double]()
            
            doubles2.append(do_fread8(aBuffer, index: index))
            index = index + 8
            doubles2.append(do_fread8(aBuffer, index: index))
            index = index + 8
            doubles2.append(do_fread8(aBuffer, index: index))
            index = index + 8
            doubles2.append(do_fread8(aBuffer, index: index))
            index = index + 8
            doubles2.append(do_fread8(aBuffer, index: index))
            index = index + 8
            doubles2.append(do_fread8(aBuffer, index: index))
            index = index + 8
            doubles2.append(do_fread8(aBuffer, index: index))
            index = index + 8
            doubles2.append(do_fread8(aBuffer, index: index))
            index = index + 8
            doubles2.append(do_fread8(aBuffer, index: index))
            index = index + 8
            doubles2.append(do_fread8(aBuffer, index: index))
            index = index + 8
            
            swed.pldat[pdp_idx].tfstart = doubles2[0]
            swed.pldat[pdp_idx].tfend = doubles2[1]
            swed.pldat[pdp_idx].dseg = doubles2[2]
            swed.pldat[pdp_idx].nndx = (Int)((doubles[1] - doubles[0] + 0.1) / doubles[2])
            swed.pldat[pdp_idx].telem = doubles2[3]
            swed.pldat[pdp_idx].prot = doubles2[4]
            swed.pldat[pdp_idx].dprot = doubles2[5]
            swed.pldat[pdp_idx].qrot = doubles2[6]
            swed.pldat[pdp_idx].dqrot = doubles2[7]
            swed.pldat[pdp_idx].peri = doubles2[8]
            swed.pldat[pdp_idx].dperi = doubles2[9]

            /* alloc space for chebyshew coefficients */
            /* if reference ellipse is used, read its coefficients */
            if ((swed.pldat[pdp_idx].iflg & SEI_FLG_ELLIPSE) > 0) {
                swed.pldat[pdp_idx].refep.removeAll()
                for _ in 0..<swed.pldat[pdp_idx].ncoe*2*8 {
                    let refep: Double = do_fread8(aBuffer, index: index)
                    swed.pldat[pdp_idx].refep.append(refep)
                }
                //                if (retc != OK) {
                //                    free(pdp->refep);  /* 2015-may-5 */
                //                    pdp->refep = NULL;  /* 2015-may-5 */
                //                    goto return_error;
            }/**/
        }
        
        return ret
    }
    
    /* SWISSEPH
     * adds reference orbit to chebyshew series (if SEI_FLG_ELLIPSE),
     * rotates series to mean equinox of J2000
     *
     * ipli         planet number
     * 
     * ここら辺は論文でも探さないと分からないよなあ
     */
    func rot_back(ipli: Int) -> Void {
        var t: Double = swed.pldat[ipli].tseg0 + swed.pldat[ipli].dseg / 2
        var tdiff: Double = (t - swed.pldat[ipli].telem) / 365250.0
        var dn: Double
        var i : Int
        var qav : Double
        var pav : Double
        var nco : Int = swed.pldat[ipli].ncoe
        var omtild: Double
        var com: Double
        var som: Double
        var cosih2: Double
        var uix: [Double] = [0, 0, 0]
        var uiy: [Double] = [0, 0, 0]
        var uiz: [Double] = [0, 0, 0]
        var xrot: Double = 0
        var yrot: Double = 0
        var zrot: Double = 0
        var seps2000: Double = 0 //swed.oec2000.seps
        var ceps2000: Double = 0 //swed.oec2000.ceps
        var x: [[Double]] = [[0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0],
                             [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0],
                             [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0],
                             [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0]]

        
        
        if (ipli == SEI_MOON) {
            dn = swed.pldat[ipli].prot + tdiff * swed.pldat[ipli].dprot
            i = (Int) (dn / (2 * PI))
            dn = dn - (Double)(i * 2) * PI
            qav = (swed.pldat[ipli].qrot + tdiff * swed.pldat[ipli].dqrot) * cos(dn)
            pav = (swed.pldat[ipli].qrot + tdiff * swed.pldat[ipli].dqrot) * sin(dn)
        } else {
            qav = swed.pldat[ipli].qrot + tdiff * swed.pldat[ipli].dqrot
            pav = swed.pldat[ipli].prot + tdiff * swed.pldat[ipli].dprot
        }
        /*calculate cosine and sine of average perihelion longitude. */
        for i in 0..<swed.pldat[ipli].ncoe {
            x[i][0] = swed.pldat[ipli].segp[i]
            x[i][1] = swed.pldat[ipli].segp[i+nco]
            x[i][2] = swed.pldat[ipli].segp[i+nco+nco]
        }
        if ((swed.pldat[ipli].iflg & SEI_FLG_ELLIPSE) > 0) {
//            refepx = swed.pldat[ipli].refep;
//            refepy = refepx + nco;
            omtild = swed.pldat[ipli].peri + tdiff * swed.pldat[ipli].dperi;
            i = (Int)(omtild / (2 * PI))
            omtild = omtild - (Double)(i) * (2 * PI)
            com = cos(omtild);
            som = sin(omtild);
            /*add reference orbit.  */
            for i in 0..<nco {
                x[i][0] = swed.pldat[ipli].segp[i] + com * swed.pldat[ipli].refep[i] - som * swed.pldat[ipli].refep[i + nco]
                x[i][1] = swed.pldat[ipli].segp[i + nco] + com * swed.pldat[ipli].refep[i + nco] + som * swed.pldat[ipli].refep[i]
            }
        }
        /* construct right handed orthonormal system with first axis along
         origin of longitudes and third axis along angular momentum
         this uses the standard formulas for equinoctal variables
         (see papers by broucke and by cefola).      */
        cosih2 = 1.0 / (1.0 + qav * qav + pav * pav)
        /*     calculate orbit pole. */
        uiz[0] = 2.0 * pav * cosih2
        uiz[1] = -2.0 * qav * cosih2
        uiz[2] = (1.0 - qav * qav - pav * pav) * cosih2
        /*     calculate origin of longitudes vector. */
        uix[0] = (1.0 + qav * qav - pav * pav) * cosih2
        uix[1] = 2.0 * qav * pav * cosih2
        uix[2] = -2.0 * pav * cosih2
        /*     calculate vector in orbital plane orthogonal to origin of
         longitudes.                                               */
        uiy[0] = 2.0 * qav * pav * cosih2
        uiy[1] = (1.0 - qav * qav + pav * pav) * cosih2
        uiy[2] = 2.0 * qav * cosih2
        /*     rotate to actual orientation in space.         */
        for i in 0..<nco {
            xrot = x[i][0] * uix[0] + x[i][1] * uiy[0] + x[i][2] * uiz[0]
            yrot = x[i][0] * uix[1] + x[i][1] * uiy[1] + x[i][2] * uiz[1]
            zrot = x[i][0] * uix[2] + x[i][1] * uiy[2] + x[i][2] * uiz[2]
            if (fabs(xrot) + fabs(yrot) + fabs(zrot) >= 1e-14) {
                swed.pldat[ipli].neval = i
            }
            x[i][0] = xrot;
            x[i][1] = yrot;
            x[i][2] = zrot;
            if (ipli == SEI_MOON) {
                /* rotate to j2000 equator */
                x[i][1] = ceps2000 * yrot - seps2000 * zrot;
                x[i][2] = seps2000 * yrot + ceps2000 * zrot;
            }
        }
        for i in 0..<nco {
            self.swed.pldat[ipli].segp[i] = x[i][0]
            self.swed.pldat[ipli].segp[i + nco] = x[i][1]
            self.swed.pldat[ipli].segp[i + 2 * nco] = x[i][2]
        }
    }

    func get_new_segment(tjd: Double, ipli: Int, ifno: Int, buf: Array<UInt8>) -> SweRet {
        let ret: SweRet = SweRet()
        var bufRet: SweRet = SweRet()
        var fpos: Int
        var idbl: Int
        var nco: Int = 0
        var nsizes: Int = 0
        var nsize: [Int] = [0, 0, 0, 0]
        var j: Int
        var k: Int
        var c: [UInt8] = [0, 0]
        var longs: [UInt] = []

//        let freord: Int = SEI_FILE_REORD
//        let fendian: Int = SEI_FILE_LITENDIAN

        /* compute segment number */
        let iseg: Int = (Int) ((tjd - swed.pldat[ipli].tfstart) / swed.pldat[ipli].dseg)

        swed.pldat[ipli].tseg0 = swed.pldat[ipli].tfstart + (Double)(iseg) * swed.pldat[ipli].dseg
        swed.pldat[ipli].tseg1 = swed.pldat[ipli].tseg0 + swed.pldat[ipli].dseg

        /* get file position of coefficients from file */
        fpos = swed.pldat[ipli].lndx0 + iseg * 3
        // tjd_ut = 2457605.0919465744の時
        // fpos = 06 e1 71
        var tmp: UInt
        tmp = UInt(buf[fpos + 2]) << 16
        tmp = tmp + UInt(buf[fpos + 1]) << 8
        tmp = tmp + UInt(buf[fpos])
        fpos = (Int)(tmp)


        /* clear space of chebyshew coefficients */
        swed.pldat[ipli].segp.removeAll()
        for _ in 0..<swed.pldat[ipli].ncoe*3*8 {
            swed.pldat[ipli].segp.append(0.0)
        }
        /* read coefficients for 3 coordinates */
        for icoord in 0..<3 {
            idbl = icoord * swed.pldat[ipli].ncoe
            /* first read header */
            /* first bit indicates number of sizes of packed coefficients */
            // 0x48, 0x75
            c[0] = buf[fpos]
            c[1] = buf[fpos + 1]
            fpos = fpos + 2
            if (c[0] > 128) {
                // todo
                /*
 nsizes = 6;
 retc = do_fread((void *) (c+2), 1, 2, 1, fp, SEI_CURR_FPOS, freord, fendian, ifno, serr);
 nsize[0] = (int) c[1] / 16
 nsize[1] = (int) c[1] % 16
 nsize[2] = (int) c[2] / 16
 nsize[3] = (int) c[2] % 16
 nsize[4] = (int) c[3] / 16
 nsize[5] = (int) c[3] % 16
 nco = nsize[0] + nsize[1] + nsize[2] + nsize[3] + nsize[4] + nsize[5]
 */

 
            } else {
                nsizes = 4
                let cTmp0: Int = (Int)(c[0])
                let cTmp1: Int = (Int)(c[1])
                nsize[0] = (Int)(cTmp0 / 16)
                nsize[1] = cTmp0 % 16
                nsize[2] = (Int)(cTmp1 / 16)
                nsize[3] = cTmp1 % 16
                nco = nsize[0] + nsize[1] + nsize[2] + nsize[3]
            }

            /* there may not be more coefficients than interpolation
             * order + 1 */
            // pdp->ncoe = 29
            if (nco > swed.pldat[ipli].ncoe) {
/*
                if (serr != NULL) {
                    sprintf(serr, "error in ephemeris file: %d coefficients instead of %d. ", nco, pdp->ncoe);
                    if (strlen(serr) + strlen(fdp->fnam) < AS_MAXCH - 1) {
                        sprintf(serr, "error in ephemeris file %s: %d coefficients instead of %d. ", fdp->fnam, nco, pdp->ncoe);
                    }
                }
                free(pdp->segp);
                pdp->segp = NULL;
                return (ERR);
*/
            }

            /* now unpack */
            // nsizes = 4
            for i in 0..<nsizes {
                if (nsize[i] == 0) {
                    continue
                }
                if (i < 4) {
                    j = (4 - i)
                    k = nsize[i]
                    longs.removeAll()
                    if (j == 4) {
                        for _ in 0..<k {
                            bufRet = do_fread(buf, index: fpos)
                            longs.append((UInt)(bufRet.tmp))
                            fpos = fpos + 4
                        }
                    } else if (j == 3) {
                        for _ in 0..<k {
                            tmp = UInt(buf[fpos + 2]) << 16
                            tmp = tmp + UInt(buf[fpos + 1]) << 8
                            tmp = tmp + UInt(buf[fpos])
                            longs.append((UInt)(tmp))
                            fpos = fpos + 3
                        }
                    } else if (j == 2) {
                        for _ in 0..<k {
                            tmp = UInt(buf[fpos + 1]) << 8
                            tmp = tmp + UInt(buf[fpos])
                            longs.append((UInt)(tmp))
                            fpos = fpos + 2
                        }
                    } else {
                        for _ in 0..<k {
                            tmp = UInt(buf[fpos])
                            longs.append((UInt)(tmp))
                            fpos = fpos + 1
                        }
                    }
                    
                    for m in 0..<k {
                        if ((longs[m] & 1) > 0) {   /* will be negative */
                            let half: Double = (Double)((longs[m] + 1) / 2)
                            swed.pldat[ipli].segp[idbl] = -1 * (half / 1e+9 * swed.pldat[ipli].rmax / 2)
                        } else {
                            let half: Double = (Double)(longs[m] / 2)
                            swed.pldat[ipli].segp[idbl] = (Double)(half / 1e+9 * swed.pldat[ipli].rmax / 2)
                        }
                        idbl = idbl + 1
                    }
                } else if (i == 4) {              /* half byte packing */
                    j = 1
                    k = (nsize[i] + 1) / 2
/*
                    retc = do_fread((void *) longs, j, k, 4, fp, SEI_CURR_FPOS, freord, fendian, ifno, serr);
                    if (retc != OK) {
                        goto return_error_gns;
                    }
*/
/*
                    for (m = 0, j = 0;
                         m < k && j < nsize[i];
                         m++) {
                        for (n = 0, o = 16;
                             n < 2 && j < nsize[i];
                             n++, j++, idbl++, longs[m] %= o, o /= 16) {
                            if (longs[m] & o) {
                                pdp->segp[idbl] =
                                    -(((longs[m]+o) / o / 2) * pdp->rmax / 2 / 1e+9);
                            } else {
                                pdp->segp[idbl] = (longs[m] / o / 2) * pdp->rmax / 2 / 1e+9;
                            }
                        }
                    }
*/
                } else if (i == 5) {              /* quarter byte packing */
                    j = 1
                    k = (nsize[i] + 3) / 4
/*
                    retc = do_fread((void *) longs, j, k, 4, fp, SEI_CURR_FPOS, freord, fendian, ifno, serr);
                    if (retc != OK) {
                        goto return_error_gns;
                    }
                    for (m = 0, j = 0;
                         m < k && j < nsize[i];
                         m++) {
                        for (n = 0, o = 64;
                             n < 4 && j < nsize[i];
                             n++, j++, idbl++, longs[m] %= o, o /= 4) {
                            if (longs[m] & o) {
                                pdp->segp[idbl] =
                                    -(((longs[m]+o) / o / 2) * pdp->rmax / 2 / 1e+9);
                            } else {
                                pdp->segp[idbl] = (longs[m] / o / 2) * pdp->rmax / 2 / 1e+9;
                            }
                        }
                    }
*/
                }
            }
        }

        return ret
    }

    func swi_fopen(ifno:Int, filename: String, ephepath: String) -> NSFileHandle {
        let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "se1")
        fileHandle = NSFileHandle(forReadingAtPath: path!)
        
        return fileHandle!
    }
    
    
    /* closes all open files, frees space of planetary data,
     * deletes memory of all computed positions
     */
    func swe_close () -> Void {
        // todo
        
    }

    func do_fread(buf: Array<UInt8>, index: Int) -> SweRet {
        let ret: SweRet = SweRet()
        var tmp: UInt
        
        tmp = UInt(buf[index + 3]) << 24
        tmp = tmp + UInt(buf[index + 2]) << 16
        tmp = tmp + UInt(buf[index + 1]) << 8
        tmp = tmp + UInt(buf[index])
        ret.tmp = tmp
        
        return ret
    }
    
    func do_fread2(buf: Array<UInt8>, index: Int) -> SweRet {
        let ret: SweRet = SweRet()
        var tmp: UInt
        
        tmp = UInt(buf[index + 1]) << 8
        tmp = tmp + UInt(buf[index])
        ret.tmp = tmp
        
        return ret
    }
    
    func do_fread8(buf: Array<UInt8>, index: Int) -> Double {
        var ret: Double = 0
        var tmp: Double = 0

        let b8: UInt8 = buf[index + 7]
        let b7: UInt8 = buf[index + 6]
        let b6: UInt8 = buf[index + 5]
        let b5: UInt8 = buf[index + 4]
        let b4: UInt8 = buf[index + 3]
        let b3: UInt8 = buf[index + 2]
        let b2: UInt8 = buf[index + 1]
        let b1: UInt8 = buf[index]

        let b8I: UInt = (UInt)(b8)
        let b7I: UInt = (UInt)(b7)
        let b6I: UInt = (UInt)(b6)
        let b5I: UInt = (UInt)(b5)
        let b4I: UInt = (UInt)(b4)
        let b3I: UInt = (UInt)(b3)
        let b2I: UInt = (UInt)(b2)
        let b1I: UInt = (UInt)(b1)

//        let b1S: Int = b1I & 0x0f
        /*
        let b2S: Int = b2I << 48
        let b3S: Int = b3I << 40
        let b4S: Int = b4I << 32
        let b5S: Int = b5I << 24
        let b6S: Int = b6I << 24
        let b7S: Int = b7I << 24
 */
        //        zzz = bbbTmp + cccTmp2 + dddTmp2 + eeeTmp2  + fffTmp2 + gggTmp2 + hhhTmp1
//        ret = (Double)(b2S + b3S + b4S + b5S + b6S + b7S + b8I)
        
        let sign: UInt = b8I & 0x80
        let e: UInt = ((b8I & 0x7f) << 4) + ((b7I & 0xf0) >> 4)
        let eI: Int = (Int)(e) - 1023
        
        ret = pow2(2, b: eI)
        var dbl: Double = 0.5
        var mask: UInt = 0x08
        for i in (0..<4).reverse() {
            tmp = tmp + dbl * (Double)((b7I & mask) >> (UInt)(i))
            dbl = dbl / 2
            mask = mask / 2
        }
        
        mask = 0x80
        for i in (0..<8).reverse() {
            tmp = tmp + dbl * (Double)((b6I & mask) >> (UInt)(i))
            dbl = dbl / 2
            mask = mask / 2
        }
        mask = 0x80
        for i in (0..<8).reverse() {
            tmp = tmp + dbl * (Double)((b5I & mask) >> (UInt)(i))
            dbl = dbl / 2
            mask = mask / 2
        }
        mask = 0x80
        for i in (0..<8).reverse() {
            tmp = tmp + dbl * (Double)((b4I & mask) >> (UInt)(i))
            dbl = dbl / 2
            mask = mask / 2
        }
        mask = 0x80
        for i in (0..<8).reverse() {
            tmp = tmp + dbl * (Double)((b3I & mask) >> (UInt)(i))
            dbl = dbl / 2
            mask = mask / 2
        }
        mask = 0x80
        for i in (0..<8).reverse() {
            tmp = tmp + dbl * (Double)((b2I & mask) >> (UInt)(i))
            dbl = dbl / 2
            mask = mask / 2
        }
        mask = 0x80
        for i in (0..<8).reverse() {
            tmp = tmp + dbl * (Double)((b1I & mask) >> (UInt)(i))
            dbl = dbl / 2
            mask = mask / 2
        }
        tmp = tmp + 1
        
        ret = ret * tmp

        if (sign == 1) {
            ret = ret * -1
        }
        
        return ret
    }
 
    /*  Evaluates a given chebyshev series coef[0..ncf-1]
     *  with ncf terms at x in [-1,1]. Communications of the ACM, algorithm 446,
     *  April 1973 (vol. 16 no.4) by Dr. Roger Broucke.
     */
    func swi_echeb(x: Double, coef:[Double], ncf: Int, index: Int) -> Double
    {
        let x2: Double = x * 2
        var br: Double = 0.0
        var brp2: Double = 0.0 /* dummy assign to silence gcc warning */
        var brpp: Double = 0.0
        
        for j in (0..<ncf).reverse() {
            brp2 = brpp
            brpp = br
            br = x2 * brpp - brp2 + coef[index + j]
        }
        
        return (br - brp2) * 0.5
    }
    
    /*
     * evaluates derivative of chebyshev series, see echeb
     */
    func swi_edcheb(x: Double, coef: [Double], ncf: Int, index: Int) -> Double
    {
        var bjpl: Double
        var xjpl: Double
        var x2: Double
        var bf: Double
        var bj: Double
        var dj: Double
        var xj: Double
        var bjp2: Double
        var xjp2: Double
        
        x2 = x * 2.0
        bf = 0.0      /* dummy assign to silence gcc warning */
        bj = 0.0      /* dummy assign to silence gcc warning */
        xjp2 = 0.0
        xjpl = 0.0
        bjp2 = 0.0
        bjpl = 0.0
        for j in (1..<ncf).reverse() {
            dj = (Double)(j + j)
            xj = coef[index + j] * dj + xjp2
            bj = x2 * bjpl - bjp2 + xj
            bf = bjp2
            bjp2 = bjpl
            bjpl = bj
            xjp2 = xjpl
            xjpl = xj
        }
        return (bj - bf) * 0.5
    }
    
    func swe_deltat_ex(swed: SweData, tjd: Double, iflag: Int) -> SweRet {
        var ret:SweRet = SweRet()
        
        if (swed.delta_t_userdef_is_set) {
            ret.deltat = swed.delta_t_userdef
            return ret
        }
        ret = calc_deltat(swed, tjd: tjd, iflag: iflag)
        return ret
    }
    
    func calc_deltat(swed: SweData, tjd: Double, iflag: Int) -> SweRet {
        let ret:SweRet = SweRet()
        let retc: SweRet
        let deltat_model: Int = swed.astro_models[SE_MODEL_DELTAT]
        var tid_acc: Double = 0
        let epheflag: Int = iflag & SEFLG_EPHMASK
        var B: Double = 0
        var Y: Double = 0
        var Ygreg: Double
        var ans: Double = 0
        var iy: Int = 0
        var dd: Double = 0
        
        /* with iflag == -1, we use default tid_acc */
        if (iflag == -1) {
            retc = swi_get_tid_acc(swed, tjd_ut: tjd, iflag: 0, denum: 9999) /* for default tid_acc */
            tid_acc = retc.tid_acc
            /* otherwise we use tid_acc consistent with epheflag */
        } else {
            retc = swi_set_tid_acc(tjd, iflag: epheflag, denum: 0)  /* _set_ saves tid_acc in swed */
            tid_acc = retc.tid_acc
        }
        
        /* read additional values from swedelta.txt */
        /*AS_BOOL use_espenak_meeus = DELTAT_ESPENAK_MEEUS_2006;*/
        Y = 2000.0 + (tjd - J2000)/365.25;
        Ygreg = 2000.0 + (tjd - J2000)/365.2425;
        /* Before 1633 AD, if the macro DELTAT_ESPENAK_MEEUS_2006 is TRUE:
         * Polynomials by Espenak & Meeus 2006, derived from Stephenson & Morrison
         * 2004.
         * Note, Espenak & Meeus use their formulae only from 2000 BC on.
         * However, they use the long-term formula of Morrison & Stephenson,
         * which can be used even for the remoter past.
         */
        /*if (use_espenak_meeus && tjd < 2317746.13090277789) */
        if (deltat_model == SEMOD_DELTAT_ESPENAK_MEEUS_2006 && tjd < 2317746.13090277789) {
            ret.deltat = deltat_espenak_meeus_1620(tjd, tid_acc: tid_acc);
            ret.iflag = iflag
            return ret
        }
        
        /* If the macro DELTAT_ESPENAK_MEEUS_2006 is FALSE:
         * Before 1620, we follow Stephenson & Morrsion 2004. For the tabulated
         * values 1000 BC through 1600 AD, we use linear interpolation.
         */
        if (Y < (Double)(TABSTART)) {
            if (Y < (Double)(TAB2_END)) {
                ret.deltat = deltat_stephenson_morrison_1600(tjd, tid_acc: tid_acc);
                return ret
            } else {
                /* between 1600 and 1620:
                 * linear interpolation between
                 * end of table dt2 and start of table dt */
                if (Y >= (Double)(TAB2_END)) {
                    B = (Double)(TABSTART - TAB2_END)
                    iy = (TAB2_END - TAB2_START) / TAB2_STEP
                    dd = (Y - (Double)(TAB2_END)) / B;
                    /*ans = dt2[iy] + dd * (dt[0] / 100.0 - dt2[iy]);*/
                    ans = (Double)(dt2[iy]) + dd * (dt[0] - (Double)(dt2[iy]))
                    ans = adjust_for_tidacc(ans, Y: Ygreg, tid_acc: tid_acc);
                    ret.deltat = ans / 86400.0;
                    return ret
                }
            }
        }
        
        /* 1620 - today + a few years (tabend):
         * Besselian interpolation from tabulated values in table dt.
         * See AA page K11.
         */
        if (Y >= (Double)(TABSTART)) {
            ret.deltat = deltat_aa(tjd, tid_acc);
            ret.iflag = iflag
            return ret
        }
        //        ret.deltat = 0
        //        ret.iflag = 0
        ret.deltat = ans / 86400.0
        return ret
    }
    
    func swi_set_tid_acc(tjd_ut: Double, iflag: Int, denum: Int) -> SweRet
    {
        var retc: SweRet = SweRet()
        retc.iflag = iflag
        /* manual tid_acc overrides automatic tid_acc */
        if (swed.is_tid_acc_manual) {
            return retc
        }
        retc = swi_get_tid_acc(swed, tjd_ut: tjd_ut, iflag: iflag, denum: denum)
        return retc
    }
    
    func swi_get_tid_acc(swed: SweData, tjd_ut: Double, iflag: Int, denum: Int) -> SweRet {
        //        var xx: [Double] = [0, 0, 0, 0, 0, 0]
        let ret: SweRet = SweRet()
        var retc: SweRet = SweRet()
        var tjd_et: Double = 0
        var ret_denum:Int = denum
        
        var iflagInt = iflag & SEFLG_EPHMASK
        if (swed.is_tid_acc_manual) {
            ret.tid_acc = swed.tid_acc
            return ret
        }
        if (denum == 0) {
            if ((iflag & SEFLG_MOSEPH) > 0) {
                ret.tid_acc = SE_TIDAL_DE404
                ret.denum = 404
                return ret
            }
            if ((iflag & SEFLG_JPLEPH) > 0) {
                // 対応しない
            }
            
            /* SEFLG_SWIEPH wanted or SEFLG_JPLEPH failed: */
            if (denum == 0) {
                tjd_et = tjd_ut; /* + swe_deltat_ex(tjd_ut, 0, NULL); we do not add
                 delta t, because it would result in a recursive
                 call of swi_set_tid_acc() */
                if (fileHandle == nil ||
                    tjd_et < swed.fidat[SEI_FILE_MOON].tfstart + 1 ||
                    tjd_et > swed.fidat[SEI_FILE_MOON].tfend - 1) {
                    iflagInt = SEFLG_SWIEPH
                    iflagInt = iflag | SEFLG_J2000
                    iflagInt = iflag | SEFLG_TRUEPOS
                    iflagInt = iflag | SEFLG_ICRS
                    retc = swe_calc(tjd_et, ipl: SE_MOON, iflag: iflag)
                }
                ret_denum = (Int)(swed.fidat[SEI_FILE_MOON].sweph_denum)
            }
        }
        
        switch(ret_denum) {
        case 200:
            ret.tid_acc = SE_TIDAL_DE200
            break
        case 403:
            ret.tid_acc = SE_TIDAL_DE403
            break
        case 404:
            ret.tid_acc = SE_TIDAL_DE404
            break
        case 405:
            ret.tid_acc = SE_TIDAL_DE405
            break
        case 406:
            ret.tid_acc = SE_TIDAL_DE406
            break
        case 421:
            ret.tid_acc = SE_TIDAL_DE421
            break
        case 422:
            ret.tid_acc = SE_TIDAL_DE422
            break
        case 430:
            ret.tid_acc = SE_TIDAL_DE430
            break
        case 431:
            ret.tid_acc = SE_TIDAL_DE431
            break
        default:
            ret_denum = SE_DE_NUMBER
            ret.tid_acc = SE_TIDAL_DEFAULT
            break
        }
        ret.denum = ret_denum
        return ret
    }
    
    
    /* Function initialises swed structure.
     * Returns 1 if initialisation is done, otherwise 0 */
    func swi_init_swed_if_start(swed: SweData) -> Int
    {
        // コンストラクタですべて初期化される
        return 0
    }
    
    func deltat_espenak_meeus_1620(tjd: Double, tid_acc: Double) -> Double {
        var ans: Double = 0
        var Ygreg: Double
        var u: Double
        
        /* double Y = 2000.0 + (tjd - J2000)/365.25;*/
        Ygreg = 2000.0 + (tjd - J2000)/365.2425;
        if (Ygreg < -500) {
            ans = deltat_longterm_morrison_stephenson(tjd)
        } else if (Ygreg < 500) {
            u = Ygreg / 100.0;
            ans = (((((0.0090316521 * u + 0.022174192) * u - 0.1798452) * u - 5.952053) * u + 33.78311) * u - 1014.41) * u + 10583.6;
        } else if (Ygreg < 1600) {
            u = (Ygreg - 1000) / 100.0;
            ans = (((((0.0083572073 * u - 0.005050998) * u - 0.8503463) * u + 0.319781) * u + 71.23472) * u - 556.01) * u + 1574.2;
        } else if (Ygreg < 1700) {
            u = Ygreg - 1600;
            ans = 120 - 0.9808 * u - 0.01532 * u * u + u * u * u / 7129.0;
        } else if (Ygreg < 1800) {
            u = Ygreg - 1700;
            ans = (((-u / 1174000.0 + 0.00013336) * u - 0.0059285) * u + 0.1603) * u + 8.83;
        } else if (Ygreg < 1860) {
            u = Ygreg - 1800;
            ans = ((((((0.000000000875 * u - 0.0000001699) * u + 0.0000121272) * u - 0.00037436) * u + 0.0041116) * u + 0.0068612) * u - 0.332447) * u + 13.72;
        } else if (Ygreg < 1900) {
            u = Ygreg - 1860;
            ans = ((((u / 233174.0 - 0.0004473624) * u + 0.01680668) * u - 0.251754) * u + 0.5737) * u + 7.62;
        } else if (Ygreg < 1920) {
            u = Ygreg - 1900;
            ans = (((-0.000197 * u + 0.0061966) * u - 0.0598939) * u + 1.494119) * u - 2.79
        } else if (Ygreg < 1941) {
            u = Ygreg - 1920;
            ans = 21.20 + 0.84493 * u - 0.076100 * u * u + 0.0020936 * u * u * u;
        } else if (Ygreg < 1961) {
            u = Ygreg - 1950;
            ans = 29.07 + 0.407 * u - u * u / 233.0 + u * u * u / 2547.0;
        } else if (Ygreg < 1986) {
            u = Ygreg - 1975;
            ans = 45.45 + 1.067 * u - u * u / 260.0 - u * u * u / 718.0;
        } else if (Ygreg < 2005) {
            u = Ygreg - 2000;
            ans = ((((0.00002373599 * u + 0.000651814) * u + 0.0017275) * u - 0.060374) * u + 0.3345) * u + 63.86;
        }
        ans = adjust_for_tidacc(ans, Y: Ygreg, tid_acc: tid_acc);
        ans /= 86400.0;
        return ans;
    }
    
    /* Astronomical Almanac table is corrected by adding the expression
     *     -0.000091 (ndot + 26)(year-1955)^2  seconds
     * to entries prior to 1955 (AA page K8), where ndot is the secular
     * tidal term in the mean motion of the Moon.
     *
     * Entries after 1955 are referred to atomic time standards and
     * are not affected by errors in Lunar or planetary theory.
     */
    func adjust_for_tidacc(ans: Double, Y: Double, tid_acc: Double) -> Double
    {
        var B: Double
        var ans_ret : Double = ans
        if( Y < 1955.0 ) {
            B = (Y - 1955.0)
            ans_ret = ans - 0.000091 * (tid_acc + 26.0) * B * B
        }
        return ans_ret
    }
    
    func deltat_longterm_morrison_stephenson(tjd: Double) -> Double
    {
        var Ygreg: Double =  2000.0 + (tjd - J2000)/365.2425
        var u: Double = (Ygreg  - 1820) / 100.0
        return (-20 + 32 * u * u)
    }
    
    func deltat_stephenson_morrison_1600(tjd: Double, tid_acc: Double) -> Double {
        var ans: Double = 0
        var ans2: Double = 0
        var ans3: Double = 0
        var dd: Double = 0
        var B: Double = 0
        var p: Double = 0
        var tjd0: Double = 0
        var iy: Int = 0
        let Y: Double = 2000.0 + (tjd - J2000)/365.2425
        /* double Y = 2000.0 + (tjd - J2000)/365.25;*/
        /* before -1000:
         * formula by Stephenson&Morrison (2004; p. 335) but adjusted to fit the
         * starting point of table dt2. */
        if( Y < (Double)(TAB2_START) ) {
            /*B = (Y - LTERM_EQUATION_YSTART) * 0.01;
             ans = -20 + LTERM_EQUATION_COEFF * B * B;*/
            ans = deltat_longterm_morrison_stephenson(tjd)
            ans = adjust_for_tidacc(ans, Y: Y, tid_acc: tid_acc);
            /* transition from formula to table over 100 years */
            if (Y >= (Double)(TAB2_START - 100)) {
                /* starting value of table dt2: */
                ans2 = adjust_for_tidacc((Double)(dt2[0]), Y: (Double)(TAB2_START), tid_acc: tid_acc)
                /* value of formula at epoch TAB2_START */
                /* B = (TAB2_START - LTERM_EQUATION_YSTART) * 0.01;
                 ans3 = -20 + LTERM_EQUATION_COEFF * B * B;*/
                tjd0 = (Double)((Double)(TAB2_START - 2000) * 365.2425 + J2000)
                ans3 = deltat_longterm_morrison_stephenson(tjd0)
                ans3 = adjust_for_tidacc(ans3, Y: Y, tid_acc: tid_acc)
                dd = ans3 - ans2
                B = (Y - (Double)(TAB2_START - 100)) * 0.01;
                /* fit to starting point of table dt2. */
                ans = ans - dd * B
            }
        }
        /* between -1000 and 1600:
         * linear interpolation between values of table dt2 (Stephenson&Morrison 2004) */
        if (Y >= (Double)(TAB2_START) && Y < (Double)(TAB2_END)) {
            let Yjul: Double = 2000 + (tjd - 2451557.5) / 365.25
            p = floor(Yjul)
            iy = (Int)(((Int)(p) - TAB2_START) / TAB2_STEP)
            dd = (Yjul - (Double)(TAB2_START + TAB2_STEP * iy)) / (Double)(TAB2_STEP)
            ans = (Double)(dt2[iy]) + (Double)(dt2[iy+1] - dt2[iy]) * dd
            /* correction for tidal acceleration used by our ephemeris */
            ans = adjust_for_tidacc(ans, Y: Y, tid_acc: tid_acc)
        }
        ans /= 86400.0;
        return ans;
    }
    
    /* SWISSEPH
     * generates name of ephemeris file
     * file name looks as follows:
     * swephpl.m30, where
     *
     * "sweph"                      "swiss ephemeris"
     * "pl","mo","as"               planet, moon, or asteroid
     * "m"  or "_"                  BC or AD
     *
     * "30"                         start century
     * tjd          = ephemeris file for which julian day
     * ipli         = number of planet
     * fname        = ephemeris file name
     */
    func swi_gen_filename(tjd:Double, ipli:Int) -> String {
        var ret: String
        var gregflag: Bool // グレゴリオかどうか
        var sgn: Int // 符号、BC(-1) or AD(1)
        var icty: Int = 0 // century
        var jyear: Int = 0
        let ncties: Int = 6 // 一つのse1ファイルに入っているcenturyの数
        
        switch(ipli) {
        case SEI_MOON:
            ret = "semo"
            break
        case SEI_EMB:
            fallthrough
        case SEI_MERCURY:
            fallthrough
        case SEI_VENUS:
            fallthrough
        case SEI_MARS:
            fallthrough
        case SEI_JUPITER:
            fallthrough
        case SEI_SATURN:
            fallthrough
        case SEI_URANUS:
            fallthrough
        case SEI_NEPTUNE:
            fallthrough
        case SEI_PLUTO:
            fallthrough
        case SEI_SUNBARY:
            ret = "sepl"
            break
        case SEI_CERES:
            fallthrough
        case SEI_PALLAS:
            fallthrough
        case SEI_JUNO:
            fallthrough
        case SEI_VESTA:
            fallthrough
        case SEI_CHIRON:
            fallthrough
        case SEI_PHOLUS:
            ret = "seas"
            break
        default:    /* asteroid */
            let num1: Double = double_t(ipli - SE_AST_OFFSET) / 1000
            let num1Str: String = num1.description
            let num2: Int = ipli - SE_AST_OFFSET
            let num2Str: String = num2.description
            ret = "ast" + num1Str + "/se" + num2Str + ".se1"
            return ret
            /* asteroids: only one file 3000 bc - 3000 ad */
            /* break; */
        }
        
        /* century of tjd */
        /* if tjd > 1600 then gregorian calendar */
        let swe_ret: SweRet
        if (tjd >= 2305447.5) {
            gregflag = true
            swe_ret = swe_date.swe_revjul(tjd, gregflag: gregflag)
            /* else julian calendar */
        } else {
            gregflag = false
            swe_ret = swe_date.swe_revjul(tjd, gregflag: gregflag)
        }
        jyear = swe_ret.date.year
        /* start century of file containing tjd */
        if (jyear < 0) {
            sgn = -1
        }
        else {
            sgn = 1
        }
        icty = jyear / 100
        if (sgn < 0 && jyear % 100 != 0) {
            icty -= 1
        }
        while(icty % ncties != 0) {
            icty = icty - 1
        }
        /* B.C. or A.D. */
        if (icty < 0) {
            ret = ret + "m"
        }
        else {
            ret = ret + "_"
        }
        icty = abs(icty)
        ret = ret + icty.description
        
        return ret
    }
    
    func deltat_aa(tjd: Double, tid_acc: Double) -> Double {
        
    }

    /* Read delta t values from external file.
     * record structure: year(whitespace)delta_t in 0.01 sec.
     */
    func init_dt() -> Int
    {
        if (!swed.init_dt_done) {
        }
    }
    
    func pow2(a: Double, b: Int) -> Double {
        var ret: Double = a
        let bb: UInt
        if (b >= 0) {
            bb = (UInt)(b)
        } else {
            // bが-1の時1/2=0.5となるのでa / 4、すなわち2回増える
            bb = (UInt)(abs(b)) + 2
        }
        
        if (b == 0) {
            return 1.0
        }
        if (b > 0) {
            for _ in 1..<bb {
                ret = ret * a
            }
        } else {
            for _ in 1..<bb {
                ret = ret / a
            }
        }
        
        return ret
    }
 
}
