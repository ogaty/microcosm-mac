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
    @IBOutlet weak var Lat: NSTextField!
    @IBOutlet weak var Lng: NSTextField!
    @IBOutlet weak var Memo: NSTextField!
    @IBOutlet weak var Place: NSTextField!
    @IBOutlet weak var fileName: NSTextField!

    @IBOutlet weak var inputdate: NSDatePicker!

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
        
        let input: NSDate = inputdate.dateValue as NSDate
        let cal: NSCalendar = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!
        let year: Int = cal.components(.year, from: input as Date).year!
        let month: Int = cal.components(.month, from: input as Date).month!
        let day: Int = cal.components(.day, from: input as Date).day!
        let hour: Int = cal.components(.hour, from: input as Date).hour!
        let minute: Int = cal.components(.minute, from: input as Date).minute!
        let second: Int = cal.components(.second, from: input as Date).second!

        if (year < 1800 || 2399 < year) {
            let alert:NSAlert = NSAlert();
            alert.messageText = "エラー";
            alert.informativeText = "当ソフトで計算できるのは1800年〜2399年までです。";
            alert.runModal();
            return
        }
        udata.birth_year = year
        udata.birth_month = month
        udata.birth_day = day
        udata.birth_hour = hour
        udata.birth_minute = minute
        udata.birth_second = Double(second)
        
        udata.birth_place = Place.stringValue
        if let _:Double = (Double)(Lat.stringValue) {
            udata.lat = (Double)(Lat.stringValue)!
            if (udata.lat < -90 || 90 < udata.lat) {
                let alert:NSAlert = NSAlert();
                alert.messageText = "エラー";
                alert.informativeText = "正しい緯度経度を入力してください。";
                alert.runModal();
                return
            }
        } else {
            let alert:NSAlert = NSAlert();
            alert.messageText = "エラー";
            alert.informativeText = "正しい緯度経度を入力してください。";
            alert.runModal();
            return
        }
        if let _:Double = (Double)(Lng.stringValue) {
            udata.lng = (Double)(Lng.stringValue)!
            if (udata.lng < -180 || 180 < udata.lng) {
                let alert:NSAlert = NSAlert();
                alert.messageText = "エラー";
                alert.informativeText = "正しい緯度経度を入力してください。";
                alert.runModal();
                return
            }
        } else {
            let alert:NSAlert = NSAlert();
            alert.messageText = "エラー";
            alert.informativeText = "正しい緯度経度を入力してください。";
            alert.runModal();
            return
        }
        udata.timezone = "JST"
        udata.memo = Memo.stringValue
        let fName: String = fileName.stringValue
//        self.main.updateUserData(udata: udata, fileName: fName)
        self.vc?.createUser(udata: udata, fileName: fName)
        dismissViewController(self)
    }
}
