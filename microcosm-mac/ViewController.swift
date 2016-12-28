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
    // natal
    var udata: UserData = UserData()
    // transit
    var edata: UserData = UserData()
    var setting: [SettingData?] = []
    var tmpSetting: TempSetting = TempSetting()
    var config: ConfigData = ConfigData()
    var ephepath: String = ""
    var plist: [PlanetData] = []
    var cusps: [Double] = []
    let aspect: AspectCalc = AspectCalc()
    let common: CommonData = CommonData()
    
    class func loadFromNib() -> ViewController {
        let storyboard: NSStoryboard = NSStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateController(withIdentifier: "mainview") as! ViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.        
        
        let now = Date()
        let settingParse: SettingXmlParser = SettingXmlParser()
        let documents = NSSearchPathForDirectoriesInDomains(
            .documentDirectory,
            .userDomainMask, true)[0]
//        let fileManager = FileManager.default
        let directoryName = "microcosm"  // 作成するディレクトリ名
        let fileManager = FileManager.default
        var isDir : ObjCBool = false
        if (!fileManager.fileExists(atPath: documents + "/" + directoryName, isDirectory:&isDir)) {
            do {
                try FileManager.default.createDirectory(atPath: documents + "/" + directoryName, withIntermediateDirectories: true, attributes: nil)
            } catch {
                // Faild to wite folder
                let alert:NSAlert = NSAlert();
                alert.messageText = "エラー";
                alert.informativeText = documents + "/" + directoryName + "の作成に失敗しました。";
                alert.runModal();
                return
            }
        }

        let createPath = documents + "/" + directoryName + "/system"
        if (!fileManager.fileExists(atPath: createPath, isDirectory:&isDir)) {
            do {
                try FileManager.default.createDirectory(atPath: createPath, withIntermediateDirectories: true, attributes: nil)
            } catch {
                // Faild to wite folder
                let alert:NSAlert = NSAlert();
                alert.messageText = "エラー";
                alert.informativeText = createPath + "の作成に失敗しました。";
                alert.runModal();
                return
            }
        }
        let dataPath = documents + "/" + directoryName + "/data"
        if (!fileManager.fileExists(atPath: dataPath, isDirectory:&isDir)) {
            do {
                try FileManager.default.createDirectory(atPath: dataPath, withIntermediateDirectories: true, attributes: nil)
            } catch {
                // Faild to wite folder
                let alert:NSAlert = NSAlert();
                alert.messageText = "エラー";
                alert.informativeText = dataPath + "の作成に失敗しました。";
                alert.runModal();
                return
            }
        }

        let configName: String = "config.csm"
        
        if fileManager.fileExists(atPath: createPath, isDirectory:&isDir) {
            if isDir.boolValue {
                // configファイル
                let configPath = NSURL(fileURLWithPath: createPath).appendingPathComponent(configName)
                if (!fileManager.fileExists(atPath: (createPath + "/" + configName), isDirectory: &isDir)) {
                    let parser: ConfigXmlParser = ConfigXmlParser()
                    
                    let str: NSString = parser.NewConfig()
                    FileManager.default.createFile(atPath: (createPath + "/" + configName), contents: str.data(using: String.Encoding.utf8.rawValue))
                }
                    
                do {
                    let text2 = try NSString(contentsOf: configPath!, encoding: String.Encoding.utf8.rawValue)
                    let configParser = ConfigXmlParser()
                    config = configParser.XmlToConfig(text2)
                    
                    // settingファイル
                    for i in 0..<10 {
                        self.setting.append(settingParse.FileToSetting(i))
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
        edata.birth_year = year
        edata.birth_month = month
        edata.birth_day = day
        edata.birth_hour = hour
        edata.birth_minute = minute
        edata.birth_second = (Double)(second)
        edata.lat = config.lat
        edata.lng = config.lng
        edata.birth_place = "東京都"
        
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

        self.plist = calc.PositionCalc(udata: udata, config: config)
        
        self.plist = aspect.AspectCalcSame(a_setting: setting[0]!, list: plist)

        //        let a = 0
        
    }

    func ReRender() {
        if (mainchartData != nil) {
            mainchartData.removeFromSuperview()
        }

        sunPositionLabel.stringValue = common.getSignText(self.plist[0].absolute_position) + (String)(NSString(format: "%.3f", self.plist[0].absolute_position.truncatingRemainder(dividingBy: 30)))
        moonPositionLabel.stringValue = common.getSignText(self.plist[1].absolute_position) + (String)(NSString(format: "%.3f", self.plist[1].absolute_position.truncatingRemainder(dividingBy: 30)))
        mercuryPositionLabel.stringValue = common.getSignText(self.plist[2].absolute_position) + (String)(NSString(format: "%.3f", self.plist[2].absolute_position.truncatingRemainder(dividingBy: 30)))
        venusPositionLabel.stringValue = common.getSignText(self.plist[3].absolute_position) + (String)(NSString(format: "%.3f", self.plist[3].absolute_position.truncatingRemainder(dividingBy: 30)))
        marsPositionLabel.stringValue = common.getSignText(self.plist[4].absolute_position) + (String)(NSString(format: "%.3f", self.plist[4].absolute_position.truncatingRemainder(dividingBy: 30)))
        jupiterPositionLabel.stringValue = common.getSignText(self.plist[5].absolute_position) + (String)(NSString(format: "%.3f", self.plist[5].absolute_position.truncatingRemainder(dividingBy: 30)))
        saturnPositionLabel.stringValue = common.getSignText(self.plist[6].absolute_position) + (String)(NSString(format: "%.3f", self.plist[6].absolute_position.truncatingRemainder(dividingBy: 30)))
        uranusPositionLabel.stringValue = common.getSignText(self.plist[7].absolute_position) + (String)(NSString(format: "%.3f", self.plist[7].absolute_position.truncatingRemainder(dividingBy: 30)))
        neptunePositionLabel.stringValue = common.getSignText(self.plist[8].absolute_position) + (String)(NSString(format: "%.3f", self.plist[8].absolute_position.truncatingRemainder(dividingBy: 30)))
        plutoPositionLabel.stringValue = common.getSignText(self.plist[9].absolute_position) + (String)(NSString(format: "%.3f", self.plist[9].absolute_position.truncatingRemainder(dividingBy: 30)))
        
        
        firstCuspLabel.stringValue = common.getSignText(self.cusps[0]) +  (String)(NSString(format: "%.3f", self.cusps[1].truncatingRemainder(dividingBy: 30)))
        secondCuspLabel.stringValue = common.getSignText(self.cusps[1]) +  (String)(NSString(format: "%.3f", self.cusps[2].truncatingRemainder(dividingBy: 30)))
        thirdCuspLabel.stringValue = common.getSignText(self.cusps[2]) +  (String)(NSString(format: "%.3f", self.cusps[3].truncatingRemainder(dividingBy: 30)))
        fourthCuspLabel.stringValue = common.getSignText(self.cusps[3]) +  (String)(NSString(format: "%.3f", self.cusps[4].truncatingRemainder(dividingBy: 30)))
        fifthCuspLabel.stringValue = common.getSignText(self.cusps[4]) +  (String)(NSString(format: "%.3f", self.cusps[5].truncatingRemainder(dividingBy: 30)))
        sixthCuspLabel.stringValue = common.getSignText(self.cusps[5]) +  (String)(NSString(format: "%.3f", self.cusps[6].truncatingRemainder(dividingBy: 30)))
        seventhCuspLabel.stringValue = common.getSignText(self.cusps[6]) +  (String)(NSString(format: "%.3f", self.cusps[7].truncatingRemainder(dividingBy: 30)))
        eighthCuspLabel.stringValue = common.getSignText(self.cusps[7]) +  (String)(NSString(format: "%.3f", self.cusps[8].truncatingRemainder(dividingBy: 30)))
        ninthCuspLabel.stringValue = common.getSignText(self.cusps[8]) +  (String)(NSString(format: "%.3f", self.cusps[9].truncatingRemainder(dividingBy: 30)))
        tenthCuspLabel.stringValue = common.getSignText(self.cusps[9]) +  (String)(NSString(format: "%.3f", self.cusps[10].truncatingRemainder(dividingBy: 30)))
        eleventhCuspLabel.stringValue = common.getSignText(self.cusps[10]) +  (String)(NSString(format: "%.3f", self.cusps[11].truncatingRemainder(dividingBy: 30)))
        twelvethCuspLabel.stringValue = common.getSignText(self.cusps[11]) +  (String)(NSString(format: "%.3f", self.cusps[12].truncatingRemainder(dividingBy: 30)))
        
        // ユーザーボックス
        userNameLbl.stringValue = udata.name
        userBirthStrLbl.stringValue = String(format: "%04d", udata.birth_year) + "/" + String(format: "%02d", udata.birth_month) +
            "/" + String(format: "%02d", udata.birth_day) + " " +
            String(format: "%02d", udata.birth_hour) + ":" + String(format: "%02d", udata.birth_minute) +
            ":" + String(format: "%02d", udata.birth_second)
        userBirthPlaceLbl.stringValue = udata.birth_place
        userLatLbl.stringValue = ""
        userLngLbl.stringValue = ""
        
        
        // メインチャート表示
        let rect2: NSRect = NSMakeRect(330, 35, 400, 400);
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
    
    func setUserData(_ userdata: UserData) {
        udata = userdata
        ClearView()
        ReCalc()
        ReRender()
    }
    
    func updateUserData(udata: UserData, fileName: String) {
        setUserData(udata)

        let datafileManager = FileManager.default
        let documents = NSSearchPathForDirectoriesInDomains(
            .documentDirectory,
            .userDomainMask, true)[0]
        let directoryName = "microcosm"  // 作成するディレクトリ名
        let createPath = documents + "/" + directoryName + "/data"
        var isDir : ObjCBool = false

        if (!datafileManager.fileExists(atPath: (createPath + "/" + fileName), isDirectory: &isDir)) {
            var str: String = "name:" + (String)(udata.name) + "\n"
            str += "furigana:" + (String)(udata.furigana) + "\n"
            str += "birth_year:" + (String)(udata.birth_year) + "\n"
            str += "birth_month:" + (String)(udata.birth_month) + "\n"
            str += "birth_day:" + (String)(udata.birth_day) + "\n"
            str += "birth_hour:" + (String)(udata.birth_hour) + "\n"
            str += "birth_minute:" + (String)(udata.birth_minute) + "\n"
            str += "birth_second:" + (String)(udata.birth_second) + "\n"
            str += "lat:" + (String)(udata.lat) + "\n"
            str += "lng:" + (String)(udata.lng) + "\n"
            str += "birth_place:" + udata.birth_place + "\n"
            str += "memo:" + udata.memo + "\n"
            str += "timezone:JST(日本標準)" + "\n"
            
            FileManager.default.createFile(atPath: (createPath + "/" + fileName), contents: str.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue)))
        }

    }
    
    @IBAction func xmlTest(_ sender: AnyObject) {
        let parser: UserXmlParser = UserXmlParser()
        let util: FileUtil = FileUtil()
        let document: String = util.getDocumentDir()
        var nstxt: NSString?
        do {
            nstxt = try NSString(contentsOf: URL(string:document + "/microcosm/test.csm")!, encoding: String.Encoding.utf8.rawValue)
        } catch {
            
        }
        let udata: UserData = parser.XmlToUser(nstxt!)
        parser.UserToXml(udata)
    }
}

