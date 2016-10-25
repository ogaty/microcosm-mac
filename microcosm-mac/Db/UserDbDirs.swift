//
//  UserDbDirs.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/10/25.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class UserDbDirs: NSObject {
    let name:String
    var files: [UserDbFiles] = []
    let icon:NSImage?
    
    init (name:String,icon:NSImage?){
        self.name = name
        self.icon = icon
    }
}
