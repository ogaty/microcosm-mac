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
    let icon:NSImage?
    var items: [UserDbDirs] = []
    var isDir: Bool = false
    var filePath: String
    
    init (name:String,icon:NSImage?,isDir:Bool, filePath: String){
        self.name = name
        self.icon = icon
        self.isDir = isDir
        self.filePath = filePath
    }
}
