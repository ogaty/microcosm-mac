//
//  CustomWindowManager.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/12/08.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class CustomWindowManager: NSWindowController, NSWindowDelegate {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    internal func windowDidResize(_ notification: Notification) {
        
        // Your code goes here
        NSLog("resize")
    }
}
