//
//  configXmlParse.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/10/07.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class ConfigXmlParser: NSObject, XMLParserDelegate {
    // Simple state machine to capture fields and add completed Person to array
    var personArray: [ConfigData] = []
    enum State { case none, ephepath, centric, sidereal }
    var state: State = .none
    var newConfig: ConfigData? = nil
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        switch elementName {
        case "a" :
            self.newConfig = ConfigData()
            self.state = .none
        case "ephepath":
            self.state = .ephepath
        case "centric":
            self.state = .centric
        case "sidereal":
            self.state = .sidereal
        default:
            self.state = .none
        }
    }
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if let newConfig = self.newConfig, elementName == "a" {
            self.personArray.append(newConfig)
            self.newConfig = nil
        }
        self.state = .none
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        guard let _ = self.newConfig else { return }
        switch self.state {
        case .ephepath:
            self.newConfig!.ephepath = string
        case .centric:
            self.newConfig!.centric = string
        case .sidereal:
            self.newConfig!.sidereal = string
        default:
            break
        }
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
    }
}
