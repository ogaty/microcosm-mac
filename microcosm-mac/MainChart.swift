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
    var config: ConfigData = ConfigData()
    

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        // Drawing code here.
//        let color = NSColor(calibratedRed: 1, green: 0, blue: 0, alpha: 1)
        // 外側円
        let circleRect = NSMakeRect((CGFloat)(config.zodiacPaddingLeft), (CGFloat)(config.zodiacPaddingTop),
                                    (CGFloat)(config.zodiacOuterWidth), (CGFloat)(config.zodiacOuterWidth))
        let path: NSBezierPath = NSBezierPath(ovalInRect: circleRect);
        path.stroke()

        // 中心円
        let circleRect2 = NSMakeRect((CGFloat)(config.zodiacPaddingLeft) + (CGFloat)(config.zodiacOuterWidth - config.zodiacCenter) / 2,
                                     (CGFloat)(config.zodiacPaddingLeft) + (CGFloat)(config.zodiacOuterWidth - config.zodiacCenter) / 2,
                                     (CGFloat)(config.zodiacCenter), (CGFloat)(config.zodiacCenter))
        let path2: NSBezierPath = NSBezierPath(ovalInRect: circleRect2);
        path2.stroke()

        // 内側円
        let circleRect3 = NSMakeRect((CGFloat)(config.zodiacPaddingLeft) + (CGFloat)(config.zodiacWidth) / 2,
                                     (CGFloat)(config.zodiacPaddingLeft) + (CGFloat)(config.zodiacWidth) / 2,
                                     (CGFloat)(config.zodiacOuterWidth - config.zodiacWidth),
                                     (CGFloat)(config.zodiacOuterWidth - config.zodiacWidth))
        let path3: NSBezierPath = NSBezierPath(ovalInRect: circleRect3);
        path3.stroke()
        
        let startX: Double = (Double)(config.zodiacOuterWidth - config.zodiacWidth) / 2
        let startY: Double = 0
        let endX: Double = (Double)(config.zodiacCenter) / 2
        let endY: Double = 0

        for i in 0..<12 {
            let degree: Double = 30.0 * (Double)(i)
            let startPt: NSPoint = rotate((CGFloat)(startX), y: (CGFloat)(startY), degree: (CGFloat)(degree))
            let endPt: NSPoint = rotate((CGFloat)(endX), y: (CGFloat)(endY), degree: (CGFloat)(degree))
            let pathLine: NSBezierPath = NSBezierPath()
            pathLine.moveToPoint(NSPoint(
                x: startPt.x + (CGFloat)(config.zodiacPaddingLeft) +
                    (CGFloat)(config.zodiacOuterWidth) / 2,
                y:startPt.y + (CGFloat)(config.zodiacPaddingTop) +
                    (CGFloat)(config.zodiacOuterWidth) / 2))
            pathLine.lineToPoint(NSPoint(x: endPt.x + (CGFloat)(config.zodiacPaddingLeft) +
                    (CGFloat)(config.zodiacOuterWidth) / 2,
                y:endPt.y + (CGFloat)(config.zodiacPaddingTop) +
                    (CGFloat)(config.zodiacOuterWidth) / 2))
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
        let x: Double = (Double)(config.zodiacOuterWidth - config.zodiacWidth - 50) / 2
        let y: Double = 0
        let pt: NSPoint = rotate((CGFloat)(x), y: (CGFloat)(y), degree: (CGFloat)(degree))
        
        let planets: [String] = ["☉", "☽", "☿", "♀", "♂", "♃", "♄", "♅", "♆", "♇"]

        
        let lbl: NSTextView = NSTextView(frame: CGRectMake(
            pt.x + (CGFloat)(config.zodiacPaddingLeft) +
                (CGFloat)(config.zodiacOuterWidth) / 2 - 20,
            pt.y + (CGFloat)(config.zodiacPaddingLeft) +
                (CGFloat)(config.zodiacOuterWidth) / 2 - 20,
            30, 30))
        lbl.textStorage!.mutableString.setString(planets[ipl])
        //        lbl.stringValue = "aaa"
        lbl.drawsBackground = false
        lbl.selectable = false
        let xfont = NSFont(name: "Helvetica", size: 18)
        
        lbl.font = xfont
        self.addSubview(lbl)
        
    }
    

    
}
