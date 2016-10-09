//
//  SwissHCalc.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/10/07.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class SwissHCalc: NSObject {
    
    var hlib: SwissHLib = SwissHLib()

    func CalcH(
        _ th: Double, fi: Double, ekl: Double, hsy: String,
        iteration_count: Int) -> SweRet {
        /* *********************************************************
         *  Arguments: th = sidereal time (angle 0..360 degrees
         *             hsy = letter code for house system;
         *                   A  equal
         *                   E  equal
         *                   B  Alcabitius
         *                   C  Campanus
         *                   D  equal (MC)
         *                   F  Carter "Poli-Equatorial"
         *                   G  36 Gauquelin sectors
         *                   H  horizon / azimut
         *                   I  Sunshine solution Treindl
         *                   i  Sunshine solution Makransky
         *                   K  Koch
         *                   L  Pullen SD "sinusoidal delta", ex Neo-Porphyry
         *                   M  Morinus
         *                   N  equal/1=Aries
         *                   O  Porphyry
         *                   P  Placidus
         *                   Q  Pullen SR "sinusoidal ratio"
         *                   R  Regiomontanus
         *                   S  Sripati
         *                   T  Polich/Page ("topocentric")
         *                   U  Krusinski-Pisa-Goelzer
         *                   V  equal Vehlow
         *                   W  equal, whole sign
         *                   X  axial rotation system/ Meridian houses
         *                   Y  APC houses
         *             fi = geographic latitude
         *             ekl = obliquity of the ecliptic
         *             iteration_count = number of iterations in
         *             Placidus calculation; can be 1 or 2.
         * *********************************************************
         *  Koch and Placidus don't work in the polar circle.
         *  We swap MC/IC so that MC is always before AC in the zodiac
         *  We than divide the quadrants into 3 equal parts.
         * *********************************************************
         *  All angles are expressed in degrees.
         *  Special trigonometric functions sind, cosd etc. are
         *  implemented for arguments in degrees.
         ***********************************************************/
        var cosa: Double
        var cose: Double
        var cosfi: Double
        var sina: Double
        var sine: Double
        var tane: Double
        var tanfi: Double
        var tant: Double
        var acmc: Double
        var rad = ekl * PI / 180
        var fi1 : Double = fi
        var fh1: Double
        var fh2: Double
        var th1: Double
        var th2: Double
        var xh1: Double
        var xh2: Double
        var ad3: Double
        var ra: Double
        var ih2: Int
        var krHorizonLon: Double
        var a: Double
        var c: Double
        var j: Int
        var f: Double
        var r: Double
        var x: Double
        var rectasc: Double
        var vemc: Double
        var retc: SweRet = SweRet()
        var hsp: Houses = Houses()
        cose  = cos(rad);
        sine  = sin(rad);
        tane  = tan(rad);
        /* north and south poles */
        if (fabs(fabs(fi) - 90) < VERY_SMALL) {
            if (fi < 0) {
                fi1 = -90 + VERY_SMALL;
            }
            else {
                fi1 = 90 - VERY_SMALL;
            }
        }
        var fi2 : Double = fi1 * PI / 180
        tanfi = tan(fi2);
        /* mc */
        if (fabs(th - 90) > VERY_SMALL
            && fabs(th - 270) > VERY_SMALL) {
            var th1: Double = th * PI / 180
            tant = tan(th1);
            var tmp: Double = tant / cose
            
            hsp.mc = atan(tmp);
            hsp.mc = hsp.mc * 180 / PI
            if (th > 90 && th <= 270) {
                hsp.mc = hlib.swe_degnorm(hsp.mc + 180);
            }
        } else {
            if (fabs(th - 90) <= VERY_SMALL) {
                hsp.mc = 90;
            }
            else {
                hsp.mc = 270;
            }
        } /*  if */
        hsp.mc = hlib.swe_degnorm(hsp.mc);
        /* ascendant */
        hsp.ac = Asc1(th + 90, f: fi, sine: sine, cose: cose);
        hsp.cusp[1] = hsp.ac;
        hsp.cusp[10] = hsp.mc;
        /* we respect smaller case letter for i, otherwise they are deprecated */
        //        if (hsy > 95 && hsy != "i") {
        //            sprintf(hsp->serr, "use of lower case letters like %c for house systems is deprecated", hsy);
        //            hsy = (char) (hsy - 32);/* translate into capital letter */
        //        }
        switch (hsy) {
        case "A":     /* equal houses */
            fallthrough
        case "E":
            acmc = swe_difdeg2n(hsp.ac, p2: hsp.mc);
            if (acmc < 0) {
                /* within polar circle we swap AC/DC if AC is on wrong side */
                hsp.ac = hlib.swe_degnorm(hsp.ac + 180);
                hsp.cusp[1] = hsp.ac;
            }
            for i in 2..<13 {
                hsp.cusp[i] = hlib.swe_degnorm(hsp.cusp[1] + (Double)((i-1) * 30));
            }
            break;
        case "D":     /* equal, begin  at MC */
            acmc = swe_difdeg2n(hsp.ac, p2: hsp.mc);
            if (acmc < 0) {
                /* within polar circle we swap AC/DC if AC is on wrong side */
                hsp.ac = hlib.swe_degnorm(hsp.ac + 180);
            }
            hsp.cusp[10] = hsp.mc;
            for i in 11..<13 {
                hsp.cusp[i] = hlib.swe_degnorm(hsp.cusp[10] + (Double)((i-10) * 30));
            }
            for i in 1..<10 {
                hsp.cusp[i] = hlib.swe_degnorm(hsp.cusp[10] + (Double)((i + 2) * 30));
            }
            break;
        case "C": /* Campanus houses and Horizon or Azimut system */
            fallthrough
        case "H":
            if (hsy == "H") {
                if (fi1 > 0) {
                    fi1 = 90 - fi1;
                }
                else {
                    fi1 = -90 - fi1;
                }
                /* equator */
                if (fabs(fabs(fi1) - 90) < VERY_SMALL) {
                    if (fi1 < 0) {
                        fi1 = -90 + VERY_SMALL;
                    }
                    else {
                        fi1 = 90 - VERY_SMALL;
                    }
                }
                th1 = hlib.swe_degnorm(th + 180);
            }
            fh1 = asind(sind (fi) / 2);
            fh2 = asind(sqrt (3.0) / 2 * sind(fi));
            cosfi = cosd(fi);
            if (fabs(cosfi) == 0) {     /* '==' should be save! */
                if (fi > 0) {
                    xh1 = 90
                    xh2 = 90; /* cosfi = VERY_SMALL; */
                }
                else {
                    xh1 = 270
                    xh2 = 270; /* cosfi = -VERY_SMALL; */
                }
            } else {
                xh1 = atand(sqrt (3.0) / cosfi);
                xh2 = atand(1 / sqrt (3.0) / cosfi);
            }
            hsp.cusp[11] = Asc1(th + 90 - xh1, f: fh1, sine: sine, cose: cose);
            hsp.cusp[12] = Asc1(th + 90 - xh2, f: fh2, sine: sine, cose: cose);
            if (hsy == "H") {
                hsp.cusp[1] = Asc1(th + 90, f: fi, sine: sine, cose: cose);
            }
            hsp.cusp[2] = Asc1(th + 90 + xh2, f: fh2, sine: sine, cose: cose);
            hsp.cusp[3] = Asc1(th + 90 + xh1, f: fh1, sine: sine, cose: cose);
            /* within polar circle, when mc sinks below horizon and
             * ascendant changes to western hemisphere, all cusps
             * must be added 180 degrees.
             * houses will be in clockwise direction */
            if (fabs(fi) >= 90 - ekl) {  /* within polar circle */
                acmc = swe_difdeg2n(hsp.ac, p2: hsp.mc);
                if (acmc < 0) {
                    hsp.ac = hlib.swe_degnorm(hsp.ac + 180);
                    hsp.mc = hlib.swe_degnorm(hsp.mc + 180);
                    for i in 1..<13 {
                        if (i >= 4 && i < 10) {
                            continue
                        }
                        hsp.cusp[i] = hlib.swe_degnorm(hsp.cusp[i] + 180);
                    }
                }
            }
            if (hsy == "H") {
                for i in 1..<4 {
                    hsp.cusp[i] = hlib.swe_degnorm(hsp.cusp[i] + 180);
                }
                for i in 11..<13 {
                    hsp.cusp[i] = hlib.swe_degnorm(hsp.cusp[i] + 180);
                }
                /* restore fi and th */
                if (fi > 0) {
                    fi1 = 90 - fi;
                }
                else {
                    fi1 = -90 - fi;
                }
                th1 = hlib.swe_degnorm(th + 180);
                acmc = swe_difdeg2n(hsp.ac, p2: hsp.mc);
                if (acmc < 0) {
                    hsp.ac = hlib.swe_degnorm(hsp.ac + 180);
                }
            }
            break;
        case "I": /* Sunshine houses, solution Treindl */
            fallthrough
        case "i": /* Sunshine houses, solution Makranski */
            acmc = swe_difdeg2n(hsp.ac, p2: hsp.mc);
            if (acmc < 0) {
                /* we shift axes */
                hsp.ac = hlib.swe_degnorm(hsp.ac + 180);
                hsp.cusp[1] = hsp.ac;
                if (hsy == "I") {
                    hsp.mc = hlib.swe_degnorm(hsp.mc + 180);
                    hsp.cusp[10] = hsp.mc;
                }
            }
            hsp.cusp[4] = hlib.swe_degnorm(hsp.cusp[10] + 180);
            hsp.cusp[7] = hlib.swe_degnorm(hsp.cusp[1] + 180);
            if (hsy == "I") {
                retc = sunshine_solution_treindl(th, lat: fi, ecl: ekl);
            } else {
                retc = sunshine_solution_makransky(th, lat: fi, ecl: ekl);
            }
            if (retc.iflag == ERR) {  // only Makransky version does this
                //                strcpy(hsp->serr, "within polar circle, switched to Porphyry");
                //                hsy = "O";
                //                goto porphyry;
            }
            break;
        case "K": /* Koch houses */
            if (fabs(fi) >= 90 - ekl) {  /* within polar circle */
                //                retc = ERR;
                //                strcpy(hsp->serr, "within polar circle, switched to Porphyry");
                //                goto porphyry;
            }
            sina = sind(hsp.mc) * sine / cosd(fi);
            if (sina > 1) {
                sina = 1;
            }
            if (sina < -1) {
                sina = -1;
            }
            cosa = sqrt(1 - sina * sina);               /* always >> 0 */
            c = atand(tanfi / cosa);
            ad3 = asind(sind(c) * sina) / 3.0;
            hsp.cusp[11] = Asc1(th + 30 - 2 * ad3, f: fi, sine: sine, cose: cose);
            hsp.cusp[12] = Asc1(th + 60 - ad3, f: fi, sine: sine, cose: cose);
            hsp.cusp[2] = Asc1(th + 120 + ad3, f: fi, sine: sine, cose: cose);
            hsp.cusp[3] = Asc1(th + 150 + 2 * ad3, f: fi, sine: sine, cose: cose);
            break;
        case "L":     /* Pullen SD sinusoidal delta, ex Neo-Porphyry */
            var d: Double
            var q1: Double;
            acmc = swe_difdeg2n(hsp.ac, p2: hsp.mc);
            if (acmc < 0) {
                /* within polar circle we swap AC/DC if AC is on wrong side */
                hsp.ac = hlib.swe_degnorm(hsp.ac + 180);
                hsp.cusp[1] = hsp.ac;
                acmc = swe_difdeg2n(hsp.ac, p2: hsp.mc);
            }
            q1 = 180 - acmc;
            d = (acmc - 90) / 4.0;
            if (acmc <= 30) { // is quadrant <= 30, house 11 = zero width.
                hsp.cusp[11] = hlib.swe_degnorm(hsp.mc + acmc / 2);
                hsp.cusp[12] = hlib.swe_degnorm(hsp.mc + acmc / 2);
            } else {
                hsp.cusp[11] = hlib.swe_degnorm(hsp.mc + 30 + d);
                hsp.cusp[12] = hlib.swe_degnorm(hsp.mc + 60 + 3 * d);
            }
            d = (q1 - 90) / 4.0;
            if (q1 <= 30) {   // is quadrant <= 30, house 2 = zero width.
                hsp.cusp[2] = hlib.swe_degnorm(hsp.ac + q1 / 2);
                hsp.cusp[3] = hlib.swe_degnorm(hsp.ac + q1 / 2);
            } else {
                hsp.cusp[2] = hlib.swe_degnorm(hsp.ac + 30 + d);
                hsp.cusp[3] = hlib.swe_degnorm(hsp.ac + 60 + 3 * d);
            }
            break;
        case "N":     /* whole signs, begin at 0° Aries */
            acmc = swe_difdeg2n(hsp.ac, p2: hsp.mc);
            if (acmc < 0) {
                /* within polar circle we swap AC/DC if AC is on wrong side */
                hsp.ac = hlib.swe_degnorm(hsp.ac + 180);
            }
            for i in 1..<13 {
                hsp.cusp[i] = (Double)(i - 1) * 30.0;
            }
            break;
        case "O":     /* Porphyry houses */
            //            porphyry:
            acmc = swe_difdeg2n(hsp.ac, p2: hsp.mc);
            if (acmc < 0) {
                /* within polar circle we swap AC/DC if AC is on wrong side */
                hsp.ac = hlib.swe_degnorm(hsp.ac + 180);
                hsp.cusp[1] = hsp.ac;
                acmc = swe_difdeg2n(hsp.ac, p2: hsp.mc);
            }
            hsp.cusp[2] = hlib.swe_degnorm(hsp.ac + (180 - acmc) / 3);
            hsp.cusp[3] = hlib.swe_degnorm(hsp.ac + (180 - acmc) / 3 * 2);
            hsp.cusp[11] = hlib.swe_degnorm(hsp.mc + acmc / 3);
            hsp.cusp[12] = hlib.swe_degnorm(hsp.mc + acmc / 3 * 2);
            break;
        case "Q":     /* Pullen sinusoidal ratio */
            var q: Double
            var c: Double
            var csq: Double
            var ccr: Double
            var cqx: Double
            var r: Double
            var r1: Double
            var r2: Double
            //                double two23, third, x, xr, xr3, xr4;
            var x: Double
            var xr: Double
            var xr3: Double
            var xr4: Double
            let third: Double = 1.0 / 3.0;
            let two23: Double = pow(2.0 * 2.0, third);        // 2^(2/3)
            acmc = swe_difdeg2n(hsp.ac, p2: hsp.mc);
            if (acmc < 0) {
                /* within polar circle we swap AC/DC if AC is on wrong side */
                hsp.ac = hlib.swe_degnorm(hsp.ac + 180);
                hsp.cusp[1] = hsp.ac;
                acmc = swe_difdeg2n(hsp.ac, p2: hsp.mc);
            }
            q = acmc;
            if (q > 90) {
                q = 180 - q;
            }
            if (q < 1e-30) {    // degenerate case of quadrant = zer0
                r = 99999999999999;
                x = 0
                xr = 0
                xr3 = 0;
                xr4 = 180;
            } else {
                c = (180 - q) / q;
                csq = c * c;
                ccr = pow(csq - c, third);          // cuberoot(c^2 -c)
                cqx = sqrt(two23 * ccr + 1.0);      // sqrt{2^(2/3)*cuberoot(c^2-c) + 1}
                r1 = 0.5 * cqx;
                r2 = 0.5 * sqrt(-2*(1-2*c) / cqx - two23 * ccr + 2);
                r = r1 + r2 - 0.5;
                x = q / (2 * r + 1);
                xr = r * x;
                xr3 = xr * r * r;
                xr4 = xr3 * r;
            }
            if (acmc > 90) {
                hsp.cusp[11] = hlib.swe_degnorm(hsp.mc + xr3);     // house 10 and 12 size xr^3
                hsp.cusp[12] = hlib.swe_degnorm(hsp.cusp[11] + xr4);       // house 11 size xr^4
                hsp.cusp[2] = hlib.swe_degnorm(hsp.ac + xr);       // house 1 and 3 size xr
                hsp.cusp[3] = hlib.swe_degnorm(hsp.cusp[2] + x);   // house 2 size x
            } else {
                hsp.cusp[11] = hlib.swe_degnorm(hsp.mc + xr);      // house 10 and 12 size xr
                hsp.cusp[12] = hlib.swe_degnorm(hsp.cusp[11] + x); // house 11 size x
                hsp.cusp[2] = hlib.swe_degnorm(hsp.ac + xr3);      // house 1 and 3 size xr^3
                hsp.cusp[3] = hlib.swe_degnorm(hsp.cusp[2] + xr4); // house 2 size xr^4
            }
            break;
        case "R":     /* Regiomontanus houses */
            fh1 = atand (tanfi * 0.5);
            fh2 = atand (tanfi * cosd(30));
            hsp.cusp[11] = Asc1(30 + th, f: fh1, sine: sine, cose: cose);
            hsp.cusp[12] = Asc1(60 + th, f: fh2, sine: sine, cose: cose);
            hsp.cusp[2] = Asc1(120 + th, f: fh2, sine: sine, cose: cose);
            hsp.cusp[3] = Asc1(150 + th, f: fh1, sine: sine, cose: cose);
            /* within polar circle, when mc sinks below horizon and
             * ascendant changes to western hemisphere, all cusps
             * must be added 180 degrees.
             * houses will be in clockwise direction */
            if (fabs(fi) >= 90 - ekl) {  /* within polar circle */
                acmc = swe_difdeg2n(hsp.ac, p2: hsp.mc);
                if (acmc < 0) {
                    hsp.ac = hlib.swe_degnorm(hsp.ac + 180);
                    hsp.mc = hlib.swe_degnorm(hsp.mc + 180);
                    for i in 1..<13 {
                        if (i >= 4 && i < 10) {
                            continue;
                        }
                        hsp.cusp[i] = hlib.swe_degnorm(hsp.cusp[i] + 180);
                    }
                }
            }
            break;
        case "S":     /* Sripati houses */
            /* uses Porphyry sectors, but then takes middle of sectors as cusps */
            //                double s1, s4, q1;
            var q1: Double
            var s1: Double
            var s4: Double
            acmc = swe_difdeg2n(hsp.ac, p2: hsp.mc);    // size of 4th quadrant
            if (acmc < 0) {
                /* within polar circle we swap AC/DC if AC is on wrong side */
                hsp.ac = hlib.swe_degnorm(hsp.ac + 180);
                acmc = swe_difdeg2n(hsp.ac, p2: hsp.mc);
            }
            q1 = 180 - acmc;  // size of 1st quadrant
            s1 = q1 / 3.0;
            s4 = acmc / 3.0;
            hsp.cusp[1] = hlib.swe_degnorm(hsp.ac - s4 * 0.5);
            hsp.cusp[2] = hlib.swe_degnorm(hsp.ac + s1 * 0.5);
            hsp.cusp[3] = hlib.swe_degnorm(hsp.ac + s1 * 1.5);
            hsp.cusp[10] = hlib.swe_degnorm(hsp.mc - s1 * 0.5);
            hsp.cusp[11] = hlib.swe_degnorm(hsp.mc + s4 * 0.5);
            hsp.cusp[12] = hlib.swe_degnorm(hsp.mc + s4 * 1.5);
            break;
        case "T":     /* 'topocentric' houses */
            fh1 = atand (tanfi / 3.0);
            fh2 = atand (tanfi * 2.0 / 3.0);
            hsp.cusp[11] =  Asc1(30 + th, f: fh1, sine: sine, cose: cose);
            hsp.cusp[12] =  Asc1(60 + th, f: fh2, sine: sine, cose: cose);
            hsp.cusp[2] =  Asc1(120 + th, f: fh2, sine: sine, cose: cose);
            hsp.cusp[3] =  Asc1(150 + th, f: fh1, sine: sine, cose: cose);
            /* within polar circle, when mc sinks below horizon and
             * ascendant changes to western hemisphere, all cusps
             * must be added 180 degrees.
             * houses will be in clockwise direction */
            if (fabs(fi) >= 90 - ekl) {  /* within polar circle */
                acmc = swe_difdeg2n(hsp.ac, p2: hsp.mc);
                if (acmc < 0) {
                    hsp.ac = hlib.swe_degnorm(hsp.ac + 180);
                    hsp.mc = hlib.swe_degnorm(hsp.mc + 180);
                    for i in 1..<13 {
                        hsp.cusp[i] = hlib.swe_degnorm(hsp.cusp[i] + 180);
                    }
                }
            }
            break;
        case "V":     /* equal houses after Vehlow */
            acmc = swe_difdeg2n(hsp.ac, p2: hsp.mc);
            if (acmc < 0) {
                /* within polar circle we swap AC/DC if AC is on wrong side */
                hsp.ac = hlib.swe_degnorm(hsp.ac + 180);
                hsp.cusp[1] = hsp.ac;
            }
            hsp.cusp[1] = hlib.swe_degnorm(hsp.ac - 15);
            for i in 2..<13 {
                hsp.cusp[i] = hlib.swe_degnorm(hsp.cusp[1] + (Double)(i-1) * 30);
            }
            break;
        case "W":     /* equal, whole-sign houses */
            acmc = swe_difdeg2n(hsp.ac, p2: hsp.mc);
            if (acmc < 0) {
                /* within polar circle we swap AC/DC if AC is on wrong side */
                hsp.ac = hlib.swe_degnorm(hsp.ac + 180);
                hsp.cusp[1] = hsp.ac;
            }
            hsp.cusp[1] = hsp.ac - fmod(hsp.ac, 30);
            for i in 2..<13 {
                hsp.cusp[i] = hlib.swe_degnorm(hsp.cusp[1] + (Double)(i-1) * 30);
            }
            break;
        case "X":
            /*
             * Meridian or axial rotation system:
             * ecliptic points whose rectascensions
             * are armc + n * 30
             */
            //            int j;
            //            double a = th;
            a = th
            for i in 1..<13 {
                j = i + 10;
                if (j > 12) {
                    j -= 12;
                }
                a = hlib.swe_degnorm(a + 30);
                if (fabs(a - 90) > VERY_SMALL
                    && fabs(a - 270) > VERY_SMALL) {
                    tant = tand(a);
                    hsp.cusp[j] = atand(tant / cose);
                    if (a > 90 && a <= 270) {
                        hsp.cusp[j] = hlib.swe_degnorm(hsp.cusp[j] + 180);
                    }
                } else {
                    if (fabs(a - 90) <= VERY_SMALL) {
                        hsp.cusp[j] = 90;
                    }
                    else {
                        hsp.cusp[j] = 270;
                    }
                } /*  if */
                hsp.cusp[j] = hlib.swe_degnorm(hsp.cusp[j]);
            }
            acmc = swe_difdeg2n(hsp.ac, p2: hsp.mc);
            if (acmc < 0) {
                hsp.ac = hlib.swe_degnorm(hsp.ac + 180);
            }
            break;
        case "M":
            /*
             * Morinus
             * points of the equator (armc + n * 30) are transformed
             * into the ecliptic coordinate system
             */
            a = th;
            var x: [Double] = [0, 0, 0]
            for i in 1..<13 {
                j = i + 10;
                if (j > 12) {
                    j -= 12;
                }
                a = hlib.swe_degnorm(a + 30);
                x[0] = a;
                x[1] = 0;
                swe_cotrans(x, xpn: x, eps: ekl);
                hsp.cusp[j] = x[0];
            }
            acmc = swe_difdeg2n(hsp.ac, p2: hsp.mc);
            if (acmc < 0) {
                hsp.ac = hlib.swe_degnorm(hsp.ac + 180);
            }
            break;
        case "F":
            /*
             * Carter poli-equatorial
             * Rectascension a of ascendant is the starting point.
             * house cusps nh on the ecliptic are the points where
             * great circles through points of the equator (a + (nh -1) * 30)
             * and the poles intersect it.
             */
            //            double a, ra;
            //            double x[3];
            var x: [Double] = [0, 0, 0]
            acmc = swe_difdeg2n(hsp.ac, p2: hsp.mc);
            if (acmc < 0) {
                /* within polar circle we swap AC/DC if AC is on wrong side */
                hsp.ac = hlib.swe_degnorm(hsp.ac + 180);
                hsp.cusp[1] = hsp.ac;
            }
            x[0] = hsp.ac;
            x[1] = 0;
            swe_cotrans(x, xpn: x, eps: -ekl);
            a = x[0];   /* rectascension of ascendant */
            for i in 2..<13 {
                if (i <= 3 || i >= 10) {
                    ra = hlib.swe_degnorm(a + (Double)(i - 1) * 30);
                    if (fabs(ra - 90) > VERY_SMALL
                        && fabs(ra - 270) > VERY_SMALL) {
                        tant = tand(ra);
                        hsp.cusp[i] = atand(tant / cose);
                        if (ra > 90 && ra <= 270) {
                            hsp.cusp[i] = hlib.swe_degnorm(hsp.cusp[i] + 180);
                        }
                    } else {
                        if (fabs(ra - 90) <= VERY_SMALL) {
                            hsp.cusp[i] = 90;
                        }
                        else {
                            hsp.cusp[i] = 270;
                        }
                    } /*  if */
                    hsp.cusp[i] = hlib.swe_degnorm(hsp.cusp[i]);
                }
            }
            break;
        case "B":   /* Alcabitius */
            /* created by Alois 17-sep-2000, followed example in Matrix
             electrical library. The code reproduces the example!
             I think the Alcabitius code in Walter Pullen's Astrolog 5.40
             is wrong, because he remains in RA and forgets the transform to
             the ecliptic. */
            //            double dek, r, sna, sda, sn3, sd3;
            var dek: Double
            var sda: Double
            var sna: Double
            var sd3: Double
            var sn3: Double
            acmc = swe_difdeg2n(hsp.ac, p2: hsp.mc);
            if (acmc < 0) {
                hsp.ac = hlib.swe_degnorm(hsp.ac + 180);
                hsp.cusp[1] = hsp.ac;
                acmc = swe_difdeg2n(hsp.ac, p2: hsp.mc);
            }
            dek = asind(sind(hsp.ac) * sine);  /* declination of Ascendant */
            /* must treat the case fi == 90 or -90 */
            r = -tanfi * tand(dek);
            /* must treat the case of abs(r) > 1; probably does not happen
             * because dek becomes smaller when fi is large, as ac is close to
             * zero Aries/Libra in that case.
             */
            sda = acos(r) * RAD_TO_DEG;   /* semidiurnal arc, measured on equator */
            sna = 180 - sda;            /* complement, seminocturnal arc */
            sd3 = sda / 3;
            sn3 = sna / 3;
            rectasc = hlib.swe_degnorm(th + sd3);    /* cusp 11 */
            /* project rectasc onto eclipitic with pole height 0, i.e. along the
             declination circle */
            hsp.cusp[11] = Asc1(rectasc, f: 0, sine: sine, cose: cose);
            rectasc = hlib.swe_degnorm(th + 2 * sd3);        /* cusp 12 */
            hsp.cusp[12] = Asc1(rectasc, f: 0, sine: sine, cose: cose);
            rectasc = hlib.swe_degnorm(th + 180 - 2 * sn3);  /* cusp 2 */
            hsp.cusp[2] = Asc1(rectasc, f: 0, sine: sine, cose: cose);
            rectasc = hlib.swe_degnorm(th + 180 -  sn3);     /* cusp 3 */
            hsp.cusp[3] = Asc1(rectasc, f: 0, sine: sine, cose: cose);
            break;
        case "G":     /* 36 Gauquelin sectors */
            for i in 1..<37 {
                hsp.cusp[i] = 0;
            }
            if (fabs(fi) >= 90 - ekl) {  /* within polar circle */
                retc.iflag = ERR;
                //                strcpy(hsp->serr, "within polar circle, switched to Porphyry");
                //                goto porphyry;
                return retc
            }
            /*************** forth/second quarter ***************/
            /* note: Gauquelin sectors are counted in clockwise direction */
            a = asind(tand(fi) * tane);
            for ih in 2..<10 {
                ih2 = 10 - ih;
                fh1 = atand(sind(a * (Double)(ih2) / 9) / tane);
                rectasc = hlib.swe_degnorm((90 / 9) * (Double)(ih2) + th);
                tant = tand(asind(sine * sind(Asc1(rectasc, f: fh1, sine: sine, cose: cose))));
                if (fabs(tant) < VERY_SMALL) {
                    hsp.cusp[ih] = rectasc;
                } else {
                    /* pole height */
                    f = atand(sind(asind(tanfi * tant) * (Double)(ih2) / 9) / tant);
                    hsp.cusp[ih] = Asc1(rectasc, f: f, sine: sine, cose: cose);
                    for i in 1..<iteration_count {
                        tant = tand(asind(sine * sind(hsp.cusp[ih])));
                        if (fabs(tant) < VERY_SMALL) {
                            hsp.cusp[ih] = rectasc;
                            break;
                        }
                        /* pole height */
                        f = atand(sind(asind(tanfi * tant) * (Double)(ih2) / 9) / tant);
                        hsp.cusp[ih] = Asc1(rectasc, f: f, sine: sine, cose: cose);
                    }
                }
                hsp.cusp[ih+18] = hlib.swe_degnorm(hsp.cusp[ih] + 180);
            }
            /*************** first/third quarter ***************/
            for ih in 29..<37 {
                ih2 = ih - 28;
                fh1 = atand(sind(a * (Double)(ih2) / 9) / tane);
                rectasc = hlib.swe_degnorm(180 - (Double)(ih2) * 90 / 9 + th);
                tant = tand(asind(sine * sind(Asc1(rectasc, f: fh1, sine: sine, cose: cose))));
                if (fabs(tant) < VERY_SMALL) {
                    hsp.cusp[ih] = rectasc;
                } else {
                    f = atand(sind(asind(tanfi * tant) * (Double)(ih2) / 9) / tant);
                    /*  pole height */
                    hsp.cusp[ih] = Asc1(rectasc, f: f, sine: sine, cose: cose);
                    for _ in 1..<iteration_count+1 {
                        tant = tand(asind(sine * sind(hsp.cusp[ih])));
                        if (fabs(tant) < VERY_SMALL) {
                            hsp.cusp[ih] = rectasc;
                            break;
                        }
                        f = atand(sind(asind(tanfi * tant) * (Double)(ih2) / 9) / tant);
                        /*  pole height */
                        hsp.cusp[ih] = Asc1(rectasc, f: f, sine: sine, cose: cose);
                    }
                }
                hsp.cusp[ih-18] = hlib.swe_degnorm(hsp.cusp[ih] + 180);
            }
            hsp.cusp[1] = hsp.ac;
            hsp.cusp[10] = hsp.mc;
            hsp.cusp[19] = hlib.swe_degnorm(hsp.ac + 180);
            hsp.cusp[28] = hlib.swe_degnorm(hsp.mc + 180);
            break;
        case "U": /* Krusinski-Pisa */
            /*
             * The following code was written by Bogdan Krusinski in 2006.
             * bogdan@astrologia.pl
             *
             * Definition:
             * "Krusinski - house system based on the great circle passing through
             * ascendant and zenith. This circle is divided into 12 equal parts
             * (1st cusp is ascendent, 10th cusp is zenith), then the resulting
             * points are projected onto the ecliptic through meridian circles.
             * The house cusps in space are half-circles perpendicular to the equator
             * and running from the north to the south celestial pole through the
             * resulting cusp points on the house circle. The points where they
             * cross the ecliptic mark the ecliptic house cusps."
             *
             * Description of the algorithm:
             * Transform into great circle running through Asc and zenit (where arc
             * between Asc and zenith is always 90 deg), and then return with
             * house cusps into ecliptic. Eg. solve trigonometrical triangle
             * with three transformations and two rotations starting from ecliptic.
             * House cusps in space are meridian circles.
             *
             * Notes:
             * 1. In this definition we assume MC on ecliptic as point where
             *    half-meridian (from north to south pole) cuts ecliptic,
             *    so MC may be below horizon in arctic regions.
             * 2. Houses could be calculated in all latitudes except the poles
             *    themselves (-90,90) and points on arctic circle in cases where
             *    ecliptic is equal to horizon and then ascendant is undefined.
             *    But ascendant when 'horizon=ecliptic' could be deduced as limes
             *    from both sides of that point and houses with that provision can
             *    be computed also there.
             *
             * Starting values for calculations:
             *     - Asc ecliptic longitude
             *     - right ascension of MC (RAMC)
             *     - geographic latitude.
             */
            /*
             * within polar circle we swap AC/DC if AC is on wrong side
             */
            acmc = swe_difdeg2n(hsp.ac, p2: hsp.mc);
            if (acmc < 0) {
                hsp.ac = hlib.swe_degnorm(hsp.ac + 180);
            }
            var x: [Double] = [0, 0, 0]
            
            /* A0. Start point - ecliptic coords of ascendant */
            x[0] = hsp.ac; /* Asc longitude   */
            x[1] = 0.0;     /* Asc declination */
            x[2] = 1.0;     /* Radius to test validity of subsequent transformations. */
            swe_cotrans(x, xpn: x, eps: -ekl);      /* A1. Transform into equatorial coords */
            x[0] = x[0] - (th-90);        /* A2. Rotate                           */
            swe_cotrans(x, xpn: x, eps: -(90-fi));  /* A3. Transform into horizontal coords */
            krHorizonLon = x[0];          /* ...save asc lon on horizon to get back later with house cusp */
            x[0] = x[0] - x[0];           /* A4. Rotate                           */
            swe_cotrans(x, xpn: x, eps: -90);       /* A5. Transform into this house system great circle (asc-zenith) */
            /* As it is house circle now, simple add 30 deg increments... */
            for i in 0..<6 {
                /* B0. Set 'n-th' house cusp.
                 *     Note that IC/MC are also calculated here to check
                 *     if really this is the asc-zenith great circle. */
                x[0] = (Double)(30*i);
                x[1] = 0.0;
                swe_cotrans(x, xpn: x, eps: 90);                 /* B1. Transform back into horizontal coords */
                x[0] = x[0] + krHorizonLon;            /* B2. Rotate back.                          */
                swe_cotrans(x, xpn: x, eps: 90-fi);              /* B3. Transform back into equatorial coords */
                x[0] = hlib.swe_degnorm(x[0] + (th-90));    /* B4. Rotate back -> RA of house cusp as result. */
                /* B5. Where's this house cusp on ecliptic? */
                /* ... so last but not least - get ecliptic longitude of house cusp: */
                hsp.cusp[i+1] = atand(tand(x[0])/cosd(ekl));
                if (x[0] > 90 && x[0] <= 270) {
                    hsp.cusp[i+1] = hlib.swe_degnorm(hsp.cusp[i+1] + 180);
                }
                if (x[0] > 90 && x[0] <= 270) {
                    hsp.cusp[i+1] = hlib.swe_degnorm(hsp.cusp[i+1] + 180);
                }
                hsp.cusp[i+1] = hlib.swe_degnorm(hsp.cusp[i+1]);
                hsp.cusp[i+7] = hlib.swe_degnorm(hsp.cusp[i+1]+180);
            }
            break;
        case "Y":     /* APC houses */
            for i in 1..<13 {
                hsp.cusp[i] = apc_sector(i, ph: fi * DEG_TO_RAD, e: ekl * DEG_TO_RAD, az: th * DEG_TO_RAD);
            }
            //hsp->ac = hsp->cusp[1];
            //hsp->mc = hsp->cusp[10];
            /* note the MC provided by apc_sector() near latitude 90 is not accurate */
            hsp.cusp[10] = hsp.mc;
            hsp.cusp[4] = hlib.swe_degnorm(hsp.mc + 180);
            /* within polar circle, when mc sinks below horizon and
             * ascendant changes to western hemisphere, all cusps
             * must be added 180 degrees.
             * houses will be in clockwise direction */
            if (fabs(fi) >= 90 - ekl) {  /* within polar circle */
                acmc = swe_difdeg2n(hsp.ac, p2: hsp.mc);
                if (acmc < 0) {
                    hsp.ac = hlib.swe_degnorm(hsp.ac + 180);
                    hsp.mc = hlib.swe_degnorm(hsp.mc + 180);
                    for i in 1..<13 {
                        hsp.cusp[i] = hlib.swe_degnorm(hsp.cusp[i] + 180);
                    }
                }
            }
            break;
        default:      /* Placidus houses */
            if (fabs(fi) >= 90 - ekl) {  /* within polar circle */
                retc.iflag = ERR;
                //                strcpy(hsp->serr, "within polar circle, switched to Porphyry");
                //                goto porphyry;
                return retc
            }
            a = asind(tand(fi) * tane);
            fh1 = atand(sind(a / 3) / tane);
            fh2 = atand(sind(a * 2 / 3) / tane);
            /* ************  house 11 ******************** */
            rectasc = hlib.swe_degnorm(30 + th);
            tant = tand(asind(sine * sind(Asc1(rectasc, f: fh1, sine: sine, cose: cose))));
            if (fabs(tant) < VERY_SMALL) {
                hsp.cusp[11] = rectasc;
            } else {
                /* pole height */
                f = atand(sind(asind(tanfi * tant) / 3)  / tant);
                hsp.cusp[11] = Asc1(rectasc, f: f, sine: sine, cose: cose);
                for _ in 1..<iteration_count+1 {
                    tant = tand(asind(sine * sind(hsp.cusp[11])));
                    if (fabs(tant) < VERY_SMALL) {
                        hsp.cusp[11] = rectasc;
                        break;
                    }
                    /* pole height */
                    f = atand(sind(asind(tanfi * tant) / 3) / tant);
                    hsp.cusp[11] = Asc1(rectasc, f: f, sine: sine, cose: cose);
                }
            }
            /* ************  house 12 ******************** */
            rectasc = hlib.swe_degnorm(60 + th);
            tant = tand(asind(sine*sind(Asc1(rectasc,  f: fh2, sine: sine, cose: cose))));
            if (fabs(tant) < VERY_SMALL) {
                hsp.cusp[12] = rectasc;
            } else {
                f = atand(sind(asind(tanfi * tant) / 1.5) / tant);
                /*  pole height */
                hsp.cusp[12] = Asc1(rectasc, f: f, sine: sine, cose: cose);
                for _ in 1..<iteration_count+1 {
                    tant = tand(asind(sine * sind(hsp.cusp[12])));
                    if (fabs(tant) < VERY_SMALL) {
                        hsp.cusp[12] = rectasc;
                        break;
                    }
                    f = atand(sind(asind(tanfi * tant) / 1.5) / tant);
                    /*  pole height */
                    hsp.cusp[12] = Asc1(rectasc, f: f, sine: sine, cose: cose);
                }
            }
            /* ************  house  2 ******************** */
            rectasc = hlib.swe_degnorm(120 + th);
            tant = tand(asind(sine * sind(Asc1(rectasc, f: fh2, sine: sine, cose: cose))));
            if (fabs(tant) < VERY_SMALL) {
                hsp.cusp[2] = rectasc;
            } else {
                f = atand(sind(asind(tanfi * tant) / 1.5) / tant);
                /*  pole height */
                hsp.cusp[2] = Asc1(rectasc, f: f, sine: sine, cose: cose);
                for _ in 1..<iteration_count+1 {
                    tant = tand(asind(sine * sind(hsp.cusp[2])));
                    if (fabs(tant) < VERY_SMALL) {
                        hsp.cusp[2] = rectasc;
                        break;
                    }
                    f = atand(sind(asind(tanfi * tant) / 1.5) / tant);
                    /*  pole height */
                    hsp.cusp[2] = Asc1(rectasc, f: f, sine: sine, cose: cose);
                }
            }
            /* ************  house  3 ******************** */
            rectasc = hlib.swe_degnorm(150 + th);
            tant = tand(asind(sine * sind(Asc1(rectasc, f: fh1, sine: sine, cose: cose))));
            if (fabs(tant) < VERY_SMALL) {
                hsp.cusp[3] = rectasc;
            } else {
                f = atand(sind(asind(tanfi * tant) / 3) / tant);
                /*  pole height */
                hsp.cusp[3] = Asc1(rectasc, f: f, sine: sine, cose: cose);
                for _ in 1..<iteration_count+1 {
                    tant = tand(asind(sine * sind(hsp.cusp[3])));
                    if (fabs(tant) < VERY_SMALL) {
                        hsp.cusp[3] = rectasc;
                        break;
                    }
                    f = atand(sind(asind(tanfi * tant) / 3) / tant);
                    /*  pole height */
                    hsp.cusp[3] = Asc1(rectasc, f: f, sine: sine, cose: cose);
                }
            }
            break;
        } /* end switch */
        if (hsy != "G" && hsy != "Y" && hsy != "I" && hsy != "i") {
            hsp.cusp[4] = hlib.swe_degnorm(hsp.cusp[10] + 180);
            hsp.cusp[5] = hlib.swe_degnorm(hsp.cusp[11] + 180);
            hsp.cusp[6] = hlib.swe_degnorm(hsp.cusp[12] + 180);
            hsp.cusp[7] = hlib.swe_degnorm(hsp.cusp[1] + 180);
            hsp.cusp[8] = hlib.swe_degnorm(hsp.cusp[2] + 180);
            hsp.cusp[9] = hlib.swe_degnorm(hsp.cusp[3] + 180);
        }
        /* vertex */
        if (fi >= 0) {
            f = 90 - fi;
        }
        else {
            f = -90 - fi;
        }
        hsp.vertex = Asc1(th - 90, f: f, sine: sine, cose: cose);
        /* with tropical latitudes, the vertex behaves strange,
         * in a similar way as the ascendant within the polar
         * circle. we keep it always on the western hemisphere.*/
        if (fabs(fi) <= ekl) {
            vemc = swe_difdeg2n(hsp.vertex, p2: hsp.mc);
            if (vemc > 0) {
                hsp.vertex = hlib.swe_degnorm(hsp.vertex + 180);
            }
        }
        /*
         * some strange points:
         */
        /* equasc (equatorial ascendant) */
        th2 = hlib.swe_degnorm(th + 90);
        if (fabs(th2 - 90) > VERY_SMALL
            && fabs(th2 - 270) > VERY_SMALL) {
            tant = tand(th2);
            hsp.equasc = atand(tant / cose);
            if (th2 > 90 && th2 <= 270) {
                hsp.equasc = hlib.swe_degnorm(hsp.equasc + 180);
            }
        } else {
            if (fabs(th2 - 90) <= VERY_SMALL) {
                hsp.equasc = 90;
            }
            else {
                hsp.equasc = 270;
            }
        } /*  if */
        
        hsp.equasc = hlib.swe_degnorm(hsp.equasc);
        /* "co-ascendant" W. Koch */
        hsp.coasc1 = hlib.swe_degnorm(Asc1(th - 90, f: fi, sine: sine, cose: cose) + 180);
        /* "co-ascendant" M. Munkasey */
        if (fi >= 0) {
            hsp.coasc2 = Asc1(th + 90, f: 90 - fi, sine: sine, cose: cose);
        }
        else /* southern hemisphere */ {
            hsp.coasc2 = Asc1(th + 90, f: -90 - fi, sine: sine, cose: cose);
        }
        /* "polar ascendant" M. Munkasey */
        hsp.polasc = Asc1(th - 90, f: fi, sine: sine, cose: cose);
        for i in 0..<13 {
            retc.cusps[i] = hsp.cusp[i]
        }
        return retc;
    } /* procedure houses */
    
    
    func sind(_ deg: Double) -> Double {
        return sin(deg * PI / 180)
    }
    
    func cosd(_ deg: Double) -> Double {
        return cos(deg * PI / 180)
    }
    
    func tand(_ deg: Double) -> Double {
        return tan(deg * PI / 180)
    }
    
    func asind(_ deg: Double) -> Double {
        return asin(deg) * 180 / PI
    }
    
    func atand(_ deg: Double) -> Double {
        return atan(deg) * 180 / PI
    }
    
    func Asc1(_ x1: Double, f: Double, sine: Double, cose: Double) -> Double {
        var n: Int = 0
        var ass: Double = 0
        let x1dash = hlib.swe_degnorm(x1)
        n  = (Int) ((x1dash / 90) + 1);   // n is quadrant 1..4
        if (fabs(90 - f) < VERY_SMALL) { // near north pole
            return 180;
        }
        if (fabs(90 + f) < VERY_SMALL) { // near south pole
            return 0;
        }
        if (n == 1) {
            ass = ( Asc2(x: x1dash, f: f, sine: sine, cose: cose));
        }
        else if (n == 2) {
            ass = (180 - Asc2(x: 180 - x1dash, f: -f, sine: sine, cose: cose));
        }
        else if (n == 3) {
            ass = (180 + Asc2(x: x1dash - 180, f: -f, sine: sine, cose: cose));
        }
        else {
            ass = (360 - Asc2(x: 360 - x1dash,  f: f, sine: sine, cose: cose));
        }
        ass = hlib.swe_degnorm(ass);
        if (fabs(ass - 90) < VERY_SMALL) {      /* rounding, e.g.: if */
            ass = 90;                           /* fi = 0 & st = 0, ac = 89.999... */
        }
        if (fabs(ass - 180) < VERY_SMALL) {
            ass = 180;
        }
        if (fabs(ass - 270) < VERY_SMALL) {     /* rounding, e.g.: if */
            ass = 270;                          /* fi = 0 & st = 0, ac = 89.999... */
        }
        if (fabs(ass - 360) < VERY_SMALL) {
            ass = 0;
        }
        return ass;
    }
    
    func Asc2(x: Double, f: Double, sine: Double, cose: Double) -> Double
    {
        var ass: Double
        var sinx: Double
        ass = -1 * tand(f) * sine + cose * cosd(x);
        if (fabs(ass) < VERY_SMALL) {
            ass = 0;
        }
        sinx = sind(x);
        if (fabs(sinx) < VERY_SMALL) {
            sinx = 0;
        }
        if (sinx == 0) {
            if (ass < 0) {
                ass = -VERY_SMALL;
            }
            else {
                ass = VERY_SMALL;
            }
        } else if (ass == 0) {
            if (sinx < 0) {
                ass = -90;
            }
            else {
                ass = 90;
            }
        } else {
            ass = atand(sinx / ass);
        }
        if (ass < 0) {
            ass = 180 + ass;
        }
        return (ass);
    } /* Asc2 */
    
    func swe_difdeg2n(_ p1: Double, p2: Double) -> Double {
        return 0
    }
    
    /*
     * The time range of DE431 requires a new calculation of sidereal time that
     * gives sensible results for the remote past and future.
     * The algorithm is based on the formula of the mean earth by Simon & alii,
     * "Precession formulae and mean elements for the Moon and the Planets",
     * A&A 282 (1994), p. 675/678.
     * The longitude of the mean earth relative to the mean equinox J2000
     * is calculated and then precessed to the equinox of date, using the
     * default precession model of the Swiss Ephmeris. Afte that,
     * sidereal time is derived.
     * The algoritm provides exact agreement for epoch 1 Jan. 2003 with the
     * definition of sidereal time as given in the IERS Convention 2010.
     */
    func sidtime_long_term(_ tjd_ut: Double, eps: Double, nut: Double) -> Double
    {
        return 0
    }
    
    /* Function initialises swed structure.
     * Returns 1 if initialisation is done, otherwise 0 */
    func swi_init_swed_if_start() -> Int
    {
        return 0;
    }
    
    func sunshine_solution_makransky(_ ramc: Double, lat: Double, ecl: Double) -> SweRet {
        let ret: SweRet = SweRet()
        
        return ret
    }
    
    func sunshine_solution_treindl(_ ramc: Double, lat: Double, ecl: Double) -> SweRet
    {
        let ret: SweRet = SweRet()
        return ret
    }
    
    func swe_cotrans(_ xpo: [Double], xpn: [Double], eps: Double) -> SweRet
    {
        let ret: SweRet = SweRet()
        return ret
    }
    
    func apc_sector(_ n: Int, ph: Double, e: Double, az: Double) -> Double
    {
        return 0
    }
    
    func sidtime_non_polynomial_part(tt: Double) -> Double
    {
        return 0
    }

}
