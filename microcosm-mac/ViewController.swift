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
        let formatter = DateFormatter()
        let now = Date()
        let common: CommonData = CommonData()
        let config: ConfigData = ConfigData()
        var documents = NSSearchPathForDirectoriesInDomains(
            .documentDirectory,
            .userDomainMask, true)[0]
//        let fileManager = FileManager.default
        
        let cal = NSCalendar.current
        let year = cal.component(.year, from: now)
        let month = cal.component(.month, from: now)
        let day = cal.component(.day, from: now)
        let hour = cal.component(.hour, from: now)
        let minute = cal.component(.minute, from: now)
        let second = cal.component(.second, from: now)
        
        let calc: AstroCalc = AstroCalc(path: "")
        let cusps: [Double] = calc.CuspCalc(year, month: month, day: day, hour: hour, min: minute, sec: (Double)(second), lat: 35.67, lng: 139.77, houseKind: 0)

        let rect: NSRect = NSMakeRect(200, 20, 400, 400);
        var chart: MainChart = MainChart(frame: rect, configinfo: config, cuspsinfo: cusps)
        self.view.addSubview(chart)

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
        userBirthStrLbl.stringValue = formatter.string(from: now)
        userBirthPlaceLbl.stringValue = "神奈川県川崎市高津区"
        userLatLbl.stringValue = ""
        userLngLbl.stringValue = ""


        chart.houseCuspRender(cusps: cusps)
        
        for i in 0..<10 {
            chart.setPlanetPosition(i, degree: plist[i].absolute_position, startDegree: cusps[1])
        }
        
        chart.zodiacRender(cusps[1])
        //        let a = 0
        
    }



}

