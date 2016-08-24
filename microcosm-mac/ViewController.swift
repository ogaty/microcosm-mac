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
    var ret: SweRet = SweRet()
    let swed: SweData = SweData()
    
    @IBOutlet weak var userNameLbl: NSTextField!
    @IBOutlet weak var userBirthStrLbl: NSTextField!
    @IBOutlet weak var userBirthPlaceLbl: NSTextField!
    @IBOutlet weak var userLatLbl: NSTextField!
    @IBOutlet weak var userLngLbl: NSTextField!
    @IBOutlet weak var sunLabel: NSTextField!
    @IBOutlet weak var moonPositionLabel: NSTextField!
    @IBOutlet weak var sunPositionLabel: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.        
        let iflag: Int = SEFLG_SWIEPH | SEFLG_SPEED
        swiss.swe_set_ephe_path("")
        ret = swiss.swe_calc_ut(2457605.0919465744, ipl: 0, iflag: iflag)
        sunPositionLabel.stringValue = (String)(ret.xx[0])
        
        ret = swiss.swe_calc_ut(2457605.0919465744, ipl: 1, iflag: iflag)
        moonPositionLabel.stringValue = (String)(ret.xx[0])

        
        let now = NSDate()
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        
        userNameLbl.stringValue = "現在時刻"
        userBirthStrLbl.stringValue = formatter.stringFromDate(now)
        userBirthPlaceLbl.stringValue = "神奈川県川崎市高津区"
        userLatLbl.stringValue = ""
        userLngLbl.stringValue = ""

        let a = 0
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

