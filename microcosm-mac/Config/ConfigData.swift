//
//  ConfigData.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/09/08.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class ConfigData: NSObject {
    // 天文データパス
    var ephepath: String = ""
    
    // GEO or HERIO
    var centric: String = "GEO_CENTRIC"
    
    // TROPICAL or SIDEREAL
    var sidereal: String = "TROPICAL"
    
    // 現在地
    var defaultPlace: String = "東京都千代田区"
    
    // 緯度
    var lat: Double = 35.670587
    
    // 経度
    var lng: Double = 139.772003
    
    // デフォルトタイムゾーン
    var defaultTimezone: String = "JST"
    
    // プログレス計算方法
    var progression: String = "PRIMARY"
    
    // デフォルト表示
    var defaultBands: Int = 1
    
    // ハウス
    var houseCalc: String = "PLACIDUS"
    
    // 10進、60進
    var decimalDisp: String = "DECIMAL"
    
    // フル表示かミニ表示か
    var dispPattern: Int = 0

    
    var zodiacOuterWidth: Int = 340
    var zodiacWidth: Int = 60
    var zodiacCenter: Int = 90

    var zodiacPaddingLeft: Int = 10
    var zodiacPaddingTop: Int = 10
}
