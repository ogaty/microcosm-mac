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
    @IBOutlet weak var birth_year: NSTextField!
    @IBOutlet weak var birth_month: NSTextField!
    @IBOutlet weak var birth_day: NSTextField!
    @IBOutlet weak var birth_hour: NSTextField!
    @IBOutlet weak var birth_minute: NSTextField!
    @IBOutlet weak var birth_second: NSTextField!
    @IBOutlet weak var birth_place: NSTextField!
    @IBOutlet weak var timezone: NSComboBox!
    @IBOutlet weak var lat: NSTextField!
    @IBOutlet weak var lng: NSTextField!
    @IBOutlet weak var memo: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        username.stringValue = (udata?.name)!
        furigana.stringValue = (udata?.furigana)!
        birth_year.stringValue = (udata?.birth_year.description)!
        birth_month.stringValue = (udata?.birth_month.description)!
        birth_day.stringValue = (udata?.birth_day.description)!
        birth_hour.stringValue = (udata?.birth_hour.description)!
        birth_minute.stringValue = (udata?.birth_minute.description)!
        birth_second.stringValue = ((Int)((udata?.birth_second)!).description)
        timezone.selectItem(at: 0)
        birth_place.stringValue = (udata?.birth_place)!
        lat.stringValue = (udata?.lat.description)!
        lng.stringValue = (udata?.lng.description)!
        memo.stringValue = (udata?.memo)!
        
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
        newudata.birth_year = (Int)(birth_year.stringValue)!
        newudata.birth_month = (Int)(birth_month.stringValue)!
        newudata.birth_day = (Int)(birth_day.stringValue)!
        newudata.birth_hour = (Int)(birth_hour.stringValue)!
        newudata.birth_minute = (Int)(birth_minute.stringValue)!
        newudata.birth_second = (Double)(birth_second.stringValue)!
        newudata.timezone = timezone.stringValue
        newudata.birth_place = birth_place.stringValue
        newudata.lat = (Double)(lat.stringValue)!
        newudata.lng = (Double)(lng.stringValue)!
        newudata.memo = memo.stringValue
        let str: String = xmlParser.UserToXml(newudata)
            
        FileManager.default.createFile(atPath: ((udata?.fullPath)!), contents: str.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue)))
        vc?.reload()

        dismissViewController(self)
        
    }
}
