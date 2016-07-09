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
    
    override init() {
        swiss = SwissEph()
        super.init()
    }


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        swiss.aaa()
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

