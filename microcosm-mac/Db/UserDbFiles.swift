//
//  UserDbFiles.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/10/25.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class UserDbFiles: NSObject {
    let fileName:String
    let icon:NSImage?
    
    init (fileName:String, icon:NSImage?){
        self.fileName = fileName
        self.icon = icon
    }

}
