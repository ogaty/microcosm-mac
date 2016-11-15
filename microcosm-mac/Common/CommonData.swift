//
//  CommonData.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/09/05.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class CommonData: NSObject {
    let TIMEZONE_JST: Double = 9.0
    let TIMEZONE_GMT: Double = 0.0
    
    let ZODIAC_SUN: Int = 0
    let ZODIAC_MOON: Int = 1
    let ZODIAC_MERCURY: Int = 2
    let ZODIAC_VENUS: Int = 3
    let ZODIAC_MARS: Int = 4
    let ZODIAC_JUPITER: Int = 5
    let ZODIAC_SATURN: Int = 6
    let ZODIAC_URANUS: Int = 7
    let ZODIAC_NEPTUNE: Int = 8
    let ZODIAC_PLUTO: Int = 9
    let ZODIAC_DH_TRUENODE: Int = 11
    let ZODIAC_DT_OSCULATE_APOGEE: Int = 13
    let ZODIAC_LILITH: Int = 13 // 小惑星のリリス(1181)と混同しないこと
    let ZODIAC_EARTH: Int = 14
    let ZODIAC_CHIRON: Int = 15
    let ZODIAC_CELES: Int = 17
    let ZODIAC_PARAS: Int = 18
    let ZODIAC_JUNO: Int = 19
    let ZODIAC_VESTA: Int = 20
    let ZODIAC_ASC: Int = 10000
    let ZODIAC_MC: Int = 10001
    
    let SIGN_ARIES: Int = 0
    let SIGN_TAURUS: Int = 1
    let SIGN_GEMINI :Int = 2;
    let SIGN_CANCER :Int = 3;
    let SIGN_LEO :Int = 4;
    let SIGN_VIRGO :Int = 5;
    let SIGN_LIBRA :Int = 6;
    let SIGN_SCORPIO :Int = 7;
    let SIGN_SAGITTARIUS :Int = 8;
    let SIGN_CAPRICORN :Int = 9;
    let SIGN_AQUARIUS :Int = 10;
    let SIGN_PISCES :Int = 11;
    
    let SUN_HARD_1ST: Int = 0
    let SUN_SOFT_1ST: Int = 1
    let SUN_HARD_2ND: Int = 2
    let SUN_SOFT_2ND: Int = 3
    let SUN_HARD_150: Int = 4
    let SUN_SOFT_150: Int = 5
    let MOON_HARD_1ST: Int = 6
    let MOON_SOFT_1ST: Int = 7
    let MOON_HARD_2ND: Int = 8
    let MOON_SOFT_2ND: Int = 9
    let MOON_HARD_150: Int = 10
    let MOON_SOFT_150: Int = 11
    let OTHER_HARD_1ST: Int = 12
    let OTHER_SOFT_1ST: Int = 13
    let OTHER_HARD_2ND: Int = 14
    let OTHER_SOFT_2ND: Int = 15
    let OTHER_HARD_150: Int = 16
    let OTHER_SOFT_150: Int = 17
    
    let CONJUNCTION: Int = 1
    let OPPOSITION: Int = 2
    let INCONJUNCT: Int = 3
    let SESQUIQUADRATE: Int = 4
    let TRINE: Int = 5
    let SQUARE: Int = 6
    let SEXTILE: Int = 7
    
    let ORB_SOFT: Int = 0
    let ORB_HARD: Int = 1

    
    // タイムゾーンを返す
    func  getTimezone(_ timezone: String) -> Double
    {
        switch (timezone)
        {
        case "JST":
            return TIMEZONE_JST;
        default:
            break;
        }
        return TIMEZONE_GMT;
    }

    // (日本標準)とかの文字列を返す
    func  getTimezoneLongText(_ timezone: String) -> String
    {
        switch (timezone)
        {
            case "JST":
                return "JST(日本標準)";
            default:
                break;
        }
        return "GMT(世界標準)"
    }

    // JSTのみを返す
    func getTimezoneShortText(_ index: Int) -> String
    {
        switch (index)
        {
            case 0:
                return "JST"
            default:
                break;
        }
        return "UTC"
    }

    // SelectBoxのIndexを返す
    func getTimezoneIndex(_ timezone: String) -> Int
    {
        switch (timezone)
        {
            case "JST":
                return 0;
            case "UTC":
                fallthrough
            default:
                break
        }
        return 0;
    }

    // 番号を引数に天体のシンボルを返す
    func getPlanetSymbol(_ number: Int) -> String
    {
        switch (number)
        {
            case ZODIAC_SUN:
                return "\u{2609}";
            case ZODIAC_MOON:
                return "\u{263d}";
            case ZODIAC_MERCURY:
                return "\u{263f}";
            case ZODIAC_VENUS:
                return "\u{2640}";
            case ZODIAC_MARS:
                return "\u{2642}";
            case ZODIAC_JUPITER:
                return "\u{2643}";
            case ZODIAC_SATURN:
                return "\u{2644}";
            case ZODIAC_URANUS:
                return "\u{2645}";
            case ZODIAC_NEPTUNE:
                return "\u{2646}";
            case ZODIAC_PLUTO:
                return "\u{2647}";
                // 外部フォントだと天文学用のPLUTOになっているのが困りどころ
            case ZODIAC_DH_TRUENODE:
                return "\u{260a}";
            case ZODIAC_EARTH:
                return "\u{2641}";
            case ZODIAC_CHIRON:
                return "\u{26b7}";
            case ZODIAC_LILITH:
                return "\u{26b8}";
            default:
                break
        }
        return "";
    }

    // 番号を引数に天体の文字列を返す
    func getPlanetText(_ number: Int) -> String
    {
        switch (number)
        {
            case ZODIAC_SUN:
                return "太陽";
            case ZODIAC_MOON:
                return "月";
            case ZODIAC_MERCURY:
                return "水星";
            case ZODIAC_VENUS:
                return "金星";
            case ZODIAC_MARS:
                return "火星";
            case ZODIAC_JUPITER:
                return "木星";
            case ZODIAC_SATURN:
                return "土星";
            case ZODIAC_URANUS:
                return "天王星";
            case ZODIAC_NEPTUNE:
                return "海王星";
            case ZODIAC_PLUTO:
                return "冥王星";
            case ZODIAC_DH_TRUENODE:
                return "ヘッド";
            case ZODIAC_CHIRON:
                return "キロン";
            case ZODIAC_ASC:
                return "ASC";
            case ZODIAC_MC:
                return "MC";
            case ZODIAC_EARTH:
                return "地球";
            case ZODIAC_LILITH:
                return "リリス";
            default:
                break
        }
        return "";
    }

    // 番号を引数にサインのシンボルを返す
    func getSignSymbol(_ number: Int) -> String
    {
        switch (number)
        {
        case SIGN_ARIES:
            return "\u{2648}";
        case SIGN_TAURUS:
            return "\u{2649}";
        case SIGN_GEMINI:
            return "\u{264a}";
        case SIGN_CANCER:
            return "\u{264b}";
        case SIGN_LEO:
            return "\u{264c}";
        case SIGN_VIRGO:
            return "\u{264d}";
        case SIGN_LIBRA:
            return "\u{264e}";
        case SIGN_SCORPIO:
            return "\u{264f}";
        case SIGN_SAGITTARIUS:
            return "\u{2650}";
        case SIGN_CAPRICORN:
            return "\u{2651}";
        case SIGN_AQUARIUS:
            return "\u{2652}";
        case SIGN_PISCES:
            return "\u{2653}";
        default:
            break
        }
        return "";
    }

    // 番号を引数にサインルーラーのシンボルを返す
    func getSignRulersSymbol(_ number: Int) -> String
    {
        switch (number)
        {
        case SIGN_ARIES:
            // 火星
            return "\u{2642}";
        case SIGN_TAURUS:
            // 金星
            return "\u{2640}";
        case SIGN_GEMINI:
            // 水星
            return "\u{263f}";
        case SIGN_CANCER:
            // 月
            return "\u{263d}";
        case SIGN_LEO:
            // 太陽
            return "\u{2609}";
        case SIGN_VIRGO:
            // 水星
            return "\u{263f}";
        case SIGN_LIBRA:
            // 金星
            return "\u{2640}";
        case SIGN_SCORPIO:
            // 冥王星
            return "\u{2647}";
        case SIGN_SAGITTARIUS:
            // 木星
            return "\u{2643}";
        case SIGN_CAPRICORN:
            // 土星
            return "\u{2644}";
        case SIGN_AQUARIUS:
            // 天王星
            return "\u{2645}";
        case SIGN_PISCES:
            // 海王星
            return "\u{2646}";
        default:
            break
        }
        return "";
    }

    // 番号を引数に感受点のシンボルを返す
    func getSensitiveSymbol(_ number: Int) -> String
    {
        switch (number)
        {
        // UNICODEが無い！
        case ZODIAC_ASC:
            return "Ac";
            // return "K";
        // UNICODEが無い！
        case ZODIAC_MC:
            return "Mc";
            // return "L";
        case ZODIAC_DH_TRUENODE:
            return "\u{260a}";
            // return "M";
        default:
            break
        }
        return "";
    }

    // 番号を引数に感受点の文字列を返す
    func getSensitiveText(_ number: Int) -> String
    {
        switch (number)
        {
        case ZODIAC_ASC:
            return "ASC";
        case ZODIAC_MC:
            return "MC";
        case ZODIAC_DH_TRUENODE:
            return "D.H.";
        default:
            break
        }
        return "";
    }
    
    // 色を返す
    func getPlanetColor(_ number: Int) -> Int
    {
        if (number == ZODIAC_SUN)
        {
            return 0
//            return System.Windows.Media.Brushes.Olive;
        }
        else if (number == ZODIAC_MOON)
        {
            return 1
//            return System.Windows.Media.Brushes.DarkGoldenrod;
        }
        else if (number == ZODIAC_MERCURY)
        {
            return 2
//            return System.Windows.Media.Brushes.Purple;
        }
        else if (number == ZODIAC_VENUS)
        {
            return 3
//            return System.Windows.Media.Brushes.Green;
        }
        else if (number == ZODIAC_MARS)
        {
            return 4
//            return System.Windows.Media.Brushes.Red;
        }
        else if (number == ZODIAC_JUPITER)
        {
            return 5
//            return System.Windows.Media.Brushes.Maroon;
        }
        else if (number == ZODIAC_SATURN)
        {
            return 6
//            return System.Windows.Media.Brushes.DimGray;
        }
        else if (number == ZODIAC_URANUS)
        {
            return 7
//            return System.Windows.Media.Brushes.DarkTurquoise;
        }
        else if (number == ZODIAC_NEPTUNE)
        {
            return 8
//            return System.Windows.Media.Brushes.DodgerBlue;
        }
        else if (number == ZODIAC_PLUTO)
        {
            return 9
//            return System.Windows.Media.Brushes.DeepPink;
        }
        else if (number == ZODIAC_EARTH)
        {
            return 10
//            return System.Windows.Media.Brushes.SkyBlue;
        }
        else if (number == ZODIAC_DH_TRUENODE)
        {
            return 11
//            return System.Windows.Media.Brushes.DarkCyan;
        }
        else if (number == ZODIAC_LILITH)
        {
            return 12
//            return System.Windows.Media.Brushes.MediumSeaGreen;
        }
        return 13
//        return System.Windows.Media.Brushes.Black;
    }


    // サイン番号を返す(0:牡羊座、11:魚座)
    func getSign(_ absolute_position: Double) -> Int
    {
        return (Int)((Int)(absolute_position) / 30)
    }
    
    // サインテキストを返す(0:♈、11:♓)
    func getSignText(_ absolute_position: Double) -> String
    {
        return getSignSymbol((Int)((Int)(absolute_position) / 30));
    }

    // サインテキストを返す(0:♈、11:♓)
    func getSignTextJp(_ absolute_position: Double) -> String
    {
        switch((Int)((Int)(absolute_position) / 30))
        {
        case 0:
            return "牡羊座";
        case 1:
            return "牡牛座";
        case 2:
            return "双子座";
        case 3:
            return "蟹座";
        case 4:
            return "獅子座";
        case 5:
            return "乙女座";
        case 6:
            return "天秤座";
        case 7:
            return "蠍座";
        case 8:
            return "射手座";
        case 9:
            return "山羊座";
        case 10:
            return "水瓶座";
        case 11:
            return "魚座";
        default:
            break;
        }
        return "";
    }

    // サイン色を返す
    func getSignColor(_ absolute_position: Double) -> Int
    {
        switch((Int)((Int)(absolute_position) / 30))
        {
        case 0:
            // 牡羊座
            return 0
//            return System.Windows.Media.Brushes.OrangeRed;
        case 1:
            // 牡牛座
            return 1
//            return System.Windows.Media.Brushes.Goldenrod;
        case 2:
            // 双子座
            return 2
//            return System.Windows.Media.Brushes.MediumSeaGreen;
        case 3:
            // 蟹座
            return 3
//            return System.Windows.Media.Brushes.SteelBlue;
        case 4:
            // 獅子座
            return 4
//            return System.Windows.Media.Brushes.Crimson;
        case 5:
            // 乙女座
            return 5
//            return System.Windows.Media.Brushes.Maroon;
        case 6:
            // 天秤座
            return 6
//            return System.Windows.Media.Brushes.Teal;
        case 7:
            // 蠍座
            return 7
//            return System.Windows.Media.Brushes.CornflowerBlue;
        case 8:
            // 射手座
            return 8
//            return System.Windows.Media.Brushes.DeepPink;
        case 9:
            // 山羊座
            return 9
//            return System.Windows.Media.Brushes.SaddleBrown;
        case 10:
            // 水瓶座
            return 10
//            return System.Windows.Media.Brushes.CadetBlue;
        case 11:
            // 魚座
            return 11
//            return System.Windows.Media.Brushes.DodgerBlue;
        default:
            break;
        }
        return 12
//        return System.Windows.Media.Brushes.Black;
    }
    
    // サイン度数を返す(0～29.9)
    func getDeg(_ absolute_position: Double) -> Double
    {
        return (absolute_position.truncatingRemainder(dividingBy: 30))
    }

    // レトログレード文字を返す
    func getRetrograde(_ speed: Double) -> String
    {
        if (speed < 0)
        {
            return "\u{211e}";
        }
        return "";
    }

    // subIndexを返す
    /*
    func ringSubIndex getRingSubIndex(int subindex)
    {
        ringSubIndex ret = new ringSubIndex()
        {
            from = 0,
            to = 0
        };
        switch (subindex)
        {
        case 0:
            // N
            ret.from = 0;
            ret.to = 0;
            break;
    case 1:
    // P
    ret.from = 1;
    ret.to = 1;
    break;
    case 2:
    // T
    ret.from = 2;
    ret.to = 2;
    break;
    case 3:
    // N-P
    ret.from = 0;
    ret.to = 1;
    break;
    case 4:
    // N-T
    ret.from = 0;
    ret.to = 2;
    break;
    case 5:
    // P-T
    ret.from = 1;
    ret.to = 2;
    break;
    case 6:
    // N-4
    ret.from = 0;
    ret.to = 3;
    break;
    case 7:
    // N-5
    ret.from = 0;
    ret.to = 4;
    break;
    case 8:
    // P-4
    ret.from = 1;
    ret.to = 3;
    break;
    case 9:
    // P-5
    ret.from = 1;
    ret.to = 4;
    break;
    case 10:
    // T-4
    ret.from = 2;
    ret.to = 3;
    break;
    case 11:
    // T-5
    ret.from = 2;
    ret.to = 4;
    break;
    case 12:
    // 4-4
    ret.from = 3;
    ret.to = 3;
    break;
    case 13:
    // 4-5
    ret.from = 3;
    ret.to = 4;
    break;
    case 14:
    // 5-5
    ret.from = 4;
    ret.to = 4;
    break;
    default:
    break;
    }
    
    return ret;
    }
 */

    // ユーザーデータをイベントデータに変換
    /*
    public static UserEventData udata2event(UserData udata)
    {
    return new UserEventData()
    {
    name = udata.name,
    birth_year = udata.birth_year,
    birth_month = udata.birth_month,
    birth_day = udata.birth_day,
    birth_hour = udata.birth_hour,
    birth_minute = udata.birth_minute,
    birth_second = udata.birth_second,
    birth_place = udata.birth_place,
    birth_str = udata.birth_str,
    lat = udata.lat,
    lng = udata.lng,
    lat_lng = udata.lat_lng,
    timezone = udata.timezone,
    memo = udata.memo
    };
    }
 */

    func match(_ target: String, pattern: String) -> Bool {
        let regex: NSRegularExpression
        do {
            regex = try NSRegularExpression(pattern: pattern, options: [])
        } catch let error as NSError {
            return false
        }
        let results: [NSTextCheckingResult] = regex.matches(in: target, options: [], range: NSMakeRange(0, target.characters.count))

        for (idx, result) in results.enumerated() {
            let range = result.rangeAt(idx)
            if range.location != NSNotFound {
                return true
            }
        }
        
        return false
    }

    func isNumericString(str: String) -> Bool {
        let charSet = NSCharacterSet.decimalDigits
        for char in str.unicodeScalars {
            if charSet.contains(char) != true {
                return false
            }
        }
        return true
    }

    func isDoubleString(str: String) -> Bool {
        if let _: Double = (Double)(str) {
            return true
        }
        return false
    }

}
