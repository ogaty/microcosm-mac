//
//  MainChart.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/08/31.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class MainChart: NSView {

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        // Drawing code here.
        let color = NSColor(calibratedRed: 1, green: 0, blue: 0, alpha: 1)
        let circleRect = NSMakeRect(10, 10, 240, 240)
        let path: NSBezierPath = NSBezierPath(ovalInRect: circleRect);
        path.stroke()
        let circleRect2 = NSMakeRect(80, 80, 100, 100)
        let path2: NSBezierPath = NSBezierPath(ovalInRect: circleRect2);
        path2.stroke()

        let pathLine1: NSBezierPath = NSBezierPath()
        pathLine1.moveToPoint(NSPoint(x: 40, y:0))
        pathLine1.lineToPoint(NSPoint(x: 100, y:100))
        pathLine1.stroke()
        
    }
    
}
