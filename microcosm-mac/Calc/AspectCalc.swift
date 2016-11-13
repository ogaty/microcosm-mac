//
//  AspectCalc.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/10/11.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class AspectCalc: NSObject {
    let common: CommonData = CommonData()
    // 同じリストのアスペクトを計算する
    func  AspectCalcSame(a_setting: SettingData, list: [PlanetData]) -> [PlanetData]
    {
        // if (natal-natal)
        for i in 0..<list.count-1 {
            if (!list[i].isAspectDisp)
            {
                continue;
            }
            for j in i+1..<list.count {
                if (!list[j].isAspectDisp)
                {
                    continue;
                }

                
                // 90.0 と　300.0では210度ではなく150度にならなければいけない
                // アスペクトは180°以上にはならない
                var from: Double;
                var to: Double;
                if (list[i].absolute_position - list[j].absolute_position < 0) {
                    to = list[j].absolute_position;
                    from = list[i].absolute_position;
                }
                else
                {
                    to = list[i].absolute_position;
                    from = list[j].absolute_position;
                }
                var aspect_degree: Double = to - from;
                if (aspect_degree > 180)
                {
                    aspect_degree = 360 + from - to;
                }
                
                for k in 0..<6 {
                    if (i == common.ZODIAC_SUN)
                    {
                        var softHard: Int = -1
                        if (k == 0 || // CONJUNCTION
                            k == 1 || // OPPOSITION
                            k == 2 || // TRINE
                            k == 3 || // SQUARE
                            k == 4  // SEXTILE
                            ) {
                            if (aspect_degree < getDegree(kind: k) + a_setting.orbs[0][common.SUN_SOFT_1ST]! &&
                                aspect_degree > getDegree(kind: k) - a_setting.orbs[0][common.SUN_SOFT_1ST]!)
                            {
                                softHard = common.ORB_SOFT
                            }
                            else if (aspect_degree < getDegree(kind: k) + a_setting.orbs[0][common.SUN_HARD_1ST]! &&
                                aspect_degree > getDegree(kind: k) - a_setting.orbs[0][common.SUN_HARD_1ST]!)
                            {
                                softHard = common.ORB_HARD
                            }
                        } else if ( k == 5 || // INCONJUNCT
                                    k == 6 // SESQUIQUADRATE
                                    ) {
                            if (aspect_degree < getDegree(kind: k) + a_setting.orbs[0][common.SUN_SOFT_150]! &&
                                aspect_degree > getDegree(kind: k) - a_setting.orbs[0][common.SUN_SOFT_150]!)
                            {
                                softHard = common.ORB_SOFT
                            }
                            else if (aspect_degree < getDegree(kind: k) + a_setting.orbs[0][common.SUN_HARD_150]! &&
                                aspect_degree > getDegree(kind: k) - a_setting.orbs[0][common.SUN_HARD_150]!)
                            {
                                softHard = common.ORB_HARD
                            }
                        } else {
                            if (aspect_degree < getDegree(kind: k) + a_setting.orbs[0][common.SUN_SOFT_2ND]! &&
                                aspect_degree > getDegree(kind: k) - a_setting.orbs[0][common.SUN_SOFT_2ND]!)
                            {
                                softHard = common.ORB_SOFT
                            }
                            else if (aspect_degree < getDegree(kind: k) + a_setting.orbs[0][common.SUN_HARD_2ND]! &&
                                aspect_degree > getDegree(kind: k) - a_setting.orbs[0][common.SUN_HARD_2ND]!)
                            {
                                softHard = common.ORB_HARD
                            }
                        }
                        if (softHard >= 0) {
                            let aspect: AspectInfo = AspectInfo()
                            aspect.targetPosition = list[j].absolute_position
                            aspect.aspectKind = k
                            aspect.softHard = softHard
                            aspect.srcPlanetNo = list[i].no
                            aspect.targetPlanetNo = list[j].no
                            aspect.absoluteDegree = aspect_degree
                            list[i].aspects.append(aspect)
                            break
                        }
                    }
                    else if (i == common.ZODIAC_MOON)
                    {
                        var softHard: Int = -1
                        if (k == 0 || // CONJUNCTION
                            k == 1 || // OPPOSITION
                            k == 2 || // TRINE
                            k == 3 || // SQUARE
                            k == 4  // SEXTILE
                            ) {
                            if (aspect_degree < getDegree(kind: k) + a_setting.orbs[0][common.MOON_SOFT_1ST]! &&
                                aspect_degree > getDegree(kind: k) - a_setting.orbs[0][common.MOON_SOFT_1ST]!)
                            {
                                softHard = common.ORB_SOFT
                            }
                            else if (aspect_degree < getDegree(kind: k) + a_setting.orbs[0][common.MOON_HARD_1ST]! &&
                                aspect_degree > getDegree(kind: k) - a_setting.orbs[0][common.MOON_HARD_1ST]!)
                            {
                                softHard = common.ORB_HARD
                            }
                        } else if ( k == 5 || // INCONJUNCT
                            k == 6 // SESQUIQUADRATE
                            ) {
                            if (aspect_degree < getDegree(kind: k) + a_setting.orbs[0][common.MOON_SOFT_150]! &&
                                aspect_degree > getDegree(kind: k) - a_setting.orbs[0][common.MOON_SOFT_150]!)
                            {
                                softHard = common.ORB_SOFT
                            }
                            else if (aspect_degree < getDegree(kind: k) + a_setting.orbs[0][common.MOON_HARD_150]! &&
                                aspect_degree > getDegree(kind: k) - a_setting.orbs[0][common.MOON_HARD_150]!)
                            {
                                softHard = common.ORB_HARD
                            }
                        } else {
                            if (aspect_degree < getDegree(kind: k) + a_setting.orbs[0][common.MOON_SOFT_2ND]! &&
                                aspect_degree > getDegree(kind: k) - a_setting.orbs[0][common.MOON_SOFT_2ND]!)
                            {
                                softHard = common.ORB_SOFT
                            }
                            else if (aspect_degree < getDegree(kind: k) + a_setting.orbs[0][common.MOON_SOFT_150]! &&
                                aspect_degree > getDegree(kind: k) - a_setting.orbs[0][common.MOON_SOFT_150]!)
                            {
                                softHard = common.ORB_HARD
                            }
                        }
                        if (softHard >= 0) {
                            let aspect: AspectInfo = AspectInfo()
                            aspect.targetPosition = list[j].absolute_position
                            aspect.aspectKind = k
                            aspect.softHard = softHard
                            aspect.srcPlanetNo = list[i].no
                            aspect.targetPlanetNo = list[j].no
                            aspect.absoluteDegree = aspect_degree
                            list[i].aspects.append(aspect)
                            break
                        }
                    } else {
                        var softHard: Int = -1
                        if (k == 0 || // CONJUNCTION
                            k == 1 || // OPPOSITION
                            k == 2 || // TRINE
                            k == 3 || // SQUARE
                            k == 4  // SEXTILE
                            ) {
                            if (aspect_degree < getDegree(kind: k) + a_setting.orbs[0][common.OTHER_SOFT_1ST]! &&
                                aspect_degree > getDegree(kind: k) - a_setting.orbs[0][common.OTHER_SOFT_1ST]!)
                            {
                                softHard = 0
                            }
                            else if (aspect_degree < getDegree(kind: k) + a_setting.orbs[0][common.OTHER_HARD_1ST]! &&
                                aspect_degree > getDegree(kind: k) - a_setting.orbs[0][common.OTHER_HARD_1ST]!)
                            {
                                softHard = 1
                            }
                        } else if ( k == 5 || // INCONJUNCT
                            k == 6 // SESQUIQUADRATE
                            ) {
                            if (aspect_degree < getDegree(kind: k) + a_setting.orbs[0][common.OTHER_SOFT_150]! &&
                                aspect_degree > getDegree(kind: k) - a_setting.orbs[0][common.OTHER_SOFT_150]!)
                            {
                                softHard = 0
                            }
                            else if (aspect_degree < getDegree(kind: k) + a_setting.orbs[0][common.OTHER_HARD_150]! &&
                                aspect_degree > getDegree(kind: k) - a_setting.orbs[0][common.OTHER_HARD_150]!)
                            {
                                softHard = 1
                            }
                        } else {
                            if (aspect_degree < getDegree(kind: k) + a_setting.orbs[0][common.OTHER_SOFT_2ND]! &&
                                aspect_degree > getDegree(kind: k) - a_setting.orbs[0][common.OTHER_SOFT_2ND]!)
                            {
                                softHard = 0
                            }
                            else if (aspect_degree < getDegree(kind: k) + a_setting.orbs[0][common.OTHER_HARD_2ND]! &&
                                aspect_degree > getDegree(kind: k) - a_setting.orbs[0][common.OTHER_HARD_2ND]!)
                            {
                                softHard = 1
                            }
                        }
                        if (softHard >= 0) {
                            let aspect: AspectInfo = AspectInfo()
                            aspect.targetPosition = list[j].absolute_position
                            aspect.aspectKind = k
                            aspect.softHard = softHard
                            aspect.srcPlanetNo = list[i].no
                            aspect.targetPlanetNo = list[j].no
                            aspect.absoluteDegree = aspect_degree
                            list[i].aspects.append(aspect)
                            break
                        }
                    }

                }
            }
        }
        
        return list
    }
    
    func getDegree(kind: Int) -> Double
    {
        switch (kind)
        {
        case 0:
            return 0.0;
        case 1:
            return 180.0;
        case 2:
            return 120.0;
        case 3:
            return 90.0;
        case 4:
            return 60.0;
        case 5:
            return 150.0;
        case 6:
            return 135.0;
        default:
            break;
        }
    
        return 0.0;
    }
}
