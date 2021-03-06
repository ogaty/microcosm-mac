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
    var common: CommonData = CommonData()
    var cusps: [Double] = []
    var plist: [PlanetData] = []
    var tmpSetting: TempSetting = TempSetting()
    
    var myClassVar: NSColor! // the optional mark ! to be noticed.
    
    var box = [Int](repeating: 0, count: 60)
    
    override init(frame frameRect: NSRect) {
        super.init(frame:frameRect);
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)!
    }
    
    //or customized constructor/ init
    init(frame frameRect: NSRect, configinfo: ConfigData, cuspsinfo: [Double], planetList: [PlanetData], tempSetting: TempSetting) {
        super.init(frame:frameRect);
        config = configinfo
        cusps = cuspsinfo
        plist = planetList
        tmpSetting = tempSetting
    }

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
//        let color = NSColor(calibratedRed: 1, green: 0, blue: 0, alpha: 1)
        // 外側円
        let circleRect = NSMakeRect((CGFloat)(config.zodiacPaddingLeft), (CGFloat)(config.zodiacPaddingTop),
                                    (CGFloat)(config.zodiacOuterWidth), (CGFloat)(config.zodiacOuterWidth))
        let path: NSBezierPath = NSBezierPath(ovalIn: circleRect);
        path.stroke()

        // 中心円
        let circleRect2 = NSMakeRect((CGFloat)(config.zodiacPaddingLeft) + (CGFloat)(config.zodiacOuterWidth - config.zodiacCenter) / 2,
                                     (CGFloat)(config.zodiacPaddingLeft) + (CGFloat)(config.zodiacOuterWidth - config.zodiacCenter) / 2,
                                     (CGFloat)(config.zodiacCenter), (CGFloat)(config.zodiacCenter))
        let path2: NSBezierPath = NSBezierPath(ovalIn: circleRect2);
        path2.stroke()

        // 内側円
        let circleRect3 = NSMakeRect((CGFloat)(config.zodiacPaddingLeft) + (CGFloat)(config.zodiacWidth) / 2,
                                     (CGFloat)(config.zodiacPaddingLeft) + (CGFloat)(config.zodiacWidth) / 2,
                                     (CGFloat)(config.zodiacOuterWidth - config.zodiacWidth),
                                     (CGFloat)(config.zodiacOuterWidth - config.zodiacWidth))
        let path3: NSBezierPath = NSBezierPath(ovalIn: circleRect3);
        path3.stroke()
        
//        var housepath : NSBezierPath = NSBezierPath(rect: dirtyRect)
        signCuspRender(cusps[1])
        houseCuspRender(cusps: cusps)

        aspectRender(startDegree: cusps[1], list: plist, startPosition: 1, endPosition: 1, aspectKind: 1, aspectRing: 1)

    }
    
    func rotate(_ x: CGFloat, y: CGFloat, degree: CGFloat) -> NSPoint{
        
        var pt: NSPoint = NSPoint()
        // ホロスコープは180°から始まる
        let rad: CGFloat = ((degree + 180.0) / 180.0) * (CGFloat)(PI)
        pt.x = x * cos(rad) - y * sin(rad)
        pt.y = x * sin(rad) + y * cos(rad)
        
        return pt
    }

    // 天体関連
    // degree: absolute_position
    func setPlanetPosition(_ ipl: Int, pdata: PlanetData, startDegree: Double) -> Void {
        // 重ならないようにずらしを入れる
        // 1サインに6度単位5個までデータが入る
        var index: Int = 0
        index = (Int)(pdata.absolute_position / 6)
        if (box[index] == 1)
        {
            while (box[index] == 1)
            {
                index = index + 1
                if (index == 60)
                {
                    index = 0;
                }
            }
            box[index] = 1;
        }
        else
        {
            box[index] = 1;
        }
        
        let x: Double = (Double)(config.zodiacOuterWidth - config.zodiacWidth - 42) / 2
        let y: Double = 0
        let pt: NSPoint = rotate((CGFloat)(x), y: (CGFloat)(y),
                                 degree: (CGFloat)((Double)(index * 6) - startDegree))
        let ptSymbol: NSPoint = rotate((CGFloat)(x - 18.0), y: (CGFloat)(y),
                                    degree: (CGFloat)((Double)(index * 6) - startDegree))
        let ptDeg: NSPoint = rotate((CGFloat)(x - 36.0), y: (CGFloat)(y),
                                    degree: (CGFloat)((Double)(index * 6) - startDegree))
        let ptRetro: NSPoint = rotate((CGFloat)(x - 54.0), y: (CGFloat)(y),
                                    degree: (CGFloat)((Double)(index * 6) - startDegree))
        
        let planets: [String] = ["☉", "☽", "☿", "♀", "♂", "♃", "♄", "♅", "♆", "♇"]

        
        let lbl: NSTextView = NSTextView(frame: CGRect(
            x: pt.x + (CGFloat)(config.zodiacPaddingLeft) +
                (CGFloat)(config.zodiacOuterWidth) / 2 - 20,
            y: pt.y + (CGFloat)(config.zodiacPaddingLeft) +
                (CGFloat)(config.zodiacOuterWidth) / 2 - 20,
            width: 30, height: 30))
        lbl.textStorage!.mutableString.setString(planets[ipl])
        //        lbl.stringValue = "aaa"
        lbl.drawsBackground = false
        lbl.isSelectable = false
        let xfont = NSFont(name: "Helvetica", size: 18)
        
        lbl.font = xfont
        self.addSubview(lbl)

        let symbolLbl: NSTextView = NSTextView(frame: CGRect(
            x: ptSymbol.x + (CGFloat)(config.zodiacPaddingLeft) +
                (CGFloat)(config.zodiacOuterWidth) / 2 - 20,
            y: ptSymbol.y + (CGFloat)(config.zodiacPaddingLeft) +
                (CGFloat)(config.zodiacOuterWidth) / 2 - 20,
            width: 30, height: 30))
        let symbolStr: String = common.getSignText(pdata.absolute_position)
        symbolLbl.textStorage!.mutableString.setString(symbolStr)
        symbolLbl.drawsBackground = false
        symbolLbl.isSelectable = false
        let xfonts = NSFont(name: "Helvetica", size: 14)
        symbolLbl.font = xfonts
        self.addSubview(symbolLbl)
        
        let degLbl: NSTextView = NSTextView(frame: CGRect(
            x: ptDeg.x + (CGFloat)(config.zodiacPaddingLeft) +
                (CGFloat)(config.zodiacOuterWidth) / 2 - 20,
            y: ptDeg.y + (CGFloat)(config.zodiacPaddingLeft) +
                (CGFloat)(config.zodiacOuterWidth) / 2 - 20,
            width: 30, height: 30))
        let degree2: Int = (Int)(pdata.absolute_position.truncatingRemainder(dividingBy: 30))
        degLbl.textStorage!.mutableString.setString((String)(degree2))
        degLbl.drawsBackground = false
        degLbl.isSelectable = false
        let xfont2 = NSFont(name: "Helvetica", size: 14)
        degLbl.font = xfont2
        self.addSubview(degLbl)

        
        if (pdata.speed < 0) {
            let xfont3 = NSFont(name: "Helvetica", size: 14)
            let retroLbl: NSTextView = NSTextView(frame: CGRect(
                x: ptRetro.x + (CGFloat)(config.zodiacPaddingLeft) +
                    (CGFloat)(config.zodiacOuterWidth) / 2 - 20,
                y: ptRetro.y + (CGFloat)(config.zodiacPaddingLeft) +
                    (CGFloat)(config.zodiacOuterWidth) / 2 - 20,
                width: 30, height: 30))
            retroLbl.textStorage!.mutableString.setString("\u{211e}")
            retroLbl.drawsBackground = false
            retroLbl.isSelectable = false
            retroLbl.font = xfont3
            self.addSubview(retroLbl)
        }
    }
    
    func signCuspRender(_ degree: Double) {
        let startX: Double = (Double)(config.zodiacOuterWidth - config.zodiacWidth) / 2
        let startY: Double = 0
        let endX: Double = (Double)(config.zodiacOuterWidth) / 2
        let endY: Double = 0
        
        for i in 1..<13 {
            let degree: Double = (Double)(30 * i - (Int)(degree))
            let startPt: NSPoint = rotate((CGFloat)(startX), y: (CGFloat)(startY), degree: (CGFloat)(degree))
            let endPt: NSPoint = rotate((CGFloat)(endX), y: (CGFloat)(endY), degree: (CGFloat)(degree))
            let pathLine: NSBezierPath = NSBezierPath()
            var color: NSColor = NSColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
            color = NSColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1.0)
            color.set()

            pathLine.lineWidth = 1.0

            pathLine.move(to: NSPoint(
                x: startPt.x + (CGFloat)(config.zodiacPaddingLeft) +
                    (CGFloat)(config.zodiacOuterWidth) / 2,
                y:startPt.y + (CGFloat)(config.zodiacPaddingTop) +
                    (CGFloat)(config.zodiacOuterWidth) / 2))
            pathLine.line(to: NSPoint(x: endPt.x + (CGFloat)(config.zodiacPaddingLeft) +
                (CGFloat)(config.zodiacOuterWidth) / 2,
                                      y:endPt.y + (CGFloat)(config.zodiacPaddingTop) +
                                        (CGFloat)(config.zodiacOuterWidth) / 2))
            pathLine.stroke()
            
        }
    }
    
    func houseCuspRender(cusps: [Double]) {
        let startX: Double = (Double)(config.zodiacOuterWidth - config.zodiacWidth) / 2
        let startY: Double = 0
        let endX: Double = (Double)(config.zodiacCenter) / 2
        let endY: Double = 0
        
        for i in 1..<13 {
            let degree: Double = cusps[i] - cusps[1]
            let startPt: NSPoint = rotate((CGFloat)(startX), y: (CGFloat)(startY), degree: (CGFloat)(degree))
            let endPt: NSPoint = rotate((CGFloat)(endX), y: (CGFloat)(endY), degree: (CGFloat)(degree))
            let pathLine: NSBezierPath = NSBezierPath()
            var color: NSColor = NSColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)

            if (i == 1 || i == 4 || i == 7 || i == 10) {
                pathLine.lineWidth = 2.0
            } else {
                pathLine.lineWidth = 1.0
                color = NSColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1.0)
            }
            color.set()
            pathLine.move(to: NSPoint(
                x: startPt.x + (CGFloat)(config.zodiacPaddingLeft) +
                    (CGFloat)(config.zodiacOuterWidth) / 2,
                y:startPt.y + (CGFloat)(config.zodiacPaddingTop) +
                    (CGFloat)(config.zodiacOuterWidth) / 2))
            pathLine.line(to: NSPoint(x: endPt.x + (CGFloat)(config.zodiacPaddingLeft) +
                (CGFloat)(config.zodiacOuterWidth) / 2,
                                      y:endPt.y + (CGFloat)(config.zodiacPaddingTop) +
                                        (CGFloat)(config.zodiacOuterWidth) / 2))
            pathLine.stroke()
            
        }

    }

    // 円周上の点
    func zodiacRender(_ degree: Double) -> Void {
        
        for i in 0..<12 {
            let newDegree: Double = (Double)(30 * (i + 1)) - degree - 15.0
            let x: Double = (Double)(config.zodiacOuterWidth - 30) / 2
            let y: Double = 0.0
            let pt: NSPoint = rotate((CGFloat)(x), y: (CGFloat)(y), degree: (CGFloat)(newDegree))

            let newX = pt.x + (CGFloat)(config.zodiacPaddingLeft) +
                (CGFloat)(config.zodiacOuterWidth) / 2 - 16
            let newY = pt.y + (CGFloat)(config.zodiacPaddingLeft) +
                (CGFloat)(config.zodiacOuterWidth) / 2 - 16

            let lbl: NSTextView = NSTextView(frame: CGRect(
                x: newX,
                y: newY,
                width: 30, height: 30))
            lbl.textStorage!.mutableString.setString(common.getSignSymbol(i))
            //        lbl.stringValue = "aaa"
            lbl.drawsBackground = false
            lbl.isSelectable = false
            let xfont = NSFont(name: "Helvetica", size: 18)
            
            lbl.font = xfont
            self.addSubview(lbl)
        }
        
        
    }
    
    func aspectRender(startDegree: Double, list: [PlanetData], startPosition: Int, endPosition: Int,
                      aspectKind: Int, aspectRing: Int) -> Void {
        if (list.count == 0)
        {
            return;
        }
        var startRingX: Double = tmpSetting.zodiacCenter / 2;
        var endRingX: Double = tmpSetting.zodiacCenter / 2;
        if (aspectRing == 1)
        {
            // 一重円
            startRingX = tmpSetting.zodiacCenter / 2;
            endRingX = tmpSetting.zodiacCenter / 2;
        }

        for i in 0..<list.count
        {
            if (!list[i].isAspectDisp)
            {
                // 表示対象外
                continue;
            }
            var startPoint: NSPoint;
            startPoint = rotate(CGFloat(startRingX), y: 0, degree: CGFloat((list[i].absolute_position - startDegree)));
            startPoint.x += CGFloat(config.zodiacPaddingLeft + (config.zodiacOuterWidth) / 2);
            startPoint.y += CGFloat(config.zodiacPaddingTop + (config.zodiacOuterWidth) / 2);
            if (aspectKind == 1)
            {
                aspectListRender(startDegree: startDegree, list: list, aspects: list[i].aspects, startPoint: startPoint, endRingX: endRingX);
            }
        }
    }
    
    func aspectListRender(startDegree: Double, list: [PlanetData], aspects: [AspectInfo], startPoint: NSPoint, endRingX: Double) -> Void {
        for j in 0..<aspects.count
        {
            var endPoint: NSPoint;
            
            endPoint = rotate(CGFloat(endRingX), y: 0, degree: CGFloat(aspects[j].targetPosition - startDegree));
            endPoint.x += CGFloat(config.zodiacPaddingLeft + (config.zodiacOuterWidth) / 2);
            endPoint.y += CGFloat(config.zodiacPaddingTop + (config.zodiacOuterWidth) / 2);
            
            var color: NSColor = NSColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
            if (aspects[j].aspectKind == 1) {
                // opposition, red
                color = NSColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
            } else if (aspects[j].aspectKind == 2) {
                // trine, orange
                color = NSColor(red: 255 / 255, green: 165 / 255, blue: 0 / 255, alpha: 1.0)
            } else if (aspects[j].aspectKind == 3) {
                // square, purple
                color = NSColor(red: 128 / 255, green: 255 / 255, blue: 128 / 255, alpha: 1.0)
            } else if (aspects[j].aspectKind == 4) {
                // sextile, green
                color = NSColor(red: 0 / 255, green: 128 / 255, blue: 0 / 255, alpha: 1.0)
            } else if (aspects[j].aspectKind == 5) {
                // inconjunct, gray
                color = NSColor(red: 128 / 255, green: 128 / 255, blue: 128 / 255, alpha: 1.0)
            } else if (aspects[j].aspectKind == 6) {
                // sesquiquadrate, gray
                color = NSColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 1.0)
            }
            color.set()
            let aspectLine: NSBezierPath = NSBezierPath()
            aspectLine.move(to: NSPoint(
                x: startPoint.x,
                y: startPoint.y))
            aspectLine.line(to: NSPoint(x: endPoint.x,
                                      y:endPoint.y))
            aspectLine.stroke()
            
        }

    }

    @IBAction func itemClick(sender: AnyObject) {
        NSLog("chart")
    }
    
}
