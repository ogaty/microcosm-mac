//
//  SwissSid.swift
//  microcosm
//
//  Created by Yuji Ogata on 2017/03/31.
//  Copyright © 2017年 Yuji Ogata. All rights reserved.
//

import Cocoa

class SwissSid: NSObject {

    var swed: SweData = SweData()
    var hcalc: SwissHCalc = SwissHCalc()
    var hlib: SwissHLib = SwissHLib()

    let SEMOD_SIDT_LONGTERM: Int = 1
    let SE_MODEL_SIDT: Int = 3


    func swe_sidtime0(tjd: Double, eps: Double, nut: Double ) -> Double
    {
        var jd: Double = 0
        var jd0: Double = 0
        var jdrel: Double = 0
        var tu: Double = 0
        var tt: Double = 0
        var secs: Double = 0
        var gmst: Double = 0
        var msday: Double = 0
        var dadd: Double = 0
        var eqeq: Double = 0
        var prec_model_short: Int = swed.astro_models[SE_MODEL_PREC_SHORTTERM];
        var sidt_model: Int = swed.astro_models[SE_MODEL_SIDT];
        if (prec_model_short == 0)  {
            prec_model_short = SEMOD_PREC_DEFAULT_SHORT;
        }
        if (sidt_model == 0) {
            sidt_model = SEMOD_SIDT_DEFAULT;
        }
        hcalc.swi_init_swed_if_start()
        if (sidt_model == SEMOD_SIDT_LONGTERM) {
            if (tjd <= SIDT_LTERM_T0 || tjd >= SIDT_LTERM_T1) {
                //                gmst = sidtime_long_term(tjd, eps, nut);
                if (tjd <= SIDT_LTERM_T0) {
                    gmst -= SIDT_LTERM_OFS0;
                }
                else if (tjd >= SIDT_LTERM_T1) {
                    gmst -= SIDT_LTERM_OFS1;
                }
                if (gmst >= 24) {
                    gmst -= 24;
                }
                if (gmst < 0) {
                    gmst += 24;
                }
                //                goto sidtime_done;
            }
        }
        /* Julian day at given UT */
        jd = tjd;
        jd0 = floor(jd);
        secs = tjd - jd0;
        if( secs < 0.5 ) {
            jd0 -= 0.5;
            secs += 0.5;
        } else {
            jd0 += 0.5;
            secs -= 0.5;
        }
        secs *= 86400.0;
        tu = (jd0 - J2000)/36525.0; /* UT1 in centuries after J2000 */
        if (sidt_model == SEMOD_SIDT_IERS_CONV_2010 || sidt_model == SEMOD_SIDT_LONGTERM) {
            /*  ERA-based expression for for Greenwich Sidereal Time (GST) based
             *  on the IAU 2006 precession */
            jdrel = tjd - J2000;
            let deltaRet: SweRet = swe_deltat_ex(tjd, iflag: -1)
            tt = (tjd + deltaRet.tmpDbl6[0] - J2000) / 36525.0;
            gmst = hlib.swe_degnorm((0.7790572732640 + 1.00273781191135448 * jdrel) * 360);
            gmst += (0.014506 + tt * (4612.156534 +  tt * (1.3915817 + tt * (-0.00000044 + tt * (-0.000029956 + tt * -0.0000000368))))) / 3600.0;
            dadd = hcalc.sidtime_non_polynomial_part(tt: tt);
            gmst = hlib.swe_degnorm(gmst + dadd);
            /*printf("gmst iers=%f \n", gmst);*/
            gmst = gmst / 15.0 * 3600.0;
            /* sidt_model == SEMOD_SIDT_PREC_MODEL, older standards according to precession model */
        } else if (prec_model_short >= SEMOD_PREC_IAU_2006) {
            let deltaRet: SweRet = swe_deltat_ex(tjd, iflag: -1)
            tt = (jd0 + deltaRet.tmpDbl6[0] - J2000)/36525.0; /* TT in centuries after J2000 */
            gmst = (((-0.000000002454*tt - 0.00000199708)*tt - 0.0000002926)*tt + 0.092772110)*tt*tt + 307.4771013*(tt-tu) + 8640184.79447825*tu + 24110.5493771;
            /* mean solar days per sidereal day at date tu;
             * for the derivative of gmst, we can assume UT1 =~ TT */
            msday = 1 + ((((-0.000000012270*tt - 0.00000798832)*tt - 0.0000008778)*tt + 0.185544220)*tt + 8640184.79447825)/(86400.0*36525.0);
            gmst += msday * secs;
            /* SEMOD_SIDT_IAU_1976 */
        } else {  /* IAU 1976 formula */
            /* Greenwich Mean Sidereal Time at 0h UT of date */
            gmst = (( -6.2e-6*tu + 9.3104e-2)*tu + 8640184.812866)*tu + 24110.54841;
            /* mean solar days per sidereal day at date tu, = 1.00273790934 in 1986 */
            msday = 1.0 + ((-1.86e-5*tu + 0.186208)*tu + 8640184.812866)/(86400.0*36525.0);
            gmst += msday * secs;
        }
        /* Local apparent sidereal time at given UT at Greenwich */
        eqeq = 240.0 * nut * cos(eps * DEG_TO_RAD);
        gmst = gmst + eqeq  /* + 240.0*tlong */;
        /* Sidereal seconds modulo 1 sidereal day */
        gmst = gmst - 86400.0 * floor( gmst/86400.0 );
        /* return in hours */
        gmst /= 3600;
        return gmst
    }
    
    func swe_deltat_ex(_ tjd: Double, iflag: Int) -> SweRet {
        var ret:SweRet = SweRet()
        
        if (swed.delta_t_userdef_is_set) {
            ret.deltat = swed.delta_t_userdef
            return ret
        }
        ret = calc_deltat(swed, tjd: tjd, iflag: iflag)
        return ret
    }
    
    func calc_deltat(_ swed: SweData, tjd: Double, iflag: Int) -> SweRet {
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
            ret.deltat = deltat_aa(tjd, tid_acc: tid_acc);
            ret.iflag = iflag
            return ret
        }
        //        ret.deltat = 0
        //        ret.iflag = 0
        ret.deltat = ans / 86400.0
        return ret
    }

    func swi_get_tid_acc(_ swed: SweData, tjd_ut: Double, iflag: Int, denum: Int) -> SweRet {
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
            if ((iflagInt & SEFLG_MOSEPH) > 0) {
                ret.tid_acc = SE_TIDAL_DE404
                ret.denum = 404
                return ret
            }
            if ((iflagInt & SEFLG_JPLEPH) > 0) {
                // 対応しない
            }
            
            /* SEFLG_SWIEPH wanted or SEFLG_JPLEPH failed: */
            if (denum == 0) {
                tjd_et = tjd_ut; /* + swe_deltat_ex(tjd_ut, 0, NULL); we do not add
                 delta t, because it would result in a recursive
                 call of swi_set_tid_acc() */
                if (swed.fidat[SEI_FILE_MOON].fileHandle == nil ||
                    tjd_et < swed.fidat[SEI_FILE_MOON].tfstart + 1 ||
                    tjd_et > swed.fidat[SEI_FILE_MOON].tfend - 1) {
                    iflagInt = SEFLG_SWIEPH
                    iflagInt = iflag | SEFLG_J2000
                    iflagInt = iflag | SEFLG_TRUEPOS
                    iflagInt = iflag | SEFLG_ICRS
                    retc = swe_calc(tjd_et, ipl: SE_MOON, iflag: iflagInt)
                    if (retc.iflag == ERR) {
                        return retc
                    }
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

    func deltat_espenak_meeus_1620(_ tjd: Double, tid_acc: Double) -> Double {
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

}
