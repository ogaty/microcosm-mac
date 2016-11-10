//
//  UserData.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/10/10.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class UserData: NSObject {
    var fileName: String = "newuser.csm"
    var fullPath: String = ""
    var name: String = "名称未設定"
    var furigana: String = ""
    
    var birth_year: Int = 2000
    var birth_month: Int = 1
    var birth_day: Int = 1
    var birth_hour: Int = 12
    var birth_minute: Int = 0
    var birth_second: Double = 0
    
    var lat: Double = 35.670587
    var lng: Double = 139.772003
    var birth_place: String = "東京都"
    
    var memo: String = ""
    var timezone: String = "JST(日本標準)"
    
}
