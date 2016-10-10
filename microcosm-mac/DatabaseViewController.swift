//
//  DatabaseViewController.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/09/27.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class DatabaseViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        let documents = NSSearchPathForDirectoriesInDomains(
            .documentDirectory,
            .userDomainMask, true)[0]

        FileManager.default.subpaths(atPath: documents + "/microcosm")?.forEach {
            NSLog($0)
        }
    
    }
    
}
