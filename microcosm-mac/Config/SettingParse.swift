//
//  SettingParse.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/10/09.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class SettingParse: NSObject {
    
    func getSetting(no: Int) -> SettingData {
        let documents = NSSearchPathForDirectoriesInDomains(
            .documentDirectory,
            .userDomainMask, true)[0]

        let settingName: String = "setting"
        let directoryName = "microcosm"  // 作成するディレクトリ名
        let createPath = documents + "/" + directoryName + "/system"    // 作成するディレクトリ名を含んだフルパス
        let setting: SettingData = SettingData(no: no)
        let settingFile = settingName + (String)(no) + ".mcsm"
        let settingPath = NSURL(fileURLWithPath: createPath).appendingPathComponent(settingFile)
        
        do {
            let text2 = try NSString(contentsOf: settingPath!, encoding: String.Encoding.utf8.rawValue)
            text2.enumerateLines{
                line, stop in
                var arr = line.components(separatedBy: ":")
                switch(arr[0]) {
                case "dispname":
                        setting.dispName = arr[1]
                        break
                case "orb_sun_soft_1st_0":
                    let tmpDic: Dictionary<Int, Double> = [0: (Double)(arr[1])!]
                    setting.orbs.append(tmpDic)
                    break
                case "orb_sun_soft_1st_1":
                    let tmpDic: Dictionary<Int, Double> = [0: (Double)(arr[1])!]
                    setting.orbs.append(tmpDic)
                    break
                case "orb_sun_soft_1st_2":
                    let tmpDic: Dictionary<Int, Double> = [0: (Double)(arr[1])!]
                    setting.orbs.append(tmpDic)
                    break
                case "orb_sun_soft_1st_3":
                    let tmpDic: Dictionary<Int, Double> = [0: (Double)(arr[1])!]
                    setting.orbs.append(tmpDic)
                    break
                case "orb_sun_soft_1st_4":
                    let tmpDic: Dictionary<Int, Double> = [0: (Double)(arr[1])!]
                    setting.orbs.append(tmpDic)
                    break
                case "orb_sun_soft_1st_5":
                    let tmpDic: Dictionary<Int, Double> = [0: (Double)(arr[1])!]
                    setting.orbs.append(tmpDic)
                    break
                default:
                    break
                }
            }
        } catch {
            let alert:NSAlert = NSAlert();
            alert.messageText = "エラー";
            alert.informativeText = "ファイルの読み込みに失敗しました。";
            alert.runModal();
            return setting
        }
        return setting
    }

}
