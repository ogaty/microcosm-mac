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
            if ($0.contains(".csm")) {
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
            let xmlParser: UserXmlParser = UserXmlParser()
            let str: String = xmlParser.UserToXml(udata)
            
            FileManager.default.createFile(atPath: (createPath + "/" + (udata.fileName) + ".csm"), contents: str.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue)))

            FileManager.default.createFile(atPath: (createPath + "/" + fileName + ".csm"), contents: str.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue)))
//            dir.items.append(UserDbDirs(name: udata.fileName, icon: nil, isDir: false, filePath: (createPath + "/" + fileName + ".csm")))
            reload()
        }
/*
        let save : NSSavePanel = NSSavePanel()
        save.canCreateDirectories = true
        save.nameFieldStringValue = "newuser.csm"
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
