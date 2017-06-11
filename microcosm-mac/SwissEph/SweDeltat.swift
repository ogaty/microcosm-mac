//
//  SweDeltat.swift
//  microcosm
//
//  Created by Yuji Ogata on 2017/03/31.
//  Copyright © 2017年 Yuji Ogata. All rights reserved.
//

import Cocoa

class SweDeltat: NSObject {

    /* Astronomical Almanac table is corrected by adding the expression
     *     -0.000091 (ndot + 26)(year-1955)^2  seconds
     * to entries prior to 1955 (AA page K8), where ndot is the secular
     * tidal term in the mean motion of the Moon.
     *
     * Entries after 1955 are referred to atomic time standards and
     * are not affected by errors in Lunar or planetary theory.
     */
    func adjust_for_tidacc(_ ans: Double, Y: Double, tid_acc: Double) -> Double
    {
        var B: Double
        var ans_ret : Double = ans
        if( Y < 1955.0 ) {
            B = (Y - 1955.0)
            ans_ret = ans - 0.000091 * (tid_acc + 26.0) * B * B
        }
        return ans_ret
    }
    
    func deltat_longterm_morrison_stephenson(_ tjd: Double) -> Double
    {
        let Ygreg: Double =  2000.0 + (tjd - J2000)/365.2425
        let u: Double = (Ygreg  - 1820) / 100.0
        return (-20 + 32 * u * u)
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
    
    func deltat_stephenson_morrison_1600(_ tjd: Double, tid_acc: Double) -> Double {
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
    


}
