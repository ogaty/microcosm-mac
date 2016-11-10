//
//  NewUserViewController.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/10/13.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class NewUserViewController: NSViewController {
    @IBOutlet weak var name: NSTextField!
    @IBOutlet weak var furigana: NSTextField!
    @IBOutlet weak var Year: NSTextField!
    @IBOutlet weak var Month: NSTextField!
    @IBOutlet weak var Day: NSTextField!
    @IBOutlet weak var Hour: NSTextField!
    @IBOutlet weak var Minute: NSTextField!
    @IBOutlet weak var Second: NSTextField!
    @IBOutlet weak var Lat: NSTextField!
    @IBOutlet weak var Lng: NSTextField!
    @IBOutlet weak var Memo: NSTextField!
    @IBOutlet weak var Place: NSTextField!
    @IBOutlet weak var fileName: NSTextField!

    var main: ViewController = ViewController()
    var vc: DatabaseViewController? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func SubmitClicked(_ sender: AnyObject) {
        let documents = NSSearchPathForDirectoriesInDomains(
            .documentDirectory,
            .userDomainMask, true)[0]
        let directoryName = "microcosm"
        let createPath = documents + "/" + directoryName + "/data"

        let udata: UserData = UserData()
        udata.fileName = fileName.stringValue
        udata.fullPath = createPath + "/" + fileName.stringValue
        udata.name = name.stringValue
        udata.furigana = furigana.stringValue
        udata.birth_year = (Int)(Year.stringValue)!
        udata.birth_month = (Int)(Month.stringValue)!
        udata.birth_day = (Int)(Day.stringValue)!
        udata.birth_hour = (Int)(Hour.stringValue)!
        udata.birth_minute = (Int)(Minute.stringValue)!
        udata.birth_second = (Double)(Second.stringValue)!
        udata.birth_place = Place.stringValue
        udata.lat = (Double)(Lat.stringValue)!
        udata.lng = (Double)(Lng.stringValue)!
        udata.timezone = "JST"
        udata.memo = Memo.stringValue
        let fName: String = fileName.stringValue
//        self.main.updateUserData(udata: udata, fileName: fName)
        self.vc?.createUser(udata: udata, fileName: fName)
        dismissViewController(self)
    }
}
