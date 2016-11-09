//
//  DatabaseViewController.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/09/27.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class DatabaseViewController: NSViewController, NSOutlineViewDataSource, NSOutlineViewDelegate  {

    @IBOutlet weak var detail: NSScrollView!
    @IBOutlet weak var userFileList: NSOutlineView!
    var dir: UserDbDirs = UserDbDirs(name: "data", icon: nil, isDir: true, filePath: "")
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        createDirectoryNode("", tmpDir: dir)
    }

    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: AnyObject) -> Bool {
        if let ofItem: AnyObject = item {
            switch ofItem {
            case let dirs as UserDbDirs:
                return dirs.isDir
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
            return ofItem.items.count
        } else {
            return 1
        }
    }
    
    func outlineView(_ outlineView: NSOutlineView, viewForTableColumn tableColumn: NSTableColumn?, item: AnyObject) -> NSView? {
        let v = outlineView.make(withIdentifier: "DataCell", owner: self) as! NSTableCellView
            let dirs : UserDbDirs = item as! UserDbDirs
                v.textField?.stringValue = dirs.name
                return v
    }
    func outlineView(_ outlineView: NSOutlineView, objectValueForTableColumn tableColumn: NSTableColumn?, byItem: AnyObject?) -> AnyObject? {
        return "dir" as AnyObject?
    }
    
    func outlineView(_ outlineView: NSOutlineView, child: Int, ofItem: AnyObject?) -> AnyObject {
        if let ofItem: AnyObject = ofItem {
            switch ofItem {
            case let dirs as UserDbDirs:
                if (dirs.items.count == 0) {
                    NSLog("0")
                    return self
                }
                return dirs.items[child]
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
                tmpDir.items.append(UserDbDirs(name: $0, icon: nil, isDir: false, filePath: path + "/" + $0))
            } else if (FileManager.default.fileExists(atPath: path + "/" + $0, isDirectory:&isDir )) {
                if (isDir.boolValue && $0 != ".DS_Store") {
                    tmpDir.items.append(UserDbDirs(name: $0, icon: nil, isDir: true, filePath: $0))
                    createDirectoryNode($0, tmpDir: tmpDir.items[tmpDir.items.count - 1])
                }
            }
        }
    }
    
    func createUser(udata: UserData, fileName: String) {
        let datafileManager = FileManager.default
        let documents = NSSearchPathForDirectoriesInDomains(
            .documentDirectory,
            .userDomainMask, true)[0]
        let directoryName = "microcosm"  // 作成するディレクトリ名
        let createPath = documents + "/" + directoryName + "/data"
        var isDir : ObjCBool = false
        
        if (!datafileManager.fileExists(atPath: (createPath + "/" + fileName), isDirectory: &isDir)) {
            var str: String = "name:" + (String)(udata.name) + "\n"
            str += "furigana:" + (String)(udata.furigana) + "\n"
            str += "birth_year:" + (String)(udata.birth_year) + "\n"
            str += "birth_month:" + (String)(udata.birth_month) + "\n"
            str += "birth_day:" + (String)(udata.birth_day) + "\n"
            str += "birth_hour:" + (String)(udata.birth_hour) + "\n"
            str += "birth_minute:" + (String)(udata.birth_minute) + "\n"
            str += "birth_second:" + (String)(udata.birth_second) + "\n"
            str += "lat:" + (String)(udata.lat) + "\n"
            str += "lng:" + (String)(udata.lng) + "\n"
            str += "birth_place:" + udata.birth_place + "\n"
            str += "memo:" + udata.memo + "\n"
            str += "timezone:JST(日本標準)" + "\n"
            
            FileManager.default.createFile(atPath: (createPath + "/" + fileName + ".mcsm"), contents: str.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue)))
//            dir.items.append(UserDbDirs(name: udata.fileName, icon: nil, isDir: false, filePath: (createPath + "/" + fileName + ".mcsm")))
            reload()
        }
/*
        let save : NSSavePanel = NSSavePanel()
        save.canCreateDirectories = true
        save.nameFieldStringValue = "newuser.mcsm"
        save.beginSheetModal(for: NSApplication.shared().mainWindow!, completionHandler: {(result) in
            if (result == NSModalResponseOK) {
                let url = save.url
                NSLog((url?.absoluteString)!)
            }
        })
*/
    }
    
    func reload() -> Void {
        dir = UserDbDirs(name: "data", icon: nil, isDir: true, filePath: "")
        createDirectoryNode("", tmpDir: dir)
        userFileList.reloadData()
    }
}
