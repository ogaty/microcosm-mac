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
        createDirectoryNode("", tmpDir: dir)
    }

    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: AnyObject) -> Bool {
        if let ofItem: AnyObject = item {
            switch ofItem {
            case let dirs as UserDbDirs:
                return dirs.files.count > 0
            default:
                return false
            }
        } else {
            return false
        }
    }
    
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem: AnyObject?) -> Int {
        if (numberOfChildrenOfItem == nil) {
            return 1
        }
        if let ofItem: UserDbDirs = numberOfChildrenOfItem as! UserDbDirs? {
            return ofItem.dirs.count + ofItem.files.count
        } else {
            return 1
        }
    }
    
    func outlineView(_ outlineView: NSOutlineView, viewForTableColumn tableColumn: NSTableColumn?, item: AnyObject) -> NSView? {
        let v = outlineView.make(withIdentifier: "DataCell", owner: self) as! NSTableCellView
        if let ofItem: AnyObject = item {
            switch ofItem {
            case let dirs as UserDbDirs:
                v.textField?.stringValue = dirs.name
                return v
            case let dirs as UserDbFiles:
                v.textField?.stringValue = dirs.fileName
                return v
            default:
                return nil
            }
        } else {
            return nil
        }
    }
    func outlineView(_ outlineView: NSOutlineView, objectValueForTableColumn tableColumn: NSTableColumn?, byItem: AnyObject?) -> AnyObject? {
        return "dir" as AnyObject?
    }
    
    func outlineView(_ outlineView: NSOutlineView, child: Int, ofItem: AnyObject?) -> AnyObject {
        if let ofItem: AnyObject = ofItem {
            switch ofItem {
            case let dirs as UserDbDirs:
                if (child == 0) {
                    return self
                } else {
                    return dirs.files[child - 1]
                }
            default:
                return self
            }
        } else {
            return dir
        }
    }
    
    func createDirectoryNode(_ dirname: String, tmpDir: UserDbDirs) {
        let documents = NSSearchPathForDirectoriesInDomains(
            .documentDirectory,
            .userDomainMask, true)[0] as String
        
        var isDir: ObjCBool = false
        var path = documents + "/microcosm/data"
        if (dirname != "") {
            path = path + "/" + dirname
        }

        var array: Array<String> = []
        do {
            array = try FileManager.default.contentsOfDirectory(atPath: path)
        } catch {
            NSLog("err")
        }

        array.forEach {
            if ($0.contains(".mcsm")) {
                tmpDir.files.append(UserDbFiles(fileName: $0, icon: nil))
            } else if (FileManager.default.fileExists(atPath: path + "/" + $0, isDirectory:&isDir )) {
                if (isDir.boolValue && $0 != ".DS_Store") {
                    dir.dirs.append(UserDbDirs(name: $0, icon: nil))
                    createDirectoryNode($0, tmpDir: tmpDir.dirs[tmpDir.dirs.count - 1])
                }
            }
        }
    }
    
}
