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
    
    var mainchartData: MainChart!
    var udata: UserData = UserData()
    let config: ConfigData = ConfigData()
    var ephepath: String = ""
    
    class func loadFromNib() -> ViewController {
        let storyboard: NSStoryboard = NSStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateController(withIdentifier: "mainview") as! ViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.        
        
        let now = Date()
        let common: CommonData = CommonData()
        var setting: [SettingData?] = []
        let settingParse: SettingParse = SettingParse()
        let documents = NSSearchPathForDirectoriesInDomains(
            .documentDirectory,
            .userDomainMask, true)[0]
//        let fileManager = FileManager.default
        let directoryName = "microcosm"  // 作成するディレクトリ名
        let createPath = documents + "/" + directoryName + "/system"    // 作成するディレクトリ名を含んだフルパス
        let configName: String = "config.mcsm"
        var ephepath: String = ""
        
        let fileManager = FileManager.default
        var isDir : ObjCBool = false
        if fileManager.fileExists(atPath: createPath, isDirectory:&isDir) {
            if isDir.boolValue {
                // configファイル
                let configPath = NSURL(fileURLWithPath: createPath).appendingPathComponent(configName)
                    
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
                        setting.append(settingParse.getSetting(no: i))
                    }
                
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
        let formatter = DateFormatter()
        let now = Date()

        var houseCalc: Int = 0
        if (self.config.houseCalc == "placidus") {
            houseCalc = 0
        }

        let calc: AstroCalc = AstroCalc(path: ephepath)
        let cusps: [Double] = calc.CuspCalc(udata.birth_year, month: udata.birth_month, day: udata.birth_day, hour: udata.birth_hour, min: udata.birth_minute, sec: udata.birth_second, lat: udata.lat, lng: udata.lng, houseKind: houseCalc)
        
        let rect: NSRect = NSMakeRect(200, 20, 400, 400);
        mainchartData = MainChart(frame: rect, configinfo: config, cuspsinfo: cusps)
        self.view.addSubview(mainchartData)
        
        let plist: [PlanetData] = calc.PositionCalc(udata: udata)
        
        sunPositionLabel.stringValue = (String)(NSString(format: "%.3f", plist[0].absolute_position))
        moonPositionLabel.stringValue = (String)(NSString(format: "%.3f", plist[1].absolute_position))
        mercuryPositionLabel.stringValue = (String)(NSString(format: "%.3f", plist[2].absolute_position))
        venusPositionLabel.stringValue = (String)(NSString(format: "%.3f", plist[3].absolute_position))
        marsPositionLabel.stringValue = (String)(NSString(format: "%.3f", plist[4].absolute_position))
        jupiterPositionLabel.stringValue = (String)(NSString(format: "%.3f", plist[5].absolute_position))
        saturnPositionLabel.stringValue = (String)(NSString(format: "%.3f", plist[6].absolute_position))
        uranusPositionLabel.stringValue = (String)(NSString(format: "%.3f", plist[7].absolute_position))
        neptunePositionLabel.stringValue = (String)(NSString(format: "%.3f", plist[8].absolute_position))
        plutoPositionLabel.stringValue = (String)(NSString(format: "%.3f", plist[9].absolute_position))
        
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        
        userNameLbl.stringValue = udata.name
        userBirthStrLbl.stringValue = formatter.string(from: now)
        userBirthPlaceLbl.stringValue = "神奈川県川崎市高津区"
        userLatLbl.stringValue = ""
        userLngLbl.stringValue = ""
        
        
        for i in 0..<10 {
            mainchartData.setPlanetPosition(i, degree: plist[i].absolute_position, startDegree: cusps[1])
        }
        
        mainchartData.zodiacRender(cusps[1])
        //        let a = 0
        
    }

    func ReRender() {
        mainchartData.removeFromSuperview()
        var houseCalc: Int = 0
        if (self.config.houseCalc == "placidus") {
            houseCalc = 0
        }

        let now = Date()

        let config: ConfigData = ConfigData()
        let calc: AstroCalc = AstroCalc(path: "")

        let cusps: [Double] = calc.CuspCalc(udata.birth_year, month: udata.birth_month, day: udata.birth_day, hour: udata.birth_hour, min: udata.birth_minute, sec: udata.birth_second, lat: udata.lat, lng: udata.lng, houseKind: houseCalc)
        firstCuspLabel.stringValue = (String)(NSString(format: "%.3f", cusps[1]))
        secondCuspLabel.stringValue = (String)(NSString(format: "%.3f", cusps[2]))
        thirdCuspLabel.stringValue = (String)(NSString(format: "%.3f", cusps[3]))
        fourthCuspLabel.stringValue = (String)(NSString(format: "%.3f", cusps[4]))
        
        let rect: NSRect = NSMakeRect(250, 20, 400, 400);

        mainchartData = MainChart(frame: rect, configinfo: config, cuspsinfo: cusps)
        self.view.addSubview(mainchartData)
        let plist: [PlanetData] = calc.PositionCalc(udata: udata)

        for i in 0..<10 {
            mainchartData.setPlanetPosition(i, degree: plist[i].absolute_position, startDegree: cusps[1])
        }
        
        mainchartData.zodiacRender(cusps[1])

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

