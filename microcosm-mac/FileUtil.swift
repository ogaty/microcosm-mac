//
//  FileUtil.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/11/05.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class FileUtil: NSObject {
    
    func getDocumentDir() -> String {
        return NSSearchPathForDirectoriesInDomains(
            .documentDirectory,
            .userDomainMask, true)[0]
    }

    func ReadFileAsString(_ filePath: String) -> [String] {
        var ret: [String] = [String]()
        let url: NSURL = NSURL(fileURLWithPath: filePath)
        var text: NSString
        do {
            text = try NSString(contentsOf: url as URL, encoding: String.Encoding.utf8.rawValue)
        } catch {
            return []
        }
        text.enumerateLines{
            line, stop in
            ret.append(line)
        }
        
        return ret
    }
}
