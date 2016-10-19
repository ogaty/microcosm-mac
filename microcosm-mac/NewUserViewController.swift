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
    var main: ViewController = ViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func SubmitClicked(_ sender: AnyObject) {
        NSLog("submit")
        let udata: UserData = UserData()
        udata.name = name.stringValue
        udata.furigana = furigana.stringValue
        udata.birth_year = (Int)(Year.stringValue)!
        udata.birth_month = (Int)(Month.stringValue)!
        udata.birth_day = (Int)(Day.stringValue)!
        self.main.call(udata: udata)

    }
}
