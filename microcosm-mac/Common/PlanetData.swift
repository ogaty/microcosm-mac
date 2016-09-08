//
//  PlanetData.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/09/08.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class PlanetData: NSObject {
    // swiss_epheと対応した惑星番号
    var no: Int = 0;
    // 0.0～359.99、絶対値
    var absolute_position: Double = 0.0;
    // 速度(マイナスなら逆行)
    var speed: Double = 0.0;
    // 感受点はtrue
    var sensitive: Bool = false;
    // アスペクト対象リスト
//    public List<AspectInfo> aspects;
    // Pとのアスペクトはここ
//    public List<AspectInfo> secondAspects;
    // Tとのアスペクトはここ
//    public List<AspectInfo> thirdAspects;
    // 4重円アスペクトはここ
//    public List<AspectInfo> fourthAspects;
    // 5重円アスペクトはここ
//    public List<AspectInfo> fifthAspects;
    // 6重円アスペクトはここ
//    public List<AspectInfo> sixthAspects;
    // 7重円アスペクトはここ
//    public List<AspectInfo> seventhAspects;
    // 天体を表示するか
    var isDisp: Bool = true;
    // アスペクトを表示するか
    var isAspectDisp: Bool = true;
}
