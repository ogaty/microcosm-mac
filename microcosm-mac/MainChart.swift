//
//  MainChart.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/08/31.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class MainChart: NSView {
    var pos: Double = 0.0
    

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        // Drawing code here.
//        let color = NSColor(calibratedRed: 1, green: 0, blue: 0, alpha: 1)
        let circleRect = NSMakeRect(10, 10, 270, 270)
        let path: NSBezierPath = NSBezierPath(ovalInRect: circleRect);
        path.stroke()
        let circleRect2 = NSMakeRect(95, 95, 100, 100)
        let path2: NSBezierPath = NSBezierPath(ovalInRect: circleRect2);
        path2.stroke()

        let startX: Double = 135
        let startY: Double = 0
        let endX: Double = 50
        let endY: Double = 0

        for i in 0..<12 {
            let degree: Double = 30.0 * (Double)(i)
            let startPt: NSPoint = rotate((CGFloat)(startX), y: (CGFloat)(startY), degree: (CGFloat)(degree))
            let endPt: NSPoint = rotate((CGFloat)(endX), y: (CGFloat)(endY), degree: (CGFloat)(degree))
            let pathLine: NSBezierPath = NSBezierPath()
            pathLine.moveToPoint(NSPoint(x: startPt.x + 145.0, y:startPt.y + 145.0))
            pathLine.lineToPoint(NSPoint(x: endPt.x + 145.0, y:endPt.y + 145.0))
            pathLine.stroke()
            
        }
        
        
    }
    
    func rotate(x: CGFloat, y: CGFloat, degree: CGFloat) -> NSPoint{
        
        var pt: NSPoint = NSPoint()
        // ホロスコープは180°から始まる
        let rad: CGFloat = ((degree + 180.0) / 180.0) * (CGFloat)(PI)
        pt.x = x * cos(rad) - y * sin(rad)
        pt.y = x * sin(rad) + y * cos(rad)
        
        return pt
    }

    func setPlanetPosition(ipl: Int, degree: Double) -> Void {
        let x: Double = 115
        let y: Double = 0
        let pt: NSPoint = rotate((CGFloat)(x), y: (CGFloat)(y), degree: (CGFloat)(degree))
        
        let planets: [String] = ["☉", "☽", "☿", "♀", "♂", "♃", "♄", "♅", "♆", "♇"]

        
        let lbl: NSTextView = NSTextView(frame: CGRectMake(pt.x + 125, pt.y + 125, 30, 30))
        lbl.textStorage!.mutableString.setString(planets[ipl])
        //        lbl.stringValue = "aaa"
        lbl.drawsBackground = false
        lbl.selectable = false
        let xfont = NSFont(name: "Helvetica", size: 18)
        
        lbl.font = xfont
        self.addSubview(lbl)
        
    }
    

    
}
