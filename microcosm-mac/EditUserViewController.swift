//
//  EditUserViewController.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/11/10.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class EditUserViewController: NSViewController {
    var vc: DatabaseViewController? = nil
    var udata: UserData? = nil

    @IBOutlet weak var username: NSTextField!
    @IBOutlet weak var furigana: NSTextField!
    @IBOutlet weak var birth_place: NSTextField!
    @IBOutlet weak var timezone: NSComboBox!
    @IBOutlet weak var lat: NSTextField!
    @IBOutlet weak var lng: NSTextField!
    @IBOutlet weak var memo: NSTextField!
    
    @IBOutlet weak var inputDate: NSDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        username.stringValue = (udata?.name)!
        furigana.stringValue = (udata?.furigana)!
        timezone.selectItem(at: 0)
        birth_place.stringValue = (udata?.birth_place)!
        lat.stringValue = (udata?.lat.description)!
        lng.stringValue = (udata?.lng.description)!
        memo.stringValue = (udata?.memo)!
        
        let components = NSDateComponents()
        components.year = (udata?.birth_year)!
        components.month = (udata?.birth_month)!
        components.day = (udata?.birth_day)!
        components.hour = (udata?.birth_hour)!
        components.minute = (udata?.birth_minute)!
        components.second = (Int)((udata?.birth_second)!)
        
        let date: Date? = NSCalendar.current.date(from: components as DateComponents)
        inputDate.dateValue = date!
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        self.view.window?.styleMask.remove(.resizable)
    }
    

    @IBAction func submitClicked(_ sender: AnyObject) {
        do {
            try FileManager.default.removeItem(atPath: (udata?.fullPath)!)
        } catch let error as NSError {
            NSLog(error.localizedDescription)
        }

        let xmlParser: UserXmlParser = UserXmlParser()
        let newudata: UserData = UserData()
        newudata.name = username.stringValue
        newudata.furigana = furigana.stringValue
        let input: NSDate = inputDate.dateValue as NSDate
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
        newudata.birth_year = year
        newudata.birth_month = month
        newudata.birth_day = day
        newudata.birth_hour = hour
        newudata.birth_minute = minute
        newudata.birth_second = Double(second)

        
        newudata.timezone = timezone.stringValue
        newudata.birth_place = birth_place.stringValue
        if let _:Double = (Double)(lat.stringValue) {
            newudata.lat = (Double)(lat.stringValue)!
            if (newudata.lat < -90 || 90 < newudata.lat) {
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
        if let _:Double = (Double)(lng.stringValue) {
            newudata.lng = (Double)(lng.stringValue)!
            if (newudata.lng < -180 || 180 < newudata.lng) {
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
        newudata.memo = memo.stringValue
        let str: String = xmlParser.UserToXml(newudata)
            
        FileManager.default.createFile(atPath: ((udata?.fullPath)!), contents: str.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue)))
        vc?.reload()

        dismissViewController(self)
        
    }
}
