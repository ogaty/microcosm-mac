//
//  DatabaseViewController.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/09/27.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class DatabaseViewController: NSViewController, NSOutlineViewDataSource, NSOutlineViewDelegate  {

    @IBOutlet weak var userFileList: NSOutlineView!
    var dir: UserDbDirs = UserDbDirs(name: "data", icon: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        let documents = NSSearchPathForDirectoriesInDomains(
            .documentDirectory,
            .userDomainMask, true)[0] as String

        var isDir: ObjCBool = false
        let path = documents + "/microcosm/data"
        var array: Array<String> = []
        do {
            array = try FileManager.default.contentsOfDirectory(atPath: path)
        } catch {
            NSLog("err")
        }
        
        array.forEach {
            if ($0.contains(".mcsm")) {
                dir.files.append(UserDbFiles(fileName: $0, icon: nil))
            } else if (FileManager.default.fileExists(atPath: path + "/" + $0, isDirectory:&isDir )) {
                if (isDir.boolValue && $0 != ".DS_Store") {
                    dir.dirs.append(UserDbDirs(name: $0, icon: nil))
                }
            }
        }

        
    }

    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: AnyObject) -> Bool {
        return false
    }
    
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem: AnyObject?) -> Int {
        if (numberOfChildrenOfItem == nil) {
            return 1
        }
        return 1
    }
    
    func outlineView(_ outlineView: NSOutlineView, viewForTableColumn tableColumn: NSTableColumn?, item: AnyObject) -> NSView? {
        let v = outlineView.make(withIdentifier: "DataCell", owner: self) as! NSTableCellView
        let i:UserDbDirs = item as! UserDbDirs
        v.textField?.stringValue = i.name
        return v
    }
    func outlineView(_ outlineView: NSOutlineView, objectValueForTableColumn tableColumn: NSTableColumn?, byItem: AnyObject?) -> AnyObject? {
        return "dir" as AnyObject?
    }
    
    func outlineView(_ outlineView: NSOutlineView, child: Int, ofItem: AnyObject?) -> AnyObject {
        if let ofItem: AnyObject = ofItem {
            switch ofItem {
            case let dirs as UserDbDirs:
                return dirs.files[child]
            default:
                return self
            }
        } else {
            return dir
        }
    }
    
}
