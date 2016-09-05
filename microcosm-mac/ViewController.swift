//
//  ViewController.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/07/09.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    var swiss : SwissEph = SwissEph()
    let swed: SweData = SweData()
    let common: CommonData = CommonData()
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
        let iflag: Int = SEFLG_SWIEPH | SEFLG_SPEED
        var ret: SweRet = SweRet()
        let now = NSDate()
        let cal: NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        var cal_comp: NSDateComponents = cal.components([.Year, .Month, .Day, .Weekday], fromDate:now)
        let year: Int = cal_comp.year
        let month: Int = cal_comp.month
        let day: Int = cal_comp.day
            cal_comp = cal.components([.NSHourCalendarUnit, .NSMinuteCalendarUnit, .NSSecondCalendarUnit],
                                      fromDate:now)
        let hour: Int = cal_comp.hour
        let minute: Int = cal_comp.minute
        let second: Double = (Double)(cal_comp.second)
        let formatter = NSDateFormatter()

        swiss.swe_set_ephe_path("")

//        let retc: SweTimeRet = swiss.swe_utc_time_zone(2012, month: 12, day: 21,
//                                                       hour: 12, minute: 0, second: 0,
//                                                       timezone: 9.0)
        
        let retc: SweTimeRet = swiss.swe_utc_time_zone(year, month: month, day: day,
                                                       hour: hour, minute: minute, second: second,
                                                       timezone: 9.0)
        ret = swiss.utc_to_jd(retc.year, month: retc.month, day: retc.day, hour: retc.hour, minute: retc.minute, second: retc.second, gregflag: true)
        let ut: Double = ret.tmpDbl6[0]
        ret = swiss.swe_calc_ut(ut, ipl: common.ZODIAC_SUN, iflag: iflag)
//        ret = swiss.swe_calc_ut(2457605.0919465744, ipl: 0, iflag: iflag)
        sunPositionLabel.stringValue = (String)(ret.xx[0])
        let sunDegree : Double = ret.xx[0]
        
        ret = swiss.swe_calc_ut(ut, ipl: common.ZODIAC_MOON, iflag: iflag)
//        ret = swiss.swe_calc_ut(2457605.0919465744, ipl: 1, iflag: iflag)
        moonPositionLabel.stringValue = (String)(ret.xx[0])
        let moonDegree : Double = ret.xx[0]

        ret = swiss.swe_calc_ut(ut, ipl: common.ZODIAC_MERCURY, iflag: iflag)
        mercuryPositionLabel.stringValue = (String)(ret.xx[0])
        let mercuryDegree : Double = ret.xx[0]
        
        ret = swiss.swe_calc_ut(ut, ipl: common.ZODIAC_VENUS, iflag: iflag)
        venusPositionLabel.stringValue = (String)(ret.xx[0])
        let venusDegree : Double = ret.xx[0]

        ret = swiss.swe_calc_ut(ut, ipl: common.ZODIAC_MARS, iflag: iflag)
        marsPositionLabel.stringValue = (String)(ret.xx[0])
        let marsDegree : Double = ret.xx[0]

        ret = swiss.swe_calc_ut(ut, ipl: common.ZODIAC_JUPITER, iflag: iflag)
        jupiterPositionLabel.stringValue = (String)(ret.xx[0])
        let jupiterDegree : Double = ret.xx[0]

        ret = swiss.swe_calc_ut(ut, ipl: common.ZODIAC_SATURN, iflag: iflag)
        saturnPositionLabel.stringValue = (String)(ret.xx[0])
        let saturnDegree : Double = ret.xx[0]
        
        ret = swiss.swe_calc_ut(ut, ipl: common.ZODIAC_URANUS, iflag: iflag)
        uranusPositionLabel.stringValue = (String)(ret.xx[0])
        let uranusDegree : Double = ret.xx[0]
        
        ret = swiss.swe_calc_ut(ut, ipl: common.ZODIAC_NEPTUNE, iflag: iflag)
        neptunePositionLabel.stringValue = (String)(ret.xx[0])
        let neptuneDegree : Double = ret.xx[0]
        
        ret = swiss.swe_calc_ut(ut, ipl: common.ZODIAC_PLUTO, iflag: iflag)
        plutoPositionLabel.stringValue = (String)(ret.xx[0])
        let plutoDegree : Double = ret.xx[0]
        
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        
        userNameLbl.stringValue = "現在時刻"
        userBirthStrLbl.stringValue = formatter.stringFromDate(now)
        userBirthPlaceLbl.stringValue = "神奈川県川崎市高津区"
        userLatLbl.stringValue = ""
        userLngLbl.stringValue = ""
        
        chart.setPlanetPosition(common.ZODIAC_SUN, degree: sunDegree)
        chart.setPlanetPosition(common.ZODIAC_MOON, degree: moonDegree)
        chart.setPlanetPosition(common.ZODIAC_MERCURY, degree: mercuryDegree)
        chart.setPlanetPosition(common.ZODIAC_VENUS, degree: venusDegree)
        chart.setPlanetPosition(4, degree: marsDegree)
        chart.setPlanetPosition(5, degree: jupiterDegree)
        chart.setPlanetPosition(6, degree: saturnDegree)
        chart.setPlanetPosition(7, degree: uranusDegree)
        chart.setPlanetPosition(8, degree: neptuneDegree)
        chart.setPlanetPosition(9, degree: plutoDegree)

//        self.view
        //        let a = 0
        
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

