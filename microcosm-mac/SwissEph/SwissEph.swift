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

let SE_AST_OFFSET = 10000

let SEFLG_SPEED3 = 128
/* speed from 3 positions (do not use it,
 SEFLG_SPEED is faster and more precise.) */
let SEFLG_SPEED	= 256     /* high precision speed  */

let SEFLG_EQUATORIAL = (2*1024)    /* equatorial positions are wanted */
let SEFLG_XYZ        = (4*1024)    /* cartesian, not polar, coordinates */
let SEFLG_RADIANS    = (8*1024)    /* coordinates in radians, not degrees */

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

let DO_SAVE = true

let SE_GREG_CAL = true

let DEGTORAD = 0.0174532925199433

let AS_MAXCH = 256

class SwissEph: NSObject {

    var swe_date: SweDate
    
    var swed: SweData // struct swe_data
    var swe_ret: SweRet // 戻り値用
    var sd_idx : Int // sdポインタのindex
    var xs_idx : Int // xsポインタのindex
    var fileName: String
    var fileHandle: NSFileHandle? // FiilePointer

    override init() {
        swe_date = SweDate()
        swed = SweData()
        swe_ret = SweRet()
        sd_idx = 0
        xs_idx = 0
        fileName = ""
        fileHandle = nil
    }
    
    // tjd : Julian day, Universal time
    // ipl : body number(SUN, MOON, etc)
    // iflag : setting flags
    // xx: array(longitude, latitude, distance, speed in lng, speed in lat, speed in dist)
    // 本移植版ではiflag,serr,xxをクラスにぶちこんで返す
    func swe_calc ( tjd: Double, ipl: Int, iflag: Int) -> SweRet {
        var i: Int
        var j: Int
        var iflagInt : Int = Int(iflag)
        var iflagSave : Int = Int(iflag)
        var epheflag: Int
        var epheflag_sv: Int
        var iflgcoor: Int
        var x: [Double] = [0, 0, 0, 0, 0, 0]
        var dt: Double
        var iplInt:Int = ipl
        
        epheflag_sv = 0
        
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
        var deltatRet:SweRet = swe_deltat_ex(tjd_ut, iflag: iflag)
        var retval:SweRet = swe_calc(tjd_ut + deltatRet.deltat, ipl: ipl, iflag: iflag)
        /* if ephe required is not ephe returned, adjust delta t: */
        if ((retval.iflag & SEFLG_EPHMASK) != epheflag) {
            deltatRet = swe_deltat_ex(tjd_ut, iflag: iflag)
            retval = swe_calc(tjd_ut + deltatRet.deltat, ipl: ipl, iflag: iflagInt)
        }

        return retval
    }
    
    func swe_deltat_ex(tjd: Double, iflag: Int) -> SweRet {
        var ret:SweRet
        
//        if (swed.delta_t_userdef_is_set) {
//            return swed.delta_t_userdef;
//        }
        ret = calc_deltat(tjd, iflag: iflag);
        return ret
    }
    
    func calc_deltat(tjd: Double, iflag: Int) -> SweRet {
        let ret:SweRet = SweRet()
        // todo
        
        ret.deltat = 0
        ret.iflag = 0
        return ret
    }

    func swe_set_ephe_path(path: String) {
        swed.ephe_path_is_set = true
        // todo
        
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
        let ret:SweRet = SweRet()
        var do_earth: Bool = false
        var do_sunbary: Bool = false
        var do_moon: Bool = false
        var xpm: [Double] = [0, 0, 0, 0, 0, 0]
        var i: Int

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
            do_sunbary = true
        }
        if (do_save || ipli == SEI_MOON || ipli == SEI_EARTH) {
            do_moon = true
        }
        /* barycentric sun */
        if (do_sunbary) {
            // 後回し
        }
        
        /* moon */
        if (do_moon) {
            if (tjd == swed.pldat[SEI_MOON].teval) {
                for i in 0..<6 {
                    xpm[i] = swed.pldat[SEI_MOON].x[i]
                }
            } else {
                let retc: SweRet = sweph(tjd, ipli: SEI_MOON, ifno: SEI_FILE_MOON, iflag: iflag, do_save: do_save)
                if (retc.iflag == ERR) {
                    return retc
                }
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
        } else if (ipli == SEI_EARTH) {
        } else if (ipli == SEI_SUN) {
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
    func sweph(tjd: Double, ipli: Int, ifno: Int, iflag: Int, do_save: Bool) -> SweRet
    {
        let ret:SweRet = SweRet()
        var ipl:Int = 0
        var xx:[Double] = [0, 0, 0, 0, 0, 0]
        
        if (ipli > SE_AST_OFFSET) {
            ipl = SEI_ANYBODY
        }
        let pdp: PlanData = swed.pldat[ipl]
        if (do_save) {
//            xp = pdp->x;
        }
        else {
//            xp = xx
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
        if (fileHandle != nil) {
            /* if tjd is beyond file range, close old file.
             * if new asteroid, close old file. */
//            if (tjd < fdp->tfstart || tjd > fdp->tfend
//                || (ipl == SEI_ANYBODY && ipli != pdp->ibdy)) {
//                fclose(fdp->fptr);
//                fdp->fptr = NULL;
//                if (pdp->refep != NULL)
//                free((void *) pdp->refep);
//                pdp->refep = NULL;
//                if (pdp->segp != NULL)
//                free((void *) pdp->segp);
//                pdp->segp = NULL;
//            }
        }
        if (fileHandle == nil) {
            fileName = swi_gen_filename(tjd, ipli: ipli)
            fileHandle = swi_fopen(ifno, filename: fileName, ephepath: swed.ephepath)
        }
        
        read_const(ifno)
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
        let fdp = swed.fidat[ifno]
        var index: Int
        
        var aBuffer = Array<Int8>(count: data.length, repeatedValue: 0)
        data.getBytes(&aBuffer, length: data.length)
        if (aBuffer[0] != 83 || aBuffer[1] != 87 || aBuffer[2] != 73 || aBuffer[3] != 83 || aBuffer[4] != 83) { // SWISS
            ret.serr = "file damage."
        }
        var i: Int = 0
        var lfCnt: Int = 0
        // validate面倒なのでlf３回カウントまで進める
        while (aBuffer[i] != 10 && lfCnt < 3) {
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
        
        /**********************************************************
         * DE number of JPL ephemeris which this file is based on *
         **********************************************************/
        var tmp: Int = Int(aBuffer[index]) << 24
        tmp = tmp + Int(aBuffer[index + 1]) << 16
        tmp = tmp + Int(aBuffer[index + 2]) << 8
        tmp = tmp + Int(aBuffer[index + 3])

        swed.fidat[ifno].sweph_denum = tmp
        index = index + 4
        
        tmp = Int(aBuffer[index]) << 56
        tmp = tmp + Int(aBuffer[index + 1]) << 48
        tmp = tmp + Int(aBuffer[index + 2]) << 40
        tmp = tmp + Int(aBuffer[index + 3]) << 32
        tmp = tmp + Int(aBuffer[index + 4]) << 24
        tmp = tmp + Int(aBuffer[index + 5]) << 16
        tmp = tmp + Int(aBuffer[index + 6]) << 8
        tmp = tmp + Int(aBuffer[index + 7])
        swed.fidat[ifno].tfstart = tmp
        index = index + 8

        tmp = Int(aBuffer[index]) << 56
        tmp = tmp + Int(aBuffer[index + 1]) << 48
        tmp = tmp + Int(aBuffer[index + 2]) << 40
        tmp = tmp + Int(aBuffer[index + 3]) << 32
        tmp = tmp + Int(aBuffer[index + 4]) << 24
        tmp = tmp + Int(aBuffer[index + 5]) << 16
        tmp = tmp + Int(aBuffer[index + 6]) << 8
        tmp = tmp + Int(aBuffer[index + 7])
        swed.fidat[ifno].tfend = tmp
        index = index + 8

        /*************************************
         * how many planets are in file?     *
         *************************************/
        tmp = Int(aBuffer[index]) << 8
        tmp = tmp + Int(aBuffer[index + 1])
        index = index + 2

        var nplan = tmp
        var nbytes_ipl:Int = 0
        if (nplan > 256) {
            nbytes_ipl = 4
            nplan = nplan % 256
        } else {
            nbytes_ipl = 2
        }
        
        /* which ones?                       */
        if (nbytes_ipl == 4) {
            tmp = Int(aBuffer[index]) << 24
            tmp = tmp + Int(aBuffer[index + 1]) << 16
            tmp = tmp + Int(aBuffer[index + 2]) << 8
            tmp = tmp + Int(aBuffer[index + 3])
            index = index + 4
        } else {
            tmp = Int(aBuffer[index]) << 8
            tmp = tmp + Int(aBuffer[index + 1])
            index = index + 2
        }
        swed.fidat[ifno].ipl = tmp
        
        if (ifno == SEI_FILE_ANY_AST) {
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

        /*************************************
         * read general constants            *
         *************************************/
        /* clight, aunit, helgravconst, ratme, sunradius
         * these constants are currently not in use */
        // 8 * 5 = 40バイト
        tmp = 0
        var doubles: [Double] = []
        for cnt in 0..<5 {
            for j in 0..<7 {
                tmp = tmp + Int(aBuffer[index + cnt * 5 + j])
            }
            doubles[cnt] = Double(tmp)
            tmp = 0
        }
        index = index + 40

        /*************************************
         * read constants of planets         *
         *************************************/
        
        return ret
    }
    
    func do_fread() -> SweRet {
        let ret: SweRet = SweRet()
        
        return ret
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
            ret = "sepl"
            break
        case SEI_MERCURY:
            ret = "sepl"
            break
        case SEI_VENUS:
            ret = "sepl"
            break
        case SEI_MARS:
            ret = "sepl"
            break
        case SEI_JUPITER:
            ret = "sepl"
            break
        case SEI_SATURN:
            ret = "sepl"
            break
        case SEI_URANUS:
            ret = "sepl"
            break
        case SEI_NEPTUNE:
            ret = "sepl"
            break
        case SEI_PLUTO:
            ret = "sepl"
            break
        case SEI_SUNBARY:
            ret = "sepl"
            break
        case SEI_CERES:
            ret = "seas"
            break;
        case SEI_PALLAS:
            ret = "seas"
            break;
        case SEI_JUNO:
            ret = "seas"
            break;
        case SEI_VESTA:
            ret = "seas"
            break;
        case SEI_CHIRON:
            ret = "seas"
            break;
        case SEI_PHOLUS:
            ret = "seas"
            break;
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
        ret = ret + icty.description + ".se1"

        return ret
    }

    func swi_fopen(ifno:Int, filename: String, ephepath: String) -> NSFileHandle {
        fileHandle = NSFileHandle(forReadingAtPath: ephepath + fileName)
        
        return fileHandle!
    }
    
    
    /* closes all open files, frees space of planetary data,
     * deletes memory of all computed positions
     */
    func swe_close () -> Void {
        // todo
        
    }
}
