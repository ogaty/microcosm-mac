//
//  SwissHLib.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/08/11.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class SwissHLib: NSObject {
    
    override init() {
    }

    func square_sum(_ x: Double, y: Double, z: Double) -> Double {
        return x*x+y*y+z*z
    }
    
    /* Reduce x modulo 360 degrees
     */
    func swe_degnorm(_ x: Double) -> Double
    {
        var y: Double = fmod(x, 360.0);
        if (fabs(y) < 1e-13) {
            y = 0;   /* Alois fix 11-dec-1999 */
        }
        if( y < 0.0 ) {
            y += 360.0;
        }
        return y;
    }
    
    /* Reduce x modulo TWOPI degrees
     */
    func swe_radnorm(_ x: Double) -> Double
    {
        var y: Double = fmod(x, TWOPI);
        if (fabs(y) < 1e-13) {
            y = 0;   /* Alois fix 11-dec-1999 */
        }
        if( y < 0.0 ) {
            y += TWOPI;
        } 
        return y;
    }

    
}
