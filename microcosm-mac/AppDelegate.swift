//
//  AppDelegate.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/07/09.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationShouldHandleReopen(sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        if let firstWindow = sender.windows.first {
            firstWindow.makeKeyAndOrderFront(sender)
        }
        return true
    }
    
    func applicationShouldTerminate(sender: NSApplication) -> NSApplicationTerminateReply {
        return  .terminateNow
    }
    

    @IBAction func openUser(_ sender: AnyObject) {
        var udata: UserData = UserData()

        let openPanel = NSOpenPanel()
        openPanel.allowsMultipleSelection = false // 複数ファイルの選択を許すか
        openPanel.canChooseDirectories = false // ディレクトリを選択できるか
        openPanel.canCreateDirectories = false // ディレクトリを作成できるか
        openPanel.canChooseFiles = true // ファイルを選択できるか
        openPanel.allowedFileTypes = NSImage.imageTypes() // 選択できるファイル種別
        let documents = NSSearchPathForDirectoriesInDomains(
            .documentDirectory,
            .userDomainMask, true)[0]
        let directoryName = "microcosm"  // 作成するディレクトリ名
        let dataPath = documents + "/" + directoryName + "/data"    // 作成するディレクトリ名を含んだフルパス
        let dataPathUrl = NSURL(fileURLWithPath: dataPath)
        openPanel.directoryURL = dataPathUrl as URL
        
        openPanel.allowedFileTypes = ["csm"]
        
        openPanel.begin { (result) -> Void in
            if result == NSFileHandlingPanelOKButton { // ファイルを選択したか(OKを押したか)
                guard let url = openPanel.url else { return }
                do {
                    let nstxt = try NSString(contentsOf: url, encoding: String.Encoding.utf8.rawValue)
                    let parser: UserXmlParser = UserXmlParser()
                    udata = parser.XmlToUser(nstxt)
                    udata.fileName = url.absoluteString
                }
                catch {/* error handling here */
                    let alert:NSAlert = NSAlert();
                    alert.messageText = "エラー";
                    alert.informativeText = "ファイルの読み込みに失敗しました。";
                    alert.runModal();
                    return
                }
                if let window = NSApplication.shared().mainWindow {
                    let mainview: ViewController = (window.contentViewController as? ViewController)!
                    mainview.setUserData(udata)
                }

            }
        }

    }

    @IBAction func openDatabase(_ sender: AnyObject) {
        let storyboard: NSStoryboard = NSStoryboard(name: "Main", bundle: nil)
        let dbvc: DatabaseViewController = storyboard.instantiateController(withIdentifier: "dbViewController") as! DatabaseViewController
        if let window = NSApplication.shared().mainWindow {
            dbvc.main = (window.contentViewController as? ViewController)!

            window.contentViewController?.presentViewControllerAsModalWindow(dbvc)
        }
    }

    @IBAction func OpenOfficialSite(_ sender: AnyObject) {
        let url = NSURL(string: "http://microcosm.ogatism.com")
        NSWorkspace.shared().open(url as! URL)
    }
}

