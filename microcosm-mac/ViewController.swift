//
//  ViewController.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/07/09.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    let swed: SweData = SweData()
    @IBOutlet weak var chart: MainChart!
    
    @IBOutlet weak var userNameLbl: NSTextField!
    @IBOutlet weak var userBirthStrLbl: NSTextField!
    @IBOutlet weak var userBirthPlaceLbl: NSTextField!
    @IBOutlet weak var userLatLbl: NSTextField!
    @IBOutlet weak var userLngLbl: NSTextField!
    @IBOutlet weak var sunLabel: NSTextField!
    @IBOutlet weak var sunPositionLabel: NSTextField!
    @IBOutlet weak var moonPositionLabel: NSTextField!
    @IBOutlet weak var mercuryPositionLabel: NSTextField!
    @IBOutlet weak var venusPositionLabel: NSTextField!
    @IBOutlet weak var marsPositionLabel: NSTextField!
    @IBOutlet weak var jupiterPositionLabel: NSTextField!
    @IBOutlet weak var saturnPositionLabel: NSTextField!
    @IBOutlet weak var uranusPositionLabel: NSTextField!
    @IBOutlet weak var neptunePositionLabel: NSTextField!
    @IBOutlet weak var plutoPositionLabel: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.        
        let formatter = NSDateFormatter()
        let now = NSDate()
        let common: CommonData = CommonData()
        let config: ConfigData = ConfigData()

        let calc: AstroCalc = AstroCalc(path: "")
        let plist: [PlanetData] = calc.PositionCalc()
        
        sunPositionLabel.stringValue = (String)(plist[0].absolute_position)
        moonPositionLabel.stringValue = (String)(plist[1].absolute_position)
        mercuryPositionLabel.stringValue = (String)(plist[2].absolute_position)
        venusPositionLabel.stringValue = (String)(plist[3].absolute_position)
        marsPositionLabel.stringValue = (String)(plist[4].absolute_position)
        jupiterPositionLabel.stringValue = (String)(plist[5].absolute_position)
        saturnPositionLabel.stringValue = (String)(plist[6].absolute_position)
        uranusPositionLabel.stringValue = (String)(plist[7].absolute_position)
        neptunePositionLabel.stringValue = (String)(plist[8].absolute_position)
        plutoPositionLabel.stringValue = (String)(plist[9].absolute_position)

        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        
        userNameLbl.stringValue = "現在時刻"
        userBirthStrLbl.stringValue = formatter.stringFromDate(now)
        userBirthPlaceLbl.stringValue = "神奈川県川崎市高津区"
        userLatLbl.stringValue = ""
        userLngLbl.stringValue = ""
        
        
        chart.setPlanetPosition(common.ZODIAC_SUN, degree: plist[0].absolute_position)
        chart.setPlanetPosition(common.ZODIAC_MOON, degree: plist[1].absolute_position)
        chart.setPlanetPosition(common.ZODIAC_MERCURY, degree: plist[2].absolute_position)
        chart.setPlanetPosition(common.ZODIAC_VENUS, degree: plist[3].absolute_position)
        chart.setPlanetPosition(4, degree: plist[4].absolute_position)
        chart.setPlanetPosition(5, degree: plist[5].absolute_position)
        chart.setPlanetPosition(6, degree: plist[6].absolute_position)
        chart.setPlanetPosition(7, degree: plist[7].absolute_position)
        chart.setPlanetPosition(8, degree: plist[8].absolute_position)
        chart.setPlanetPosition(9, degree: plist[9].absolute_position)

        //        let a = 0
        
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

