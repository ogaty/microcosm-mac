//
//  NewUserViewController.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/10/13.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class NewUserViewController: NSViewController {
    var main: ViewController = ViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func SubmitClicked(_ sender: AnyObject) {
        NSLog("submit")
        self.main.call()

    }
}
