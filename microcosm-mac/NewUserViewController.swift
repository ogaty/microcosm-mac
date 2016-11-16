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
        let common: CommonData = CommonData()

        let udata: UserData = UserData()
        udata.fileName = fileName.stringValue
        udata.fullPath = createPath + "/" + fileName.stringValue
        udata.name = name.stringValue
        udata.furigana = furigana.stringValue
        
        if let _:Int = (Int)(Year.stringValue) {
            udata.birth_year = (Int)(Year.stringValue)!
            if (udata.birth_year < 1800 || 2399 < udata.birth_year) {
                let alert:NSAlert = NSAlert();
                alert.messageText = "エラー";
                alert.informativeText = "当ソフトで計算できるのは1800年〜2399年までです。";
                alert.runModal();
                return
            }
        } else {
            let alert:NSAlert = NSAlert();
            alert.messageText = "エラー";
            alert.informativeText = "正しい時刻を入力してください。";
            alert.runModal();
            return
        }
        if let _:Int = (Int)(Month.stringValue) {
            udata.birth_month = (Int)(Month.stringValue)!
            if (udata.birth_month < 1 || 12 < udata.birth_month) {
                let alert:NSAlert = NSAlert();
                alert.messageText = "エラー";
                alert.informativeText = "正しい時刻を入力してください。";
                alert.runModal();
                return
            }
        } else {
            let alert:NSAlert = NSAlert();
            alert.messageText = "エラー";
            alert.informativeText = "正しい時刻を入力してください。";
            alert.runModal();
            return
        }
        if let _:Int = (Int)(Day.stringValue) {
            udata.birth_day = (Int)(Day.stringValue)!
            if (udata.birth_day < 1 || 31 < udata.birth_day) {
                let alert:NSAlert = NSAlert();
                alert.messageText = "エラー";
                alert.informativeText = "正しい時刻を入力してください。";
                alert.runModal();
                return
            }
        } else {
            let alert:NSAlert = NSAlert();
            alert.messageText = "エラー";
            alert.informativeText = "正しい時刻を入力してください。";
            alert.runModal();
            return
        }
        if let _:Int = (Int)(Hour.stringValue) {
            udata.birth_hour = (Int)(Hour.stringValue)!
            if (udata.birth_hour < 0 || 23 < udata.birth_hour) {
                let alert:NSAlert = NSAlert();
                alert.messageText = "エラー";
                alert.informativeText = "正しい時刻を入力してください。";
                alert.runModal();
                return
            }
        } else {
            let alert:NSAlert = NSAlert();
            alert.messageText = "エラー";
            alert.informativeText = "正しい時刻を入力してください。";
            alert.runModal();
            return
        }
        if let _:Int = (Int)(Minute.stringValue) {
            udata.birth_minute = (Int)(Minute.stringValue)!
            if (udata.birth_minute < 0 || 59 < udata.birth_minute) {
                let alert:NSAlert = NSAlert();
                alert.messageText = "エラー";
                alert.informativeText = "正しい時刻を入力してください。";
                alert.runModal();
                return
            }
        } else {
            let alert:NSAlert = NSAlert();
            alert.messageText = "エラー";
            alert.informativeText = "正しい時刻を入力してください。";
            alert.runModal();
            return
        }
        if let _:Double = (Double)(Second.stringValue) {
            udata.birth_second = (Double)(Second.stringValue)!
            if (udata.birth_second < 0 || 59 < udata.birth_second) {
                let alert:NSAlert = NSAlert();
                alert.messageText = "エラー";
                alert.informativeText = "正しい時刻を入力してください。";
                alert.runModal();
                return
            }
        } else {
            let alert:NSAlert = NSAlert();
            alert.messageText = "エラー";
            alert.informativeText = "正しい時刻を入力してください。";
            alert.runModal();
            return
        }
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
