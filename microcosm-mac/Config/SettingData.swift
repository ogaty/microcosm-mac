//
//  SettingData.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/10/09.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class SettingData: NSObject {
//    public SettingXml xmlData;
    var dispName: String = ""
    
    var dispCircle: [Bool] = [
    true, false, false, false, false, false
    ]

    var orbs: [Dictionary<Int, Double>]
    var dispPlanet: [Dictionary<Int, Bool>]
    var dispAspectPlanet: [Dictionary<Int, Bool>]
    var dispAspectCategory: [Dictionary<Int, Bool>]
    
    // [from, to]
    var aspectConjunction: [[Bool]] = [[]]
    var aspectOpposition: [[Bool]] = [[]]
    var aspectSquare: [[Bool]] = [[]]
    var aspectTrine: [[Bool]] = [[]]
    var aspectSextile: [[Bool]] = [[]]
    var aspectInconjunct: [[Bool]] = [[]]
    var aspectSesquiquadrate: [[Bool]] = [[]]

    // [from, to]
    var dispAspect: [[Bool]]
    
    // no: 設定番号
    init(_ no: Int)
    {
//        xmlData = new SettingXml();
        
        dispName = "表示設定" + (String)(no)
        dispCircle = [true, false, false, false, false, false]
        
        
        // dispPlanet[subIndex][commonDataNo]
        dispPlanet = [Dictionary<Int, Bool>]()
        dispAspectPlanet = [Dictionary<Int, Bool>]()
        dispAspectCategory = [Dictionary<Int, Bool>]()
        orbs = [Dictionary<Int, Double>]()
        dispAspect = [
            [ true, true, true, true, true, true ],
            [ true, true, true, true, true, true ],
            [ true, true, true, true, true, true ],
            [ true, true, true, true, true, true ],
            [ true, true, true, true, true, true ],
            [ true, true, true, true, true, true ]
        ];
        
        super.init()
    }
}
