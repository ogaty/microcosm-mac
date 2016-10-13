//
//  ViewController.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/07/09.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    let swed: SweData = SweData()
    @IBOutlet weak var chart: MainChart!
    
    @IBOutlet weak var userNameLbl: NSTextField!
    @IBOutlet weak var userBirthStrLbl: NSTextField!
    @IBOutlet weak var userBirthPlaceLbl: NSTextField!
    @IBOutlet weak var userLatLbl: NSTextField!
    @IBOutlet weak var userLngLbl: NSTextField!
    @IBOutlet weak var sunLabel: NSTextField!
    @IBOutlet weak var sunPositionLabel: NSTextField!
    @IBOutlet weak var moonPositionLabel: NSTextField!
    @IBOutlet weak var mercuryPositionLabel: NSTextField!
    @IBOutlet weak var venusPositionLabel: NSTextField!
    @IBOutlet weak var marsPositionLabel: NSTextField!
    @IBOutlet weak var jupiterPositionLabel: NSTextField!
    @IBOutlet weak var saturnPositionLabel: NSTextField!
    @IBOutlet weak var uranusPositionLabel: NSTextField!
    @IBOutlet weak var neptunePositionLabel: NSTextField!
    @IBOutlet weak var plutoPositionLabel: NSTextField!
    @IBOutlet weak var firstCuspLabel: NSTextField!
    @IBOutlet weak var secondCuspLabel: NSTextField!
    @IBOutlet weak var thirdCuspLabel: NSTextField!
    @IBOutlet weak var fourthCuspLabel: NSTextField!
    @IBOutlet weak var fifthCuspLabel: NSTextField!
    @IBOutlet weak var sixthCuspLabel: NSTextField!
    @IBOutlet weak var seventhCuspLabel: NSTextField!
    @IBOutlet weak var eighthCuspLabel: NSTextField!
    @IBOutlet weak var ninthCuspLabel: NSTextField!
    @IBOutlet weak var tenthCuspLabel: NSTextField!
    @IBOutlet weak var eleventhCuspLabel: NSTextField!
    @IBOutlet weak var twelvethCuspLabel: NSTextField!
    
    var mainchartData: MainChart!
    var udata: UserData = UserData()
    var setting: [SettingData?] = []
    var tmpSetting: TempSetting = TempSetting()
    let config: ConfigData = ConfigData()
    var ephepath: String = ""
    var plist: [PlanetData] = []
    var cusps: [Double] = []
    let aspect: AspectCalc = AspectCalc()
    
    class func loadFromNib() -> ViewController {
        let storyboard: NSStoryboard = NSStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateController(withIdentifier: "mainview") as! ViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.        
        
        let now = Date()
        let common: CommonData = CommonData()
        let settingParse: SettingParse = SettingParse()
        let documents = NSSearchPathForDirectoriesInDomains(
            .documentDirectory,
            .userDomainMask, true)[0]
//        let fileManager = FileManager.default
        let directoryName = "microcosm"  // 作成するディレクトリ名
        let createPath = documents + "/" + directoryName + "/system"    // 作成するディレクトリ名を含んだフルパス
        let configName: String = "config.mcsm"
        
        let fileManager = FileManager.default
        var isDir : ObjCBool = false
        if fileManager.fileExists(atPath: createPath, isDirectory:&isDir) {
            if isDir.boolValue {
                // configファイル
                let configPath = NSURL(fileURLWithPath: createPath).appendingPathComponent(configName)
                if (!fileManager.fileExists(atPath: (createPath + "/" + configName), isDirectory: &isDir)) {
                    let str: NSString = "ephepath:ephe\ncentric:GEO_CENTRIC\nsidereal:TROPICAL\ndefaultPlace:東京都中央区\nlat:35.670587\nlng:139.772003\ndefaultTimezone:JST\nprogression:PRIMARY\ndefaultbands:1\nhouse:PLACIDUS\nzodiacOuterWidth:340\nzodiacWidth:60\nzodiacCenter:90\ndecimalDisp:DECIMAL\ndispPattern:0"
                    FileManager.default.createFile(atPath: (createPath + "/" + configName), contents: str.data(using: String.Encoding.utf8.rawValue))
                }
                    
                do {
                    let text2 = try NSString(contentsOf: configPath!, encoding: String.Encoding.utf8.rawValue)
                    text2.enumerateLines{
                        line, stop in
                        var arr = line.components(separatedBy: ":")
                        switch(arr[0]) {
                        case "ephepath":
                            self.ephepath = arr[1]
                            break
                        case "centric":
                            self.config.centric = arr[1]
                            break
                        case "sidereal":
                            self.config.sidereal = arr[1]
                            break
                        case "defaultPlace":
                            self.config.defaultPlace = arr[1]
                            break
                        case "lat":
                            self.config.lat = (Double)(arr[1])!
                            break
                        case "lng":
                            self.config.lng = (Double)(arr[1])!
                            break
                        case "defaultTimezone":
                            self.config.defaultTimezone = arr[1]
                            break
                        case "progression":
                            self.config.progression = arr[1]
                            break
                        case "defaultbands":
                            self.config.defaultBands = (Int)(arr[1])!
                            break
                        case "house":
                            self.config.houseCalc = arr[1]
                            break
                        case "zodiacOuterWidth":
                            self.config.zodiacOuterWidth = (Int)(arr[1])!
                            break
                        case "zodiacWidth":
                            self.config.zodiacWidth = (Int)(arr[1])!
                            break
                        case "zodiacCenter":
                            self.config.zodiacCenter = (Int)(arr[1])!
                            break
                        case "decimalDisp":
                            self.config.decimalDisp = arr[1]
                            break
                        case "dispPattern":
                            self.config.dispPattern = (Int)(arr[1])!
                            break

                        default:
                            break
                        }
                    }
                    
                    //                    let data = text2.data(using: String.Encoding.utf8.rawValue)

//                    let xmlParser = XMLParser(data: data!)
//                    xmlParser.delegate = configXmlParse()
//                    xmlParser.parse()

//                    NSLog((String)(text2))

                    // settingファイル
                    for i in 0..<10 {
                        self.setting.append(settingParse.getSetting(no: i))
                    }
                    tmpSetting.zodiacCenter = Double(config.zodiacCenter)
                
                }
                catch {/* error handling here */
                    let alert:NSAlert = NSAlert();
                    alert.messageText = "エラー";
                    alert.informativeText = "ファイルの読み込みに失敗しました。";
                    alert.runModal();
                    return
                }
            } else {
                // file exists and is not a directory
                let alert:NSAlert = NSAlert();
                alert.messageText = "エラー";
                alert.informativeText = "ファイルの読み込みに失敗しました。";
                alert.runModal();
                return
            }
        } else {
            do {
                try FileManager.default.createDirectory(atPath: createPath, withIntermediateDirectories: true, attributes: nil)
            } catch {
                // Faild to wite folder
                let alert:NSAlert = NSAlert();
                alert.messageText = "エラー";
                alert.informativeText = "ファイルの読み込みに失敗しました。";
                alert.runModal();
                return
            }
        }

        let cal = NSCalendar.current
        let year = cal.component(.year, from: now)
        let month = cal.component(.month, from: now)
        let day = cal.component(.day, from: now)
        let hour = cal.component(.hour, from: now)
        let minute = cal.component(.minute, from: now)
        let second = cal.component(.second, from: now)
        udata.birth_year = year
        udata.birth_month = month
        udata.birth_day = day
        udata.birth_hour = hour
        udata.birth_minute = minute
        udata.birth_second = (Double)(second)
        udata.lat = config.lat
        udata.lng = config.lng
        udata.birth_place = "東京都"
        
        ReCalc()
        ReRender()
    }
    
    func ReCalc() {

        var houseCalc: Int = 0
        if (self.config.houseCalc == "placidus") {
            houseCalc = 0
        }

        let calc: AstroCalc = AstroCalc(path: ephepath)
        self.cusps = calc.CuspCalc(udata.birth_year, month: udata.birth_month, day: udata.birth_day, hour: udata.birth_hour, min: udata.birth_minute, sec: udata.birth_second, lat: udata.lat, lng: udata.lng, houseKind: houseCalc)

        self.plist = calc.PositionCalc(udata: udata)
        
        self.plist = aspect.AspectCalcSame(a_setting: setting[0]!, list: plist)

        //        let a = 0
        
    }

    func ReRender() {
        if (mainchartData != nil) {
            mainchartData.removeFromSuperview()
        }
        var houseCalc: Int = 0
        if (self.config.houseCalc == "placidus") {
            houseCalc = 0
        }

        let config: ConfigData = ConfigData()

        sunPositionLabel.stringValue = (String)(NSString(format: "%.3f", self.plist[0].absolute_position))
        moonPositionLabel.stringValue = (String)(NSString(format: "%.3f", self.plist[1].absolute_position))
        mercuryPositionLabel.stringValue = (String)(NSString(format: "%.3f", self.plist[2].absolute_position))
        venusPositionLabel.stringValue = (String)(NSString(format: "%.3f", self.plist[3].absolute_position))
        marsPositionLabel.stringValue = (String)(NSString(format: "%.3f", self.plist[4].absolute_position))
        jupiterPositionLabel.stringValue = (String)(NSString(format: "%.3f", self.plist[5].absolute_position))
        saturnPositionLabel.stringValue = (String)(NSString(format: "%.3f", self.plist[6].absolute_position))
        uranusPositionLabel.stringValue = (String)(NSString(format: "%.3f", self.plist[7].absolute_position))
        neptunePositionLabel.stringValue = (String)(NSString(format: "%.3f", self.plist[8].absolute_position))
        plutoPositionLabel.stringValue = (String)(NSString(format: "%.3f", self.plist[9].absolute_position))
        
        
        firstCuspLabel.stringValue = (String)(NSString(format: "%.3f", self.cusps[1]))
        secondCuspLabel.stringValue = (String)(NSString(format: "%.3f", self.cusps[2]))
        thirdCuspLabel.stringValue = (String)(NSString(format: "%.3f", self.cusps[3]))
        fourthCuspLabel.stringValue = (String)(NSString(format: "%.3f", self.cusps[4]))
        fifthCuspLabel.stringValue = (String)(NSString(format: "%.3f", self.cusps[5]))
        sixthCuspLabel.stringValue = (String)(NSString(format: "%.3f", self.cusps[6]))
        seventhCuspLabel.stringValue = (String)(NSString(format: "%.3f", self.cusps[7]))
        eighthCuspLabel.stringValue = (String)(NSString(format: "%.3f", self.cusps[8]))
        ninthCuspLabel.stringValue = (String)(NSString(format: "%.3f", self.cusps[8]))
        tenthCuspLabel.stringValue = (String)(NSString(format: "%.3f", self.cusps[9]))
        eleventhCuspLabel.stringValue = (String)(NSString(format: "%.3f", self.cusps[10]))
        twelvethCuspLabel.stringValue = (String)(NSString(format: "%.3f", self.cusps[11]))
        
        // ユーザーボックス
        userNameLbl.stringValue = udata.name
        userBirthStrLbl.stringValue = String(format: "%04d", udata.birth_year) + "/" + String(format: "%02d", udata.birth_month) +
            "/" + String(format: "%02d", udata.birth_day) + " " +
            String(format: "%02d", udata.birth_hour) + ":" + String(format: "%02d", udata.birth_minute) +
            ":" + String(format: "%02d", udata.birth_second)
        userBirthPlaceLbl.stringValue = udata.birth_place
        userLatLbl.stringValue = ""
        userLngLbl.stringValue = ""
        
        
        let rect2: NSRect = NSMakeRect(250, 20, 400, 400);

        mainchartData = MainChart(frame: rect2, configinfo: config, cuspsinfo: cusps, planetList: plist, tempSetting: tmpSetting)
        self.view.addSubview(mainchartData)

        // 円周上の点
        mainchartData.zodiacRender(cusps[1])

        // planetRender
        for i in 0..<10 {
            mainchartData.setPlanetPosition(i, degree: plist[i].absolute_position, startDegree: cusps[1])
        }
        
    }

    func ClearView() {
        mainchartData.removeFromSuperview()
    }
    
    func setUserData(userdata: UserData) {
        udata = userdata
        ClearView()
        ReCalc()
        ReRender()
    }
}

