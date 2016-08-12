//
//  AppDelegate.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/07/09.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var swiss : SwissEph
    var ret: SweRet = SweRet()
    let swed: SweData = SweData()
    
    override init() {
        swiss = SwissEph()
    }


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        let iflag: Int = SEFLG_SWIEPH | SEFLG_SPEED
        ret = swiss.swe_calc_ut(2457605.0919465744, ipl: 1, iflag: iflag)
        let a = 0
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

