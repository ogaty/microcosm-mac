//
//  UserDirView.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/10/31.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class UserDirView: NSView {
    var selectedUser: UserDbDirs? = nil

    @IBOutlet var detail: NSTextView!
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }

    @IBAction func cellSelected(_ sender: AnyObject) {
        let data: NSOutlineView = sender as! NSOutlineView
        if (data.selectedRow == 0) {
            return
        }
        
        let uitem = data.item(atRow: data.selectedRow)
        switch uitem {
            case let userdata as UserDbDirs:
                selectedUser = userdata
                if (!userdata.isDir) {
                    let xmlParse: UserXmlParser = UserXmlParser()
                    let udata: UserData = xmlParse.FileToUser((selectedUser?.filePath)!)!
                    detail.string = udata.name + "\n" + udata.birth_year.description + "/"
                        + udata.birth_month.description + "/" + udata.birth_day.description + " "
                        + udata.birth_hour.description + ":" + udata.birth_minute.description + ":"
                        + ((Int)(udata.birth_second).description)

                } else {
                    detail.string = ""
                }
            break
            default:
            break
        }
    }
    override func menu(for event: NSEvent) -> NSMenu? {
        // メニューの項目を作る
        let menu = NSMenu(title: "menu")
        menu.addItem(withTitle: "新規作成", action: #selector(self.newItemSelected), keyEquivalent: "N")
        menu.addItem(withTitle: "編集", action: #selector(self.updateSelected), keyEquivalent: "U")
        menu.addItem(withTitle: "削除", action: #selector(self.deleteSelected), keyEquivalent: "D")
        
        return menu
    }
    
    func newItemSelected(sender: AnyObject) {
        let storyboard: NSStoryboard = NSStoryboard(name: "Main", bundle: nil)
        let newUserVC : NewUserViewController = (storyboard.instantiateController(withIdentifier: "newUserWindow") as? NewUserViewController)!
        newUserVC.vc = window?.contentViewController as? DatabaseViewController
        window?.contentViewController?.presentViewControllerAsModalWindow(newUserVC)
    }
    
    func updateSelected(sender: AnyObject) {
        if (selectedUser != nil) {
            let xmlParse: UserXmlParser = UserXmlParser()
            let udata: UserData = xmlParse.FileToUser((selectedUser?.filePath)!)!
            udata.fullPath = (selectedUser?.filePath)!
            let storyboard: NSStoryboard = NSStoryboard(name: "Main", bundle: nil)
            let editUserVC : EditUserViewController = (storyboard.instantiateController(withIdentifier: "editUserWindow") as? EditUserViewController)!
            editUserVC.vc = window?.contentViewController as? DatabaseViewController
            editUserVC.udata = udata
            window?.contentViewController?.presentViewControllerAsModalWindow(editUserVC)
        }
    }
    
    func deleteSelected(sender: AnyObject) {
        if (selectedUser != nil) {
            do {
                try FileManager.default.removeItem(atPath: (selectedUser?.filePath)!)
                let vc = window?.contentViewController as? DatabaseViewController
                vc?.reload()
            } catch let error as NSError {
                NSLog(error.localizedDescription)
            }
        }
    }
}
