//
//  UserDirView.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/10/31.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class UserDirView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
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
        NSLog("newItemSelected")
    }
    
    func updateSelected(sender: AnyObject) {
        NSLog("piyo")
    }
    
    func deleteSelected(sender: AnyObject) {
        NSLog("huga")
    }    
}
