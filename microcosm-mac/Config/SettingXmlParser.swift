//
//  SettingXmlParser.swift
//  microcosm-mac
//
//  Created by Yuji Ogata on 2016/11/13.
//  Copyright © 2016年 Yuji Ogata. All rights reserved.
//

import Cocoa

class SettingXmlParser: NSObject {
    let xmlhead: String = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    let xmltop: String = "<SettingXml xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\">"
    let xmlend: String = "</SettingXml>"

    let dispnameStart: String = "  <dispname>"
    let dispnameEnd: String = "</dispname>"
    let orbSunSoft1st0Start: String = "  <orb_sun_soft_1st_0>"
    let orbSunSoft1st0End: String = "</orb_sun_soft_1st_0>"
    let orbSunSoft1st1Start: String = "  <orb_sun_soft_1st_1>"
    let orbSunSoft1st1End: String = "</orb_sun_soft_1st_1>"
    let orbSunSoft1st2Start: String = "  <orb_sun_soft_1st_2>"
    let orbSunSoft1st2End: String = "</orb_sun_soft_1st_2>"
    let orbSunSoft1st3Start: String = "  <orb_sun_soft_1st_3>"
    let orbSunSoft1st3End: String = "</orb_sun_soft_1st_3>"
    let orbSunSoft1st4Start: String = "  <orb_sun_soft_1st_4>"
    let orbSunSoft1st4End: String = "</orb_sun_soft_1st_4>"
    let orbSunSoft1st5Start: String = "  <orb_sun_soft_1st_5>"
    let orbSunSoft1st5End: String = "</orb_sun_soft_1st_5>"
    let orbSunHard1st0Start: String = "  <orb_sun_hard_1st_0>"
    let orbSunHard1st0End: String = "</orb_sun_hard_1st_0>"
    let orbSunHard1st1Start: String = "  <orb_sun_hard_1st_1>"
    let orbSunHard1st1End: String = "</orb_sun_hard_1st_1>"
    let orbSunHard1st2Start: String = "  <orb_sun_hard_1st_2>"
    let orbSunHard1st2End: String = "</orb_sun_hard_1st_2>"
    let orbSunHard1st3Start: String = "  <orb_sun_hard_1st_3>"
    let orbSunHard1st3End: String = "</orb_sun_hard_1st_3>"
    let orbSunHard1st4Start: String = "  <orb_sun_hard_1st_4>"
    let orbSunHard1st4End: String = "</orb_sun_hard_1st_4>"
    let orbSunHard1st5Start: String = "  <orb_sun_hard_1st_5>"
    let orbSunHard1st5End: String = "</orb_sun_hard_1st_5>"
    let orbMoonSoft1st0Start: String = "  <orb_moon_soft_1st_0>"
    let orbMoonSoft1st0End: String = "</orb_moon_soft_1st_0>"
    let orbMoonSoft1st1Start: String = "  <orb_moon_soft_1st_1>"
    let orbMoonSoft1st1End: String = "</orb_moon_soft_1st_1>"
    let orbMoonSoft1st2Start: String = "  <orb_moon_soft_1st_2>"
    let orbMoonSoft1st2End: String = "</orb_moon_soft_1st_2>"
    let orbMoonSoft1st3Start: String = "  <orb_moon_soft_1st_3>"
    let orbMoonSoft1st3End: String = "</orb_moon_soft_1st_3>"
    let orbMoonSoft1st4Start: String = "  <orb_moon_soft_1st_4>"
    let orbMoonSoft1st4End: String = "</orb_moon_soft_1st_4>"
    let orbMoonSoft1st5Start: String = "  <orb_moon_soft_1st_5>"
    let orbMoonSoft1st5End: String = "</orb_moon_soft_1st_5>"
    let orbMoonHard1st0Start: String = "  <orb_moon_hard_1st_0>"
    let orbMoonHard1st0End: String = "</orb_moon_hard_1st_0>"
    let orbMoonHard1st1Start: String = "  <orb_moon_hard_1st_1>"
    let orbMoonHard1st1End: String = "</orb_moon_hard_1st_1>"
    let orbMoonHard1st2Start: String = "  <orb_moon_hard_1st_2>"
    let orbMoonHard1st2End: String = "</orb_moon_hard_1st_2>"
    let orbMoonHard1st3Start: String = "  <orb_moon_hard_1st_3>"
    let orbMoonHard1st3End: String = "</orb_moon_hard_1st_3>"
    let orbMoonHard1st4Start: String = "  <orb_moon_hard_1st_4>"
    let orbMoonHard1st4End: String = "</orb_moon_hard_1st_4>"
    let orbMoonHard1st5Start: String = "  <orb_moon_hard_1st_5>"
    let orbMoonHard1st5End: String = "</orb_moon_hard_1st_5>"
    let orbOtherSoft1st0Start: String = "  <orb_other_soft_1st_0>"
    let orbOtherSoft1st0End: String = "</orb_other_soft_1st_0>"
    let orbOtherSoft1st1Start: String = "  <orb_other_soft_1st_1>"
    let orbOtherSoft1st1End: String = "</orb_other_soft_1st_1>"
    let orbOtherSoft1st2Start: String = "  <orb_other_soft_1st_2>"
    let orbOtherSoft1st2End: String = "</orb_other_soft_1st_2>"
    let orbOtherSoft1st3Start: String = "  <orb_other_soft_1st_3>"
    let orbOtherSoft1st3End: String = "</orb_other_soft_1st_3>"
    let orbOtherSoft1st4Start: String = "  <orb_other_soft_1st_4>"
    let orbOtherSoft1st4End: String = "</orb_other_soft_1st_4>"
    let orbOtherSoft1st5Start: String = "  <orb_other_soft_1st_5>"
    let orbOtherSoft1st5End: String = "</orb_other_soft_1st_5>"
    let orbOtherHard1st0Start: String = "  <orb_other_hard_1st_0>"
    let orbOtherHard1st0End: String = "</orb_other_hard_1st_0>"
    let orbOtherHard1st1Start: String = "  <orb_other_hard_1st_1>"
    let orbOtherHard1st1End: String = "</orb_other_hard_1st_1>"
    let orbOtherHard1st2Start: String = "  <orb_other_hard_1st_2>"
    let orbOtherHard1st2End: String = "</orb_other_hard_1st_2>"
    let orbOtherHard1st3Start: String = "  <orb_other_hard_1st_3>"
    let orbOtherHard1st3End: String = "</orb_other_hard_1st_3>"
    let orbOtherHard1st4Start: String = "  <orb_other_hard_1st_4>"
    let orbOtherHard1st4End: String = "</orb_other_hard_1st_4>"
    let orbOtherHard1st5Start: String = "  <orb_other_hard_1st_5>"
    let orbOtherHard1st5End: String = "</orb_other_hard_1st_5>"
    let orbSunSoft2nd0Start: String = "  <orb_sun_soft_2nd_0>"
    let orbSunSoft2nd0End: String = "</orb_sun_soft_2nd_0>"
    let orbSunSoft2nd1Start: String = "  <orb_sun_soft_2nd_1>"
    let orbSunSoft2nd1End: String = "</orb_sun_soft_2nd_1>"
    let orbSunSoft2nd2Start: String = "  <orb_sun_soft_2nd_2>"
    let orbSunSoft2nd2End: String = "</orb_sun_soft_2nd_2>"
    let orbSunSoft2nd3Start: String = "  <orb_sun_soft_2nd_3>"
    let orbSunSoft2nd3End: String = "</orb_sun_soft_2nd_3>"
    let orbSunSoft2nd4Start: String = "  <orb_sun_soft_2nd_4>"
    let orbSunSoft2nd4End: String = "</orb_sun_soft_2nd_4>"
    let orbSunSoft2nd5Start: String = "  <orb_sun_soft_2nd_5>"
    let orbSunSoft2nd5End: String = "</orb_sun_soft_2nd_5>"
    let orbSunHard2nd0Start: String = "  <orb_sun_hard_2nd_0>"
    let orbSunHard2nd0End: String = "</orb_sun_hard_2nd_0>"
    let orbSunHard2nd1Start: String = "  <orb_sun_hard_2nd_1>"
    let orbSunHard2nd1End: String = "</orb_sun_hard_2nd_1>"
    let orbSunHard2nd2Start: String = "  <orb_sun_hard_2nd_2>"
    let orbSunHard2nd2End: String = "</orb_sun_hard_2nd_2>"
    let orbSunHard2nd3Start: String = "  <orb_sun_hard_2nd_3>"
    let orbSunHard2nd3End: String = "</orb_sun_hard_2nd_3>"
    let orbSunHard2nd4Start: String = "  <orb_sun_hard_2nd_4>"
    let orbSunHard2nd4End: String = "</orb_sun_hard_2nd_4>"
    let orbSunHard2nd5Start: String = "  <orb_sun_hard_2nd_5>"
    let orbSunHard2nd5End: String = "</orb_sun_hard_2nd_5>"
    let orbMoonSoft2nd0Start: String = "  <orb_moon_soft_2nd_0>"
    let orbMoonSoft2nd0End: String = "</orb_moon_soft_2nd_0>"
    let orbMoonSoft2nd1Start: String = "  <orb_moon_soft_2nd_1>"
    let orbMoonSoft2nd1End: String = "</orb_moon_soft_2nd_1>"
    let orbMoonSoft2nd2Start: String = "  <orb_moon_soft_2nd_2>"
    let orbMoonSoft2nd2End: String = "</orb_moon_soft_2nd_2>"
    let orbMoonSoft2nd3Start: String = "  <orb_moon_soft_2nd_3>"
    let orbMoonSoft2nd3End: String = "</orb_moon_soft_2nd_3>"
    let orbMoonSoft2nd4Start: String = "  <orb_moon_soft_2nd_4>"
    let orbMoonSoft2nd4End: String = "</orb_moon_soft_2nd_4>"
    let orbMoonSoft2nd5Start: String = "  <orb_moon_soft_2nd_5>"
    let orbMoonSoft2nd5End: String = "</orb_moon_soft_2nd_5>"
    let orbMoonHard2nd0Start: String = "  <orb_moon_hard_2nd_0>"
    let orbMoonHard2nd0End: String = "</orb_moon_hard_2nd_0>"
    let orbMoonHard2nd1Start: String = "  <orb_moon_hard_2nd_1>"
    let orbMoonHard2nd1End: String = "</orb_moon_hard_2nd_1>"
    let orbMoonHard2nd2Start: String = "  <orb_moon_hard_2nd_2>"
    let orbMoonHard2nd2End: String = "</orb_moon_hard_2nd_2>"
    let orbMoonHard2nd3Start: String = "  <orb_moon_hard_2nd_3>"
    let orbMoonHard2nd3End: String = "</orb_moon_hard_2nd_3>"
    let orbMoonHard2nd4Start: String = "  <orb_moon_hard_2nd_4>"
    let orbMoonHard2nd4End: String = "</orb_moon_hard_2nd_4>"
    let orbMoonHard2nd5Start: String = "  <orb_moon_hard_2nd_5>"
    let orbMoonHard2nd5End: String = "</orb_moon_hard_2nd_5>"
    let orbOtherSoft2nd0Start: String = "  <orb_other_soft_2nd_0>"
    let orbOtherSoft2nd0End: String = "</orb_other_soft_2nd_0>"
    let orbOtherSoft2nd1Start: String = "  <orb_other_soft_2nd_1>"
    let orbOtherSoft2nd1End: String = "</orb_other_soft_2nd_1>"
    let orbOtherSoft2nd2Start: String = "  <orb_other_soft_2nd_2>"
    let orbOtherSoft2nd2End: String = "</orb_other_soft_2nd_2>"
    let orbOtherSoft2nd3Start: String = "  <orb_other_soft_2nd_3>"
    let orbOtherSoft2nd3End: String = "</orb_other_soft_2nd_3>"
    let orbOtherSoft2nd4Start: String = "  <orb_other_soft_2nd_4>"
    let orbOtherSoft2nd4End: String = "</orb_other_soft_2nd_4>"
    let orbOtherSoft2nd5Start: String = "  <orb_other_soft_2nd_5>"
    let orbOtherSoft2nd5End: String = "</orb_other_soft_2nd_5>"
    let orbOtherHard2nd0Start: String = "  <orb_other_hard_2nd_0>"
    let orbOtherHard2nd0End: String = "</orb_other_hard_2nd_0>"
    let orbOtherHard2nd1Start: String = "  <orb_other_hard_2nd_1>"
    let orbOtherHard2nd1End: String = "</orb_other_hard_2nd_1>"
    let orbOtherHard2nd2Start: String = "  <orb_other_hard_2nd_2>"
    let orbOtherHard2nd2End: String = "</orb_other_hard_2nd_2>"
    let orbOtherHard2nd3Start: String = "  <orb_other_hard_2nd_3>"
    let orbOtherHard2nd3End: String = "</orb_other_hard_2nd_3>"
    let orbOtherHard2nd4Start: String = "  <orb_other_hard_2nd_4>"
    let orbOtherHard2nd4End: String = "</orb_other_hard_2nd_4>"
    let orbOtherHard2nd5Start: String = "  <orb_other_hard_2nd_5>"
    let orbOtherHard2nd5End: String = "</orb_other_hard_2nd_5>"
    let orbSunSoft1500Start: String = "  <orb_sun_soft_150_0>"
    let orbSunSoft1500End: String = "</orb_sun_soft_150_0>"
    let orbSunSoft1501Start: String = "  <orb_sun_soft_150_1>"
    let orbSunSoft1501End: String = "</orb_sun_soft_150_1>"
    let orbSunSoft1502Start: String = "  <orb_sun_soft_150_2>"
    let orbSunSoft1502End: String = "</orb_sun_soft_150_2>"
    let orbSunSoft1503Start: String = "  <orb_sun_soft_150_3>"
    let orbSunSoft1503End: String = "</orb_sun_soft_150_3>"
    let orbSunSoft1504Start: String = "  <orb_sun_soft_150_4>"
    let orbSunSoft1504End: String = "</orb_sun_soft_150_4>"
    let orbSunSoft1505Start: String = "  <orb_sun_soft_150_5>"
    let orbSunSoft1505End: String = "</orb_sun_soft_150_5>"
    let orbSunHard1500Start: String = "  <orb_sun_hard_150_0>"
    let orbSunHard1500End: String = "</orb_sun_hard_150_0>"
    let orbSunHard1501Start: String = "  <orb_sun_hard_150_1>"
    let orbSunHard1501End: String = "</orb_sun_hard_150_1>"
    let orbSunHard1502Start: String = "  <orb_sun_hard_150_2>"
    let orbSunHard1502End: String = "</orb_sun_hard_150_2>"
    let orbSunHard1503Start: String = "  <orb_sun_hard_150_3>"
    let orbSunHard1503End: String = "</orb_sun_hard_150_3>"
    let orbSunHard1504Start: String = "  <orb_sun_hard_150_4>"
    let orbSunHard1504End: String = "</orb_sun_hard_150_4>"
    let orbSunHard1505Start: String = "  <orb_sun_hard_150_5>"
    let orbSunHard1505End: String = "</orb_sun_hard_150_5>"
    let orbMoonSoft1500Start: String = "  <orb_moon_soft_150_0>"
    let orbMoonSoft1500End: String = "</orb_moon_soft_150_0>"
    let orbMoonSoft1501Start: String = "  <orb_moon_soft_150_1>"
    let orbMoonSoft1501End: String = "</orb_moon_soft_150_1>"
    let orbMoonSoft1502Start: String = "  <orb_moon_soft_150_2>"
    let orbMoonSoft1502End: String = "</orb_moon_soft_150_2>"
    let orbMoonSoft1503Start: String = "  <orb_moon_soft_150_3>"
    let orbMoonSoft1503End: String = "</orb_moon_soft_150_3>"
    let orbMoonSoft1504Start: String = "  <orb_moon_soft_150_4>"
    let orbMoonSoft1504End: String = "</orb_moon_soft_150_4>"
    let orbMoonSoft1505Start: String = "  <orb_moon_soft_150_5>"
    let orbMoonSoft1505End: String = "</orb_moon_soft_150_5>"
    let orbMoonHard1500Start: String = "  <orb_moon_hard_150_0>"
    let orbMoonHard1500End: String = "</orb_moon_hard_150_0>"
    let orbMoonHard1501Start: String = "  <orb_moon_hard_150_1>"
    let orbMoonHard1501End: String = "</orb_moon_hard_150_1>"
    let orbMoonHard1502Start: String = "  <orb_moon_hard_150_2>"
    let orbMoonHard1502End: String = "</orb_moon_hard_150_2>"
    let orbMoonHard1503Start: String = "  <orb_moon_hard_150_3>"
    let orbMoonHard1503End: String = "</orb_moon_hard_150_3>"
    let orbMoonHard1504Start: String = "  <orb_moon_hard_150_4>"
    let orbMoonHard1504End: String = "</orb_moon_hard_150_4>"
    let orbMoonHard1505Start: String = "  <orb_moon_hard_150_5>"
    let orbMoonHard1505End: String = "</orb_moon_hard_150_5>"
    let orbOtherSoft1500Start: String = "  <orb_other_soft_150_0>"
    let orbOtherSoft1500End: String = "</orb_other_soft_150_0>"
    let orbOtherSoft1501Start: String = "  <orb_other_soft_150_1>"
    let orbOtherSoft1501End: String = "</orb_other_soft_150_1>"
    let orbOtherSoft1502Start: String = "  <orb_other_soft_150_2>"
    let orbOtherSoft1502End: String = "</orb_other_soft_150_2>"
    let orbOtherSoft1503Start: String = "  <orb_other_soft_150_3>"
    let orbOtherSoft1503End: String = "</orb_other_soft_150_3>"
    let orbOtherSoft1504Start: String = "  <orb_other_soft_150_4>"
    let orbOtherSoft1504End: String = "</orb_other_soft_150_4>"
    let orbOtherSoft1505Start: String = "  <orb_other_soft_150_5>"
    let orbOtherSoft1505End: String = "</orb_other_soft_150_5>"
    let orbOtherHard1500Start: String = "  <orb_other_hard_150_0>"
    let orbOtherHard1500End: String = "</orb_other_hard_150_0>"
    let orbOtherHard1501Start: String = "  <orb_other_hard_150_1>"
    let orbOtherHard1501End: String = "</orb_other_hard_150_1>"
    let orbOtherHard1502Start: String = "  <orb_other_hard_150_2>"
    let orbOtherHard1502End: String = "</orb_other_hard_150_2>"
    let orbOtherHard1503Start: String = "  <orb_other_hard_150_3>"
    let orbOtherHard1503End: String = "</orb_other_hard_150_3>"
    let orbOtherHard1504Start: String = "  <orb_other_hard_150_4>"
    let orbOtherHard1504End: String = "</orb_other_hard_150_4>"
    let orbOtherHard1505Start: String = "  <orb_other_hard_150_5>"
    let orbOtherHard1505End: String = "</orb_other_hard_150_5>"
    let dispcircle0Start: String = "  <dispcircle>"
    let dispcircle0End: String = "</dispcircle>"
    let dispcircle1Start: String = "  <dispcircle>"
    let dispcircle1End: String = "</dispcircle>"
    let dispcircle2Start: String = "  <dispcircle>"
    let dispcircle2End: String = "</dispcircle>"
    let dispcircle3Start: String = "  <dispcircle>"
    let dispcircle3End: String = "</dispcircle>"
    let dispcircle4Start: String = "  <dispcircle>"
    let dispcircle4End: String = "</dispcircle>"
    let dispcircle5Start: String = "  <dispcircle>"
    let dispcircle5End: String = "</dispcircle>"
    let dispplanetSun11Start: String = "  <dispPlanetSun11>"
    let dispplanetSun11End: String = "</dispPlanetSun11>"
    let dispplanetMoon11Start: String = "  <dispPlanetMoon11>"
    let dispplanetMoon11End: String = "</dispPlanetMoon11>"
    let dispplanetMercury11Start: String = "  <dispPlanetMercury11>"
    let dispplanetMercury11End: String = "</dispPlanetMercury11>"
    let dispplanetVenus11Start: String = "  <dispPlanetVenus11>"
    let dispplanetVenus11End: String = "</dispPlanetVenus11>"
    let dispplanetMars11Start: String = "  <dispPlanetMars11>"
    let dispplanetMars11End: String = "</dispPlanetMars11>"
    let dispplanetJupiter11Start: String = "  <dispPlanetJupiter11>"
    let dispplanetJupiter11End: String = "</dispPlanetJupiter11>"
    let dispplanetSaturn11Start: String = "  <dispPlanetSaturn11>"
    let dispplanetSaturn11End: String = "</dispPlanetSaturn11>"
    let dispplanetUranus11Start: String = "  <dispPlanetUranus11>"
    let dispplanetUranus11End: String = "</dispPlanetUranus11>"
    let dispplanetNeptune11Start: String = "  <dispPlanetNeptune11>"
    let dispplanetNeptune11End: String = "</dispPlanetNeptune11>"
    let dispplanetPluto11Start: String = "  <dispPlanetPluto11>"
    let dispplanetPluto11End: String = "</dispPlanetPluto11>"
    let dispplanetDh11Start: String = "  <dispPlanetDh11>"
    let dispplanetDh11End: String = "</dispPlanetDh11>"
    let dispplanetChiron11Start: String = "  <dispPlanetChiron11>"
    let dispplanetChiron11End: String = "</dispPlanetChiron11>"
    let dispplanetAsc11Start: String = "  <dispPlanetAsc11>"
    let dispplanetAsc11End: String = "</dispPlanetAsc11>"
    let dispplanetMc11Start: String = "  <dispPlanetMc11>"
    let dispplanetMc11End: String = "</dispPlanetMc11>"
    let dispplanetEarth11Start: String = "  <dispPlanetEarth11>"
    let dispplanetEarth11End: String = "</dispPlanetEarth11>"
    let dispplanetLilith11Start: String = "  <dispPlanetLilith11>"
    let dispplanetLilith11End: String = "</dispPlanetLilith11>"
    let dispplanetSun22Start: String = "  <dispPlanetSun22>"
    let dispplanetSun22End: String = "</dispPlanetSun22>"
    let dispplanetMoon22Start: String = "  <dispPlanetMoon22>"
    let dispplanetMoon22End: String = "</dispPlanetMoon22>"
    let dispplanetMercury22Start: String = "  <dispPlanetMercury22>"
    let dispplanetMercury22End: String = "</dispPlanetMercury22>"
    let dispplanetVenus22Start: String = "  <dispPlanetVenus22>"
    let dispplanetVenus22End: String = "</dispPlanetVenus22>"
    let dispplanetMars22Start: String = "  <dispPlanetMars22>"
    let dispplanetMars22End: String = "</dispPlanetMars22>"
    let dispplanetJupiter22Start: String = "  <dispPlanetJupiter22>"
    let dispplanetJupiter22End: String = "</dispPlanetJupiter22>"
    let dispplanetSaturn22Start: String = "  <dispPlanetSaturn22>"
    let dispplanetSaturn22End: String = "</dispPlanetSaturn22>"
    let dispplanetUranus22Start: String = "  <dispPlanetUranus22>"
    let dispplanetUranus22End: String = "</dispPlanetUranus22>"
    let dispplanetNeptune22Start: String = "  <dispPlanetNeptune22>"
    let dispplanetNeptune22End: String = "</dispPlanetNeptune22>"
    let dispplanetPluto22Start: String = "  <dispPlanetPluto22>"
    let dispplanetPluto22End: String = "</dispPlanetPluto22>"
    let dispplanetDh22Start: String = "  <dispPlanetDh22>"
    let dispplanetDh22End: String = "</dispPlanetDh22>"
    let dispplanetChiron22Start: String = "  <dispPlanetChiron22>"
    let dispplanetChiron22End: String = "</dispPlanetChiron22>"
    let dispplanetAsc22Start: String = "  <dispPlanetAsc22>"
    let dispplanetAsc22End: String = "</dispPlanetAsc22>"
    let dispplanetMc22Start: String = "  <dispPlanetMc22>"
    let dispplanetMc22End: String = "</dispPlanetMc22>"
    let dispplanetEarth22Start: String = "  <dispPlanetEarth22>"
    let dispplanetEarth22End: String = "</dispPlanetEarth22>"
    let dispplanetLilith22Start: String = "  <dispPlanetLilith22>"
    let dispplanetLilith22End: String = "</dispPlanetLilith22>"
    let dispplanetSun33Start: String = "  <dispPlanetSun33>"
    let dispplanetSun33End: String = "</dispPlanetSun33>"
    let dispplanetMoon33Start: String = "  <dispPlanetMoon33>"
    let dispplanetMoon33End: String = "</dispPlanetMoon33>"
    let dispplanetMercury33Start: String = "  <dispPlanetMercury33>"
    let dispplanetMercury33End: String = "</dispPlanetMercury33>"
    let dispplanetVenus33Start: String = "  <dispPlanetVenus33>"
    let dispplanetVenus33End: String = "</dispPlanetVenus33>"
    let dispplanetMars33Start: String = "  <dispPlanetMars33>"
    let dispplanetMars33End: String = "</dispPlanetMars33>"
    let dispplanetJupiter33Start: String = "  <dispPlanetJupiter33>"
    let dispplanetJupiter33End: String = "</dispPlanetJupiter33>"
    let dispplanetSaturn33Start: String = "  <dispPlanetSaturn33>"
    let dispplanetSaturn33End: String = "</dispPlanetSaturn33>"
    let dispplanetUranus33Start: String = "  <dispPlanetUranus33>"
    let dispplanetUranus33End: String = "</dispPlanetUranus33>"
    let dispplanetNeptune33Start: String = "  <dispPlanetNeptune33>"
    let dispplanetNeptune33End: String = "</dispPlanetNeptune33>"
    let dispplanetPluto33Start: String = "  <dispPlanetPluto33>"
    let dispplanetPluto33End: String = "</dispPlanetPluto33>"
    let dispplanetDh33Start: String = "  <dispPlanetDh33>"
    let dispplanetDh33End: String = "</dispPlanetDh33>"
    let dispplanetChiron33Start: String = "  <dispPlanetChiron33>"
    let dispplanetChiron33End: String = "</dispPlanetChiron33>"
    let dispplanetAsc33Start: String = "  <dispPlanetAsc33>"
    let dispplanetAsc33End: String = "</dispPlanetAsc33>"
    let dispplanetMc33Start: String = "  <dispPlanetMc33>"
    let dispplanetMc33End: String = "</dispPlanetMc33>"
    let dispplanetEarth33Start: String = "  <dispPlanetEarth33>"
    let dispplanetEarth33End: String = "</dispPlanetEarth33>"
    let dispplanetLilith33Start: String = "  <dispPlanetLilith33>"
    let dispplanetLilith33End: String = "</dispPlanetLilith33>"
    let dispplanetSun12Start: String = "  <dispPlanetSun12>"
    let dispplanetSun12End: String = "</dispPlanetSun12>"
    let dispplanetMoon12Start: String = "  <dispPlanetMoon12>"
    let dispplanetMoon12End: String = "</dispPlanetMoon12>"
    let dispplanetMercury12Start: String = "  <dispPlanetMercury12>"
    let dispplanetMercury12End: String = "</dispPlanetMercury12>"
    let dispplanetVenus12Start: String = "  <dispPlanetVenus12>"
    let dispplanetVenus12End: String = "</dispPlanetVenus12>"
    let dispplanetMars12Start: String = "  <dispPlanetMars12>"
    let dispplanetMars12End: String = "</dispPlanetMars12>"
    let dispplanetJupiter12Start: String = "  <dispPlanetJupiter12>"
    let dispplanetJupiter12End: String = "</dispPlanetJupiter12>"
    let dispplanetSaturn12Start: String = "  <dispPlanetSaturn12>"
    let dispplanetSaturn12End: String = "</dispPlanetSaturn12>"
    let dispplanetUranus12Start: String = "  <dispPlanetUranus12>"
    let dispplanetUranus12End: String = "</dispPlanetUranus12>"
    let dispplanetNeptune12Start: String = "  <dispPlanetNeptune12>"
    let dispplanetNeptune12End: String = "</dispPlanetNeptune12>"
    let dispplanetPluto12Start: String = "  <dispPlanetPluto12>"
    let dispplanetPluto12End: String = "</dispPlanetPluto12>"
    let dispplanetDh12Start: String = "  <dispPlanetDh12>"
    let dispplanetDh12End: String = "</dispPlanetDh12>"
    let dispplanetChiron12Start: String = "  <dispPlanetChiron12>"
    let dispplanetChiron12End: String = "</dispPlanetChiron12>"
    let dispplanetAsc12Start: String = "  <dispPlanetAsc12>"
    let dispplanetAsc12End: String = "</dispPlanetAsc12>"
    let dispplanetMc12Start: String = "  <dispPlanetMc12>"
    let dispplanetMc12End: String = "</dispPlanetMc12>"
    let dispplanetEarth12Start: String = "  <dispPlanetEarth12>"
    let dispplanetEarth12End: String = "</dispPlanetEarth12>"
    let dispplanetLilith12Start: String = "  <dispPlanetLilith12>"
    let dispplanetLilith12End: String = "</dispPlanetLilith12>"
    let dispplanetSun13Start: String = "  <dispPlanetSun13>"
    let dispplanetSun13End: String = "</dispPlanetSun13>"
    let dispplanetMoon13Start: String = "  <dispPlanetMoon13>"
    let dispplanetMoon13End: String = "</dispPlanetMoon13>"
    let dispplanetMercury13Start: String = "  <dispPlanetMercury13>"
    let dispplanetMercury13End: String = "</dispPlanetMercury13>"
    let dispplanetVenus13Start: String = "  <dispPlanetVenus13>"
    let dispplanetVenus13End: String = "</dispPlanetVenus13>"
    let dispplanetMars13Start: String = "  <dispPlanetMars13>"
    let dispplanetMars13End: String = "</dispPlanetMars13>"
    let dispplanetJupiter13Start: String = "  <dispPlanetJupiter13>"
    let dispplanetJupiter13End: String = "</dispPlanetJupiter13>"
    let dispplanetSaturn13Start: String = "  <dispPlanetSaturn13>"
    let dispplanetSaturn13End: String = "</dispPlanetSaturn13>"
    let dispplanetUranus13Start: String = "  <dispPlanetUranus13>"
    let dispplanetUranus13End: String = "</dispPlanetUranus13>"
    let dispplanetNeptune13Start: String = "  <dispPlanetNeptune13>"
    let dispplanetNeptune13End: String = "</dispPlanetNeptune13>"
    let dispplanetPluto13Start: String = "  <dispPlanetPluto13>"
    let dispplanetPluto13End: String = "</dispPlanetPluto13>"
    let dispplanetDh13Start: String = "  <dispPlanetDh13>"
    let dispplanetDh13End: String = "</dispPlanetDh13>"
    let dispplanetChiron13Start: String = "  <dispPlanetChiron13>"
    let dispplanetChiron13End: String = "</dispPlanetChiron13>"
    let dispplanetAsc13Start: String = "  <dispPlanetAsc13>"
    let dispplanetAsc13End: String = "</dispPlanetAsc13>"
    let dispplanetMc13Start: String = "  <dispPlanetMc13>"
    let dispplanetMc13End: String = "</dispPlanetMc13>"
    let dispplanetEarth13Start: String = "  <dispPlanetEarth13>"
    let dispplanetEarth13End: String = "</dispPlanetEarth13>"
    let dispplanetLilith13Start: String = "  <dispPlanetLilith13>"
    let dispplanetLilith13End: String = "</dispPlanetLilith13>"
    let dispplanetSun23Start: String = "  <dispPlanetSun23>"
    let dispplanetSun23End: String = "</dispPlanetSun23>"
    let dispplanetMoon23Start: String = "  <dispPlanetMoon23>"
    let dispplanetMoon23End: String = "</dispPlanetMoon23>"
    let dispplanetMercury23Start: String = "  <dispPlanetMercury23>"
    let dispplanetMercury23End: String = "</dispPlanetMercury23>"
    let dispplanetVenus23Start: String = "  <dispPlanetVenus23>"
    let dispplanetVenus23End: String = "</dispPlanetVenus23>"
    let dispplanetMars23Start: String = "  <dispPlanetMars23>"
    let dispplanetMars23End: String = "</dispPlanetMars23>"
    let dispplanetJupiter23Start: String = "  <dispPlanetJupiter23>"
    let dispplanetJupiter23End: String = "</dispPlanetJupiter23>"
    let dispplanetSaturn23Start: String = "  <dispPlanetSaturn23>"
    let dispplanetSaturn23End: String = "</dispPlanetSaturn23>"
    let dispplanetUranus23Start: String = "  <dispPlanetUranus23>"
    let dispplanetUranus23End: String = "</dispPlanetUranus23>"
    let dispplanetNeptune23Start: String = "  <dispPlanetNeptune23>"
    let dispplanetNeptune23End: String = "</dispPlanetNeptune23>"
    let dispplanetPluto23Start: String = "  <dispPlanetPluto23>"
    let dispplanetPluto23End: String = "</dispPlanetPluto23>"
    let dispplanetDh23Start: String = "  <dispPlanetDh23>"
    let dispplanetDh23End: String = "</dispPlanetDh23>"
    let dispplanetChiron23Start: String = "  <dispPlanetChiron23>"
    let dispplanetChiron23End: String = "</dispPlanetChiron23>"
    let dispplanetAsc23Start: String = "  <dispPlanetAsc23>"
    let dispplanetAsc23End: String = "</dispPlanetAsc23>"
    let dispplanetMc23Start: String = "  <dispPlanetMc23>"
    let dispplanetMc23End: String = "</dispPlanetMc23>"
    let dispplanetEarth23Start: String = "  <dispPlanetEarth23>"
    let dispplanetEarth23End: String = "</dispPlanetEarth23>"
    let dispplanetLilith23Start: String = "  <dispPlanetLilith23>"
    let dispplanetLilith23End: String = "</dispPlanetLilith23>"
    let dispaspect0Start: String = "  <dispAspect>"
    let dispaspect0End: String = "</dispAspect>"
    let dispaspect1Start: String = "  <dispAspect>"
    let dispaspect1End: String = "</dispAspect>"
    let dispaspect2Start: String = "  <dispAspect>"
    let dispaspect2End: String = "</dispAspect>"
    let dispaspect3Start: String = "  <dispAspect>"
    let dispaspect3End: String = "</dispAspect>"
    let dispaspect4Start: String = "  <dispAspect>"
    let dispaspect4End: String = "</dispAspect>"
    let dispaspect5Start: String = "  <dispAspect>"
    let dispaspect5End: String = "</dispAspect>"
    let aspectSun11Start: String = "  <aspectSun11>"
    let aspectSun11End: String = "</aspectSun11>"
    let aspectMoon11Start: String = "  <aspectMoon11>"
    let aspectMoon11End: String = "</aspectMoon11>"
    let aspectMercury11Start: String = "  <aspectMercury11>"
    let aspectMercury11End: String = "</aspectMercury11>"
    let aspectVenus11Start: String = "  <aspectVenus11>"
    let aspectVenus11End: String = "</aspectVenus11>"
    let aspectMars11Start: String = "  <aspectMars11>"
    let aspectMars11End: String = "</aspectMars11>"
    let aspectJupiter11Start: String = "  <aspectJupiter11>"
    let aspectJupiter11End: String = "</aspectJupiter11>"
    let aspectSaturn11Start: String = "  <aspectSaturn11>"
    let aspectSaturn11End: String = "</aspectSaturn11>"
    let aspectUranus11Start: String = "  <aspectUranus11>"
    let aspectUranus11End: String = "</aspectUranus11>"
    let aspectNeptune11Start: String = "  <aspectNeptune11>"
    let aspectNeptune11End: String = "</aspectNeptune11>"
    let aspectPluto11Start: String = "  <aspectPluto11>"
    let aspectPluto11End: String = "</aspectPluto11>"
    let aspectDh11Start: String = "  <aspectDh11>"
    let aspectDh11End: String = "</aspectDh11>"
    let aspectChiron11Start: String = "  <aspectChiron11>"
    let aspectChiron11End: String = "</aspectChiron11>"
    let aspectAsc11Start: String = "  <aspectAsc11>"
    let aspectAsc11End: String = "</aspectAsc11>"
    let aspectMc11Start: String = "  <aspectMc11>"
    let aspectMc11End: String = "</aspectMc11>"
    let aspectEarth11Start: String = "  <aspectEarth11>"
    let aspectEarth11End: String = "</aspectEarth11>"
    let aspectLilith11Start: String = "  <aspectLilith11>"
    let aspectLilith11End: String = "</aspectLilith11>"
    let aspectSun22Start: String = "  <aspectSun22>"
    let aspectSun22End: String = "</aspectSun22>"
    let aspectMoon22Start: String = "  <aspectMoon22>"
    let aspectMoon22End: String = "</aspectMoon22>"
    let aspectMercury22Start: String = "  <aspectMercury22>"
    let aspectMercury22End: String = "</aspectMercury22>"
    let aspectVenus22Start: String = "  <aspectVenus22>"
    let aspectVenus22End: String = "</aspectVenus22>"
    let aspectMars22Start: String = "  <aspectMars22>"
    let aspectMars22End: String = "</aspectMars22>"
    let aspectJupiter22Start: String = "  <aspectJupiter22>"
    let aspectJupiter22End: String = "</aspectJupiter22>"
    let aspectSaturn22Start: String = "  <aspectSaturn22>"
    let aspectSaturn22End: String = "</aspectSaturn22>"
    let aspectUranus22Start: String = "  <aspectUranus22>"
    let aspectUranus22End: String = "</aspectUranus22>"
    let aspectNeptune22Start: String = "  <aspectNeptune22>"
    let aspectNeptune22End: String = "</aspectNeptune22>"
    let aspectPluto22Start: String = "  <aspectPluto22>"
    let aspectPluto22End: String = "</aspectPluto22>"
    let aspectDh22Start: String = "  <aspectDh22>"
    let aspectDh22End: String = "</aspectDh22>"
    let aspectChiron22Start: String = "  <aspectChiron22>"
    let aspectChiron22End: String = "</aspectChiron22>"
    let aspectAsc22Start: String = "  <aspectAsc22>"
    let aspectAsc22End: String = "</aspectAsc22>"
    let aspectMc22Start: String = "  <aspectMc22>"
    let aspectMc22End: String = "</aspectMc22>"
    let aspectEarth22Start: String = "  <aspectEarth22>"
    let aspectEarth22End: String = "</aspectEarth22>"
    let aspectLilith22Start: String = "  <aspectLilith22>"
    let aspectLilith22End: String = "</aspectLilith22>"
    let aspectSun33Start: String = "  <aspectSun33>"
    let aspectSun33End: String = "</aspectSun33>"
    let aspectMoon33Start: String = "  <aspectMoon33>"
    let aspectMoon33End: String = "</aspectMoon33>"
    let aspectMercury33Start: String = "  <aspectMercury33>"
    let aspectMercury33End: String = "</aspectMercury33>"
    let aspectVenus33Start: String = "  <aspectVenus33>"
    let aspectVenus33End: String = "</aspectVenus33>"
    let aspectMars33Start: String = "  <aspectMars33>"
    let aspectMars33End: String = "</aspectMars33>"
    let aspectJupiter33Start: String = "  <aspectJupiter33>"
    let aspectJupiter33End: String = "</aspectJupiter33>"
    let aspectSaturn33Start: String = "  <aspectSaturn33>"
    let aspectSaturn33End: String = "</aspectSaturn33>"
    let aspectUranus33Start: String = "  <aspectUranus33>"
    let aspectUranus33End: String = "</aspectUranus33>"
    let aspectNeptune33Start: String = "  <aspectNeptune33>"
    let aspectNeptune33End: String = "</aspectNeptune33>"
    let aspectPluto33Start: String = "  <aspectPluto33>"
    let aspectPluto33End: String = "</aspectPluto33>"
    let aspectDh33Start: String = "  <aspectDh33>"
    let aspectDh33End: String = "</aspectDh33>"
    let aspectChiron33Start: String = "  <aspectChiron33>"
    let aspectChiron33End: String = "</aspectChiron33>"
    let aspectAsc33Start: String = "  <aspectAsc33>"
    let aspectAsc33End: String = "</aspectAsc33>"
    let aspectMc33Start: String = "  <aspectMc33>"
    let aspectMc33End: String = "</aspectMc33>"
    let aspectEarth33Start: String = "  <aspectEarth33>"
    let aspectEarth33End: String = "</aspectEarth33>"
    let aspectLilith33Start: String = "  <aspectLilith33>"
    let aspectLilith33End: String = "</aspectLilith33>"
    let aspectSun12Start: String = "  <aspectSun12>"
    let aspectSun12End: String = "</aspectSun12>"
    let aspectMoon12Start: String = "  <aspectMoon12>"
    let aspectMoon12End: String = "</aspectMoon12>"
    let aspectMercury12Start: String = "  <aspectMercury12>"
    let aspectMercury12End: String = "</aspectMercury12>"
    let aspectVenus12Start: String = "  <aspectVenus12>"
    let aspectVenus12End: String = "</aspectVenus12>"
    let aspectMars12Start: String = "  <aspectMars12>"
    let aspectMars12End: String = "</aspectMars12>"
    let aspectJupiter12Start: String = "  <aspectJupiter12>"
    let aspectJupiter12End: String = "</aspectJupiter12>"
    let aspectSaturn12Start: String = "  <aspectSaturn12>"
    let aspectSaturn12End: String = "</aspectSaturn12>"
    let aspectUranus12Start: String = "  <aspectUranus12>"
    let aspectUranus12End: String = "</aspectUranus12>"
    let aspectNeptune12Start: String = "  <aspectNeptune12>"
    let aspectNeptune12End: String = "</aspectNeptune12>"
    let aspectPluto12Start: String = "  <aspectPluto12>"
    let aspectPluto12End: String = "</aspectPluto12>"
    let aspectDh12Start: String = "  <aspectDh12>"
    let aspectDh12End: String = "</aspectDh12>"
    let aspectChiron12Start: String = "  <aspectChiron12>"
    let aspectChiron12End: String = "</aspectChiron12>"
    let aspectAsc12Start: String = "  <aspectAsc12>"
    let aspectAsc12End: String = "</aspectAsc12>"
    let aspectMc12Start: String = "  <aspectMc12>"
    let aspectMc12End: String = "</aspectMc12>"
    let aspectEarth12Start: String = "  <aspectEarth12>"
    let aspectEarth12End: String = "</aspectEarth12>"
    let aspectLilith12Start: String = "  <aspectLilith12>"
    let aspectLilith12End: String = "</aspectLilith12>"
    let aspectSun13Start: String = "  <aspectSun13>"
    let aspectSun13End: String = "</aspectSun13>"
    let aspectMoon13Start: String = "  <aspectMoon13>"
    let aspectMoon13End: String = "</aspectMoon13>"
    let aspectMercury13Start: String = "  <aspectMercury13>"
    let aspectMercury13End: String = "</aspectMercury13>"
    let aspectVenus13Start: String = "  <aspectVenus13>"
    let aspectVenus13End: String = "</aspectVenus13>"
    let aspectMars13Start: String = "  <aspectMars13>"
    let aspectMars13End: String = "</aspectMars13>"
    let aspectJupiter13Start: String = "  <aspectJupiter13>"
    let aspectJupiter13End: String = "</aspectJupiter13>"
    let aspectSaturn13Start: String = "  <aspectSaturn13>"
    let aspectSaturn13End: String = "</aspectSaturn13>"
    let aspectUranus13Start: String = "  <aspectUranus13>"
    let aspectUranus13End: String = "</aspectUranus13>"
    let aspectNeptune13Start: String = "  <aspectNeptune13>"
    let aspectNeptune13End: String = "</aspectNeptune13>"
    let aspectPluto13Start: String = "  <aspectPluto13>"
    let aspectPluto13End: String = "</aspectPluto13>"
    let aspectDh13Start: String = "  <aspectDh13>"
    let aspectDh13End: String = "</aspectDh13>"
    let aspectChiron13Start: String = "  <aspectChiron13>"
    let aspectChiron13End: String = "</aspectChiron13>"
    let aspectAsc13Start: String = "  <aspectAsc13>"
    let aspectAsc13End: String = "</aspectAsc13>"
    let aspectMc13Start: String = "  <aspectMc13>"
    let aspectMc13End: String = "</aspectMc13>"
    let aspectEarth13Start: String = "  <aspectEarth13>"
    let aspectEarth13End: String = "</aspectEarth13>"
    let aspectLilith13Start: String = "  <aspectLilith13>"
    let aspectLilith13End: String = "</aspectLilith13>"
    let aspectSun23Start: String = "  <aspectSun23>"
    let aspectSun23End: String = "</aspectSun23>"
    let aspectMoon23Start: String = "  <aspectMoon23>"
    let aspectMoon23End: String = "</aspectMoon23>"
    let aspectMercury23Start: String = "  <aspectMercury23>"
    let aspectMercury23End: String = "</aspectMercury23>"
    let aspectVenus23Start: String = "  <aspectVenus23>"
    let aspectVenus23End: String = "</aspectVenus23>"
    let aspectMars23Start: String = "  <aspectMars23>"
    let aspectMars23End: String = "</aspectMars23>"
    let aspectJupiter23Start: String = "  <aspectJupiter23>"
    let aspectJupiter23End: String = "</aspectJupiter23>"
    let aspectSaturn23Start: String = "  <aspectSaturn23>"
    let aspectSaturn23End: String = "</aspectSaturn23>"
    let aspectUranus23Start: String = "  <aspectUranus23>"
    let aspectUranus23End: String = "</aspectUranus23>"
    let aspectNeptune23Start: String = "  <aspectNeptune23>"
    let aspectNeptune23End: String = "</aspectNeptune23>"
    let aspectPluto23Start: String = "  <aspectPluto23>"
    let aspectPluto23End: String = "</aspectPluto23>"
    let aspectDh23Start: String = "  <aspectDh23>"
    let aspectDh23End: String = "</aspectDh23>"
    let aspectChiron23Start: String = "  <aspectChiron23>"
    let aspectChiron23End: String = "</aspectChiron23>"
    let aspectAsc23Start: String = "  <aspectAsc23>"
    let aspectAsc23End: String = "</aspectAsc23>"
    let aspectMc23Start: String = "  <aspectMc23>"
    let aspectMc23End: String = "</aspectMc23>"
    let aspectEarth23Start: String = "  <aspectEarth23>"
    let aspectEarth23End: String = "</aspectEarth23>"
    let aspectLilith23Start: String = "  <aspectLilith23>"
    let aspectLilith23End: String = "</aspectLilith23>"
    let aspectConjunction11Start: String = "  <aspectConjunction11>"
    let aspectConjunction11End: String = "</aspectConjunction11>"
    let aspectOpposition11Start: String = "  <aspectOpposition11>"
    let aspectOpposition11End: String = "</aspectOpposition11>"
    let aspectTrine11Start: String = "  <aspectTrine11>"
    let aspectTrine11End: String = "</aspectTrine11>"
    let aspectSquare11Start: String = "  <aspectSquare11>"
    let aspectSquare11End: String = "</aspectSquare11>"
    let aspectSextile11Start: String = "  <aspectSextile11>"
    let aspectSextile11End: String = "</aspectSextile11>"
    let aspectInconjunct11Start: String = "  <aspectInconjunct11>"
    let aspectInconjunct11End: String = "</aspectInconjunct11>"
    let aspectSesquiquadrate11Start: String = "  <aspectSesquiquadrate11>"
    let aspectSesquiquadrate11End: String = "</aspectSesquiquadrate11>"
    let aspectConjunction22Start: String = "  <aspectConjunction22>"
    let aspectConjunction22End: String = "</aspectConjunction22>"
    let aspectOpposition22Start: String = "  <aspectOpposition22>"
    let aspectOpposition22End: String = "</aspectOpposition22>"
    let aspectTrine22Start: String = "  <aspectTrine22>"
    let aspectTrine22End: String = "</aspectTrine22>"
    let aspectSquare22Start: String = "  <aspectSquare22>"
    let aspectSquare22End: String = "</aspectSquare22>"
    let aspectSextile22Start: String = "  <aspectSextile22>"
    let aspectSextile22End: String = "</aspectSextile22>"
    let aspectInconjunct22Start: String = "  <aspectInconjunct22>"
    let aspectInconjunct22End: String = "</aspectInconjunct22>"
    let aspectSesquiquadrate22Start: String = "  <aspectSesquiquadrate22>"
    let aspectSesquiquadrate22End: String = "</aspectSesquiquadrate22>"
    let aspectConjunction33Start: String = "  <aspectConjunction33>"
    let aspectConjunction33End: String = "</aspectConjunction33>"
    let aspectOpposition33Start: String = "  <aspectOpposition33>"
    let aspectOpposition33End: String = "</aspectOpposition33>"
    let aspectTrine33Start: String = "  <aspectTrine33>"
    let aspectTrine33End: String = "</aspectTrine33>"
    let aspectSquare33Start: String = "  <aspectSquare33>"
    let aspectSquare33End: String = "</aspectSquare33>"
    let aspectSextile33Start: String = "  <aspectSextile33>"
    let aspectSextile33End: String = "</aspectSextile33>"
    let aspectInconjunct33Start: String = "  <aspectInconjunct33>"
    let aspectInconjunct33End: String = "</aspectInconjunct33>"
    let aspectSesquiquadrate33Start: String = "  <aspectSesquiquadrate33>"
    let aspectSesquiquadrate33End: String = "</aspectSesquiquadrate33>"
    let aspectConjunction12Start: String = "  <aspectConjunction12>"
    let aspectConjunction12End: String = "</aspectConjunction12>"
    let aspectOpposition12Start: String = "  <aspectOpposition12>"
    let aspectOpposition12End: String = "</aspectOpposition12>"
    let aspectTrine12Start: String = "  <aspectTrine12>"
    let aspectTrine12End: String = "</aspectTrine12>"
    let aspectSquare12Start: String = "  <aspectSquare12>"
    let aspectSquare12End: String = "</aspectSquare12>"
    let aspectSextile12Start: String = "  <aspectSextile12>"
    let aspectSextile12End: String = "</aspectSextile12>"
    let aspectInconjunct12Start: String = "  <aspectInconjunct12>"
    let aspectInconjunct12End: String = "</aspectInconjunct12>"
    let aspectSesquiquadrate12Start: String = "  <aspectSesquiquadrate12>"
    let aspectSesquiquadrate12End: String = "</aspectSesquiquadrate12>"
    let aspectConjunction13Start: String = "  <aspectConjunction13>"
    let aspectConjunction13End: String = "</aspectConjunction13>"
    let aspectOpposition13Start: String = "  <aspectOpposition13>"
    let aspectOpposition13End: String = "</aspectOpposition13>"
    let aspectTrine13Start: String = "  <aspectTrine13>"
    let aspectTrine13End: String = "</aspectTrine13>"
    let aspectSquare13Start: String = "  <aspectSquare13>"
    let aspectSquare13End: String = "</aspectSquare13>"
    let aspectSextile13Start: String = "  <aspectSextile13>"
    let aspectSextile13End: String = "</aspectSextile13>"
    let aspectInconjunct13Start: String = "  <aspectInconjunct13>"
    let aspectInconjunct13End: String = "</aspectInconjunct13>"
    let aspectSesquiquadrate13Start: String = "  <aspectSesquiquadrate13>"
    let aspectSesquiquadrate13End: String = "</aspectSesquiquadrate13>"
    let aspectConjunction23Start: String = "  <aspectConjunction23>"
    let aspectConjunction23End: String = "</aspectConjunction23>"
    let aspectOpposition23Start: String = "  <aspectOpposition23>"
    let aspectOpposition23End: String = "</aspectOpposition23>"
    let aspectTrine23Start: String = "  <aspectTrine23>"
    let aspectTrine23End: String = "</aspectTrine23>"
    let aspectSquare23Start: String = "  <aspectSquare23>"
    let aspectSquare23End: String = "</aspectSquare23>"
    let aspectSextile23Start: String = "  <aspectSextile23>"
    let aspectSextile23End: String = "</aspectSextile23>"
    let aspectInconjunct23Start: String = "  <aspectInconjunct23>"
    let aspectInconjunct23End: String = "</aspectInconjunct23>"
    let aspectSesquiquadrate23Start: String = "  <aspectSesquiquadrate23>"
    let aspectSesquiquadrate23End: String = "</aspectSesquiquadrate23>"


    
    func XmlToSetting(_ xml: NSString, no: Int) -> SettingData {
        let setting: SettingData = SettingData(no)
        // var inUserData: Bool = false
        let common: CommonData = CommonData()
        var dispcircleCnt: Int = 0
        var dispaspectCnt: Int = 0
        
        xml.enumerateLines {
            line, stop in
            var tmpLine : String = ""
            if (line == self.xmlhead) {
                tmpLine = line.replacingOccurrences(of: self.xmlhead, with: "")
            } else if (line.contains(self.xmltop)) {
//                inUserData = true
                tmpLine = line.replacingOccurrences(of: self.xmltop, with: "")
            } else if (line.contains(self.xmlend)) {
//                inUserData = false
                tmpLine = line.replacingOccurrences(of: self.xmlend, with: "")
            } else if (line.contains(self.dispnameStart)) {
                tmpLine = line.replacingOccurrences(of: self.dispnameStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispnameEnd, with: "")
                setting.dispName = tmpLine
            } else if (line.contains(self.orbSunSoft1st0Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunSoft1st0Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunSoft1st0End, with: "")
                let tmpDic: Dictionary<Int, Double> = [common.SUN_SOFT_1ST:(Double)(tmpLine)!]
                setting.orbs.append(tmpDic)
            } else if (line.contains(self.orbSunSoft1st1Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunSoft1st1Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunSoft1st1End, with: "")
                let tmpDic: Dictionary<Int, Double> = [common.SUN_SOFT_1ST:(Double)(tmpLine)!]
                setting.orbs.append(tmpDic)
            } else if (line.contains(self.orbSunSoft1st2Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunSoft1st2Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunSoft1st2End, with: "")
                let tmpDic: Dictionary<Int, Double> = [common.SUN_SOFT_1ST:(Double)(tmpLine)!]
                setting.orbs.append(tmpDic)
            } else if (line.contains(self.orbSunSoft1st3Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunSoft1st3Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunSoft1st3End, with: "")
                let tmpDic: Dictionary<Int, Double> = [common.SUN_SOFT_1ST:(Double)(tmpLine)!]
                setting.orbs.append(tmpDic)
            } else if (line.contains(self.orbSunSoft1st4Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunSoft1st4Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunSoft1st4End, with: "")
                let tmpDic: Dictionary<Int, Double> = [common.SUN_SOFT_1ST:(Double)(tmpLine)!]
                setting.orbs.append(tmpDic)
            } else if (line.contains(self.orbSunSoft1st5Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunSoft1st5Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunSoft1st5End, with: "")
                let tmpDic: Dictionary<Int, Double> = [common.SUN_SOFT_1ST:(Double)(tmpLine)!]
                setting.orbs.append(tmpDic)

            } else if (line.contains(self.orbSunHard1st0Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunHard1st0Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunHard1st0End, with: "")
                setting.orbs[0][common.SUN_HARD_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbSunHard1st1Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunHard1st1Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunHard1st1End, with: "")
                setting.orbs[1][common.SUN_HARD_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbSunHard1st2Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunHard1st2Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunHard1st2End, with: "")
                setting.orbs[2][common.SUN_HARD_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbSunHard1st3Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunHard1st3Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunHard1st3End, with: "")
                setting.orbs[3][common.SUN_HARD_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbSunHard1st4Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunHard1st4Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunHard1st4End, with: "")
                setting.orbs[4][common.SUN_HARD_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbSunHard1st5Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunHard1st5Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunHard1st5End, with: "")
                setting.orbs[5][common.SUN_HARD_1ST] = (Double)(tmpLine)!

            } else if (line.contains(self.orbMoonSoft1st0Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonSoft1st0Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonSoft1st0End, with: "")
                setting.orbs[0][common.MOON_SOFT_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonSoft1st1Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonSoft1st1Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonSoft1st1End, with: "")
                setting.orbs[1][common.MOON_SOFT_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonSoft1st2Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonSoft1st2Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonSoft1st2End, with: "")
                setting.orbs[2][common.MOON_SOFT_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonSoft1st3Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonSoft1st3Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonSoft1st3End, with: "")
                setting.orbs[3][common.MOON_SOFT_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonSoft1st4Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonSoft1st4Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonSoft1st4End, with: "")
                setting.orbs[4][common.MOON_SOFT_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonSoft1st5Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonSoft1st5Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonSoft1st5End, with: "")
                setting.orbs[5][common.MOON_SOFT_1ST] = (Double)(tmpLine)!
            
            } else if (line.contains(self.orbMoonHard1st0Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonHard1st0Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonHard1st0End, with: "")
                setting.orbs[0][common.MOON_HARD_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonHard1st1Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonHard1st1Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonHard1st1End, with: "")
                setting.orbs[1][common.MOON_HARD_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonHard1st2Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonHard1st2Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonHard1st2End, with: "")
                setting.orbs[2][common.MOON_HARD_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonHard1st3Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonHard1st3Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonHard1st3End, with: "")
                setting.orbs[3][common.MOON_HARD_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonHard1st4Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonHard1st4Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonHard1st4End, with: "")
                setting.orbs[4][common.MOON_HARD_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonHard1st5Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonHard1st5Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonHard1st5End, with: "")
                setting.orbs[5][common.MOON_HARD_1ST] = (Double)(tmpLine)!

            } else if (line.contains(self.orbOtherSoft1st0Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherSoft1st0Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherSoft1st0End, with: "")
                setting.orbs[0][common.OTHER_SOFT_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbOtherSoft1st1Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherSoft1st1Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherSoft1st1End, with: "")
                setting.orbs[1][common.OTHER_SOFT_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbOtherSoft1st2Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherSoft1st2Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherSoft1st2End, with: "")
                setting.orbs[2][common.OTHER_SOFT_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbOtherSoft1st3Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherSoft1st3Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherSoft1st3End, with: "")
                setting.orbs[3][common.OTHER_SOFT_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbOtherSoft1st4Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherSoft1st4Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherSoft1st4End, with: "")
                setting.orbs[4][common.OTHER_SOFT_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbOtherSoft1st5Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherSoft1st5Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherSoft1st5End, with: "")
                setting.orbs[5][common.OTHER_SOFT_1ST] = (Double)(tmpLine)!
                
            } else if (line.contains(self.orbOtherHard1st0Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherHard1st0Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherHard1st0End, with: "")
                setting.orbs[0][common.OTHER_HARD_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbOtherHard1st1Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherHard1st1Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherHard1st1End, with: "")
                setting.orbs[1][common.OTHER_HARD_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbOtherHard1st2Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherHard1st2Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherHard1st2End, with: "")
                setting.orbs[2][common.OTHER_HARD_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbOtherHard1st3Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherHard1st3Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherHard1st3End, with: "")
                setting.orbs[3][common.OTHER_HARD_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbOtherHard1st4Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherHard1st4Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherHard1st4End, with: "")
                setting.orbs[4][common.OTHER_HARD_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbOtherHard1st5Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherHard1st5Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherHard1st5End, with: "")
                setting.orbs[5][common.OTHER_HARD_1ST] = (Double)(tmpLine)!
                
            } else if (line.contains(self.orbSunSoft2nd0Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunSoft2nd0Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunSoft2nd0End, with: "")
                setting.orbs[0][common.SUN_SOFT_2ND] = (Double)(tmpLine)!
            } else if (line.contains(self.orbSunSoft2nd1Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunSoft2nd1Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunSoft2nd1End, with: "")
                setting.orbs[1][common.SUN_SOFT_2ND] = (Double)(tmpLine)!
            } else if (line.contains(self.orbSunSoft2nd2Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunSoft2nd2Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunSoft2nd2End, with: "")
                setting.orbs[2][common.SUN_SOFT_2ND] = (Double)(tmpLine)!
            } else if (line.contains(self.orbSunSoft2nd3Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunSoft2nd3Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunSoft2nd3End, with: "")
                setting.orbs[3][common.SUN_SOFT_2ND] = (Double)(tmpLine)!
            } else if (line.contains(self.orbSunSoft2nd4Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunSoft2nd4Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunSoft2nd4End, with: "")
                setting.orbs[4][common.SUN_SOFT_2ND] = (Double)(tmpLine)!
            } else if (line.contains(self.orbSunSoft2nd5Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunSoft2nd5Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunSoft2nd5End, with: "")
                setting.orbs[5][common.SUN_SOFT_2ND] = (Double)(tmpLine)!
                
            } else if (line.contains(self.orbSunHard2nd0Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunHard2nd0Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunHard2nd0End, with: "")
                setting.orbs[0][common.SUN_HARD_2ND] = (Double)(tmpLine)!
            } else if (line.contains(self.orbSunHard2nd1Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunHard2nd1Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunHard2nd1End, with: "")
                setting.orbs[1][common.SUN_HARD_2ND] = (Double)(tmpLine)!
            } else if (line.contains(self.orbSunHard2nd2Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunHard2nd2Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunHard2nd2End, with: "")
                setting.orbs[2][common.SUN_HARD_2ND] = (Double)(tmpLine)!
            } else if (line.contains(self.orbSunHard2nd3Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunHard2nd3Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunHard2nd3End, with: "")
                setting.orbs[3][common.SUN_HARD_2ND] = (Double)(tmpLine)!
            } else if (line.contains(self.orbSunHard2nd4Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunHard2nd4Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunHard2nd4End, with: "")
                setting.orbs[4][common.SUN_HARD_2ND] = (Double)(tmpLine)!
            } else if (line.contains(self.orbSunHard2nd5Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunHard2nd5Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunHard2nd5End, with: "")
                setting.orbs[5][common.SUN_HARD_2ND] = (Double)(tmpLine)!
                
            } else if (line.contains(self.orbMoonSoft2nd0Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonSoft2nd0Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonSoft2nd0End, with: "")
                setting.orbs[0][common.MOON_SOFT_2ND] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonSoft2nd1Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonSoft2nd1Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonSoft2nd1End, with: "")
                setting.orbs[1][common.MOON_SOFT_2ND] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonSoft2nd2Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonSoft2nd2Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonSoft2nd2End, with: "")
                setting.orbs[2][common.MOON_SOFT_2ND] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonSoft2nd3Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonSoft2nd3Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonSoft2nd3End, with: "")
                setting.orbs[3][common.MOON_SOFT_2ND] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonSoft2nd4Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonSoft2nd4Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonSoft2nd4End, with: "")
                setting.orbs[4][common.MOON_SOFT_2ND] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonSoft2nd5Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonSoft2nd5Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonSoft2nd5End, with: "")
                setting.orbs[5][common.MOON_SOFT_2ND] = (Double)(tmpLine)!
                
            } else if (line.contains(self.orbMoonHard2nd0Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonHard2nd0Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonHard2nd0End, with: "")
                setting.orbs[0][common.MOON_HARD_2ND] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonHard2nd1Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonHard2nd1Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonHard2nd1End, with: "")
                setting.orbs[1][common.MOON_HARD_2ND] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonHard2nd2Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonHard2nd2Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonHard2nd2End, with: "")
                setting.orbs[2][common.MOON_HARD_2ND] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonHard2nd3Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonHard2nd3Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonHard2nd3End, with: "")
                setting.orbs[3][common.MOON_HARD_2ND] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonHard2nd4Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonHard2nd4Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonHard2nd4End, with: "")
                setting.orbs[4][common.MOON_HARD_2ND] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonHard2nd5Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonHard2nd5Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonHard2nd5End, with: "")
                setting.orbs[5][common.MOON_HARD_2ND] = (Double)(tmpLine)!
                
            } else if (line.contains(self.orbOtherSoft2nd0Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherSoft2nd0Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherSoft2nd0End, with: "")
                setting.orbs[0][common.OTHER_SOFT_2ND] = (Double)(tmpLine)!
            } else if (line.contains(self.orbOtherSoft2nd1Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherSoft2nd1Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherSoft2nd1End, with: "")
                setting.orbs[1][common.OTHER_SOFT_2ND] = (Double)(tmpLine)!
            } else if (line.contains(self.orbOtherSoft2nd2Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherSoft2nd2Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherSoft2nd2End, with: "")
                setting.orbs[2][common.OTHER_SOFT_2ND] = (Double)(tmpLine)!
            } else if (line.contains(self.orbOtherSoft2nd3Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherSoft2nd3Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherSoft2nd3End, with: "")
                setting.orbs[3][common.OTHER_SOFT_2ND] = (Double)(tmpLine)!
            } else if (line.contains(self.orbOtherSoft2nd4Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherSoft2nd4Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherSoft2nd4End, with: "")
                setting.orbs[4][common.OTHER_SOFT_2ND] = (Double)(tmpLine)!
            } else if (line.contains(self.orbOtherSoft2nd5Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherSoft2nd5Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherSoft2nd5End, with: "")
                setting.orbs[5][common.OTHER_SOFT_2ND] = (Double)(tmpLine)!
                
            } else if (line.contains(self.orbOtherHard2nd0Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherHard2nd0Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherHard2nd0End, with: "")
                setting.orbs[0][common.OTHER_HARD_2ND] = (Double)(tmpLine)!
            } else if (line.contains(self.orbOtherHard2nd1Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherHard2nd1Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherHard2nd1End, with: "")
                setting.orbs[1][common.OTHER_HARD_2ND] = (Double)(tmpLine)!
            } else if (line.contains(self.orbOtherHard2nd2Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherHard2nd2Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherHard2nd2End, with: "")
                setting.orbs[2][common.OTHER_HARD_2ND] = (Double)(tmpLine)!
            } else if (line.contains(self.orbOtherHard2nd3Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherHard2nd3Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherHard2nd3End, with: "")
                setting.orbs[3][common.OTHER_HARD_2ND] = (Double)(tmpLine)!
            } else if (line.contains(self.orbOtherHard2nd4Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherHard2nd4Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherHard2nd4End, with: "")
                setting.orbs[4][common.OTHER_HARD_2ND] = (Double)(tmpLine)!
            } else if (line.contains(self.orbOtherHard2nd5Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherHard2nd5Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherHard2nd5End, with: "")
                setting.orbs[5][common.OTHER_HARD_2ND] = (Double)(tmpLine)!

            } else if (line.contains(self.orbSunSoft1500Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunSoft1500Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunSoft1500End, with: "")
                setting.orbs[0][common.SUN_SOFT_150] = (Double)(tmpLine)!
            } else if (line.contains(self.orbSunSoft1501Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunSoft1501Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunSoft1501End, with: "")
                setting.orbs[1][common.SUN_SOFT_150] = (Double)(tmpLine)!
            } else if (line.contains(self.orbSunSoft1502Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunSoft1502Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunSoft1502End, with: "")
                setting.orbs[2][common.SUN_SOFT_150] = (Double)(tmpLine)!
            } else if (line.contains(self.orbSunSoft1503Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunSoft1503Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunSoft1503End, with: "")
                setting.orbs[3][common.SUN_SOFT_150] = (Double)(tmpLine)!
            } else if (line.contains(self.orbSunSoft1504Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunSoft1504Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunSoft1504End, with: "")
                setting.orbs[4][common.SUN_SOFT_150] = (Double)(tmpLine)!
            } else if (line.contains(self.orbSunSoft1505Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunSoft1505Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunSoft1505End, with: "")
                setting.orbs[5][common.SUN_SOFT_150] = (Double)(tmpLine)!
                
            } else if (line.contains(self.orbSunHard1500Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunHard1500Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunHard1500End, with: "")
                setting.orbs[0][common.SUN_HARD_150] = (Double)(tmpLine)!
            } else if (line.contains(self.orbSunHard1501Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunHard1501Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunHard1501End, with: "")
                setting.orbs[1][common.SUN_HARD_150] = (Double)(tmpLine)!
            } else if (line.contains(self.orbSunHard1502Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunHard1502Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunHard1502End, with: "")
                setting.orbs[2][common.SUN_HARD_150] = (Double)(tmpLine)!
            } else if (line.contains(self.orbSunHard1503Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunHard1503Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunHard1503End, with: "")
                setting.orbs[3][common.SUN_HARD_150] = (Double)(tmpLine)!
            } else if (line.contains(self.orbSunHard1504Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunHard1504Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunHard1504End, with: "")
                setting.orbs[4][common.SUN_HARD_150] = (Double)(tmpLine)!
            } else if (line.contains(self.orbSunHard1505Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunHard1505Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunHard1505End, with: "")
                setting.orbs[5][common.SUN_HARD_150] = (Double)(tmpLine)!
                
            } else if (line.contains(self.orbMoonSoft1500Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonSoft1500Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonSoft1500End, with: "")
                setting.orbs[0][common.MOON_SOFT_150] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonSoft1501Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonSoft1501Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonSoft1501End, with: "")
                setting.orbs[1][common.MOON_SOFT_150] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonSoft1502Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonSoft1502Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonSoft1502End, with: "")
                setting.orbs[2][common.MOON_SOFT_150] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonSoft1503Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonSoft1503Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonSoft1503End, with: "")
                setting.orbs[3][common.MOON_SOFT_150] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonSoft1504Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonSoft1504Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonSoft1504End, with: "")
                setting.orbs[4][common.MOON_SOFT_150] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonSoft1505Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonSoft1505Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonSoft1505End, with: "")
                setting.orbs[5][common.MOON_SOFT_150] = (Double)(tmpLine)!
                
            } else if (line.contains(self.orbMoonHard1500Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonHard1500Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonHard1500End, with: "")
                setting.orbs[0][common.MOON_HARD_150] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonHard1501Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonHard1501Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonHard1501End, with: "")
                setting.orbs[1][common.MOON_HARD_150] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonHard1502Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonHard1502Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonHard1502End, with: "")
                setting.orbs[2][common.MOON_HARD_150] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonHard1503Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonHard1503Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonHard1503End, with: "")
                setting.orbs[3][common.MOON_HARD_150] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonHard1504Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonHard1504Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonHard1504End, with: "")
                setting.orbs[4][common.MOON_HARD_150] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonHard1505Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonHard1505Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonHard1505End, with: "")
                setting.orbs[5][common.MOON_HARD_150] = (Double)(tmpLine)!
                
            } else if (line.contains(self.orbOtherSoft1500Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherSoft1500Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherSoft1500End, with: "")
                setting.orbs[0][common.OTHER_SOFT_150] = (Double)(tmpLine)!
            } else if (line.contains(self.orbOtherSoft1501Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherSoft1501Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherSoft1501End, with: "")
                setting.orbs[1][common.OTHER_SOFT_150] = (Double)(tmpLine)!
            } else if (line.contains(self.orbOtherSoft1502Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherSoft1502Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherSoft1502End, with: "")
                setting.orbs[2][common.OTHER_SOFT_150] = (Double)(tmpLine)!
            } else if (line.contains(self.orbOtherSoft1503Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherSoft1503Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherSoft1503End, with: "")
                setting.orbs[3][common.OTHER_SOFT_150] = (Double)(tmpLine)!
            } else if (line.contains(self.orbOtherSoft1504Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherSoft1504Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherSoft1504End, with: "")
                setting.orbs[4][common.OTHER_SOFT_150] = (Double)(tmpLine)!
            } else if (line.contains(self.orbOtherSoft1505Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherSoft1505Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherSoft1505End, with: "")
                setting.orbs[5][common.OTHER_SOFT_150] = (Double)(tmpLine)!
                
            } else if (line.contains(self.orbOtherHard1500Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherHard1500Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherHard1500End, with: "")
                setting.orbs[0][common.OTHER_HARD_150] = (Double)(tmpLine)!
            } else if (line.contains(self.orbOtherHard1501Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherHard1501Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherHard1501End, with: "")
                setting.orbs[1][common.OTHER_HARD_150] = (Double)(tmpLine)!
            } else if (line.contains(self.orbOtherHard1502Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherHard1502Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherHard1502End, with: "")
                setting.orbs[2][common.OTHER_HARD_150] = (Double)(tmpLine)!
            } else if (line.contains(self.orbOtherHard1503Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherHard1503Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherHard1503End, with: "")
                setting.orbs[3][common.OTHER_HARD_150] = (Double)(tmpLine)!
            } else if (line.contains(self.orbOtherHard1504Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherHard1504Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherHard1504End, with: "")
                setting.orbs[4][common.OTHER_HARD_150] = (Double)(tmpLine)!
            } else if (line.contains(self.orbOtherHard1505Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbOtherHard1505Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbOtherHard1505End, with: "")
                setting.orbs[5][common.OTHER_HARD_150] = (Double)(tmpLine)!
                
            } else if (line.contains(self.dispcircle0Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispcircle0Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispcircle0End, with: "")
                if (dispcircleCnt == 0) {
                    setting.dispCircle[0] = (Bool)(tmpLine)!
                    dispcircleCnt = dispcircleCnt + 1
                } else if (dispcircleCnt == 1) {
                    setting.dispCircle[1] = (Bool)(tmpLine)!
                    dispcircleCnt = dispcircleCnt + 1
                } else if (dispcircleCnt == 2) {
                    setting.dispCircle[2] = (Bool)(tmpLine)!
                    dispcircleCnt = dispcircleCnt + 1
                } else if (dispcircleCnt == 3) {
                    setting.dispCircle[3] = (Bool)(tmpLine)!
                    dispcircleCnt = dispcircleCnt + 1
                } else if (dispcircleCnt == 4) {
                    setting.dispCircle[4] = (Bool)(tmpLine)!
                    dispcircleCnt = dispcircleCnt + 1
                } else if (dispcircleCnt == 5) {
                    setting.dispCircle[5] = (Bool)(tmpLine)!
                    dispcircleCnt = dispcircleCnt + 1
                }

            } else if (line.contains(self.dispplanetSun11Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetSun11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetSun11End, with: "")
                let tmpDic: Dictionary<Int, Bool> = [common.ZODIAC_SUN:(Bool)(tmpLine)!]
                setting.dispPlanet.append(tmpDic)
            } else if (line.contains(self.dispplanetMoon11Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetMoon11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetMoon11End, with: "")
                setting.dispPlanet[0][common.ZODIAC_MOON] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetMercury11Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetMercury11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetMercury11End, with: "")
                setting.dispPlanet[0][common.ZODIAC_MERCURY] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetVenus11Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetVenus11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetVenus11End, with: "")
                setting.dispPlanet[0][common.ZODIAC_VENUS] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetJupiter11Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetJupiter11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetJupiter11End, with: "")
                setting.dispPlanet[0][common.ZODIAC_JUPITER] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetMars11Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetMars11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetMars11End, with: "")
                setting.dispPlanet[0][common.ZODIAC_MARS] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetSaturn11Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetSaturn11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetSaturn11End, with: "")
                setting.dispPlanet[0][common.ZODIAC_SATURN] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetUranus11Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetUranus11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetUranus11End, with: "")
                setting.dispPlanet[0][common.ZODIAC_URANUS] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetNeptune11Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetNeptune11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetNeptune11End, with: "")
                setting.dispPlanet[0][common.ZODIAC_NEPTUNE] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetPluto11Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetPluto11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetPluto11End, with: "")
                setting.dispPlanet[0][common.ZODIAC_PLUTO] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetDh11Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetDh11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetDh11End, with: "")
                setting.dispPlanet[0][common.ZODIAC_DH_TRUENODE] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetChiron11Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetChiron11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetChiron11End, with: "")
                setting.dispPlanet[0][common.ZODIAC_CHIRON] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetAsc11Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetAsc11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetAsc11End, with: "")
                setting.dispPlanet[0][common.ZODIAC_ASC] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetMc11Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetMc11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetMc11End, with: "")
                setting.dispPlanet[0][common.ZODIAC_MC] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetEarth11Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetEarth11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetEarth11End, with: "")
                setting.dispPlanet[0][common.ZODIAC_EARTH] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetLilith11Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetLilith11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetLilith11End, with: "")
                setting.dispPlanet[0][common.ZODIAC_LILITH] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetSun22Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetSun22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetSun22End, with: "")
                let tmpDic: Dictionary<Int, Bool> = [common.ZODIAC_SUN:(Bool)(tmpLine)!]
                setting.dispPlanet.append(tmpDic)
            } else if (line.contains(self.dispplanetMoon22Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetMoon22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetMoon22End, with: "")
                setting.dispPlanet[1][common.ZODIAC_MOON] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetMercury22Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetMercury22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetMercury22End, with: "")
                setting.dispPlanet[1][common.ZODIAC_MERCURY] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetVenus22Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetVenus22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetVenus22End, with: "")
                setting.dispPlanet[1][common.ZODIAC_VENUS] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetMars22Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetMars22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetMars22End, with: "")
                setting.dispPlanet[1][common.ZODIAC_MARS] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetJupiter22Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetJupiter22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetJupiter22End, with: "")
                setting.dispPlanet[1][common.ZODIAC_JUPITER] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetSaturn22Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetSaturn22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetSaturn22End, with: "")
                setting.dispPlanet[1][common.ZODIAC_SATURN] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetUranus22Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetUranus22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetUranus22End, with: "")
                setting.dispPlanet[1][common.ZODIAC_URANUS] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetNeptune22Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetNeptune22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetNeptune22End, with: "")
                setting.dispPlanet[1][common.ZODIAC_NEPTUNE] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetPluto22Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetPluto22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetPluto22End, with: "")
                setting.dispPlanet[1][common.ZODIAC_PLUTO] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetDh22Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetDh22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetDh22End, with: "")
                setting.dispPlanet[1][common.ZODIAC_DH_TRUENODE] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetChiron22Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetChiron22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetChiron22End, with: "")
                setting.dispPlanet[1][common.ZODIAC_CHIRON] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetAsc22Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetAsc22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetAsc22End, with: "")
                setting.dispPlanet[1][common.ZODIAC_ASC] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetMc22Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetMc22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetMc22End, with: "")
                setting.dispPlanet[1][common.ZODIAC_MC] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetEarth22Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetEarth22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetEarth22End, with: "")
                setting.dispPlanet[1][common.ZODIAC_EARTH] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetLilith22Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetLilith22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetLilith22End, with: "")
                setting.dispPlanet[1][common.ZODIAC_LILITH] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetSun33Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetSun33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetSun33End, with: "")
                let tmpDic: Dictionary<Int, Bool> = [common.ZODIAC_SUN:(Bool)(tmpLine)!]
                setting.dispPlanet.append(tmpDic)
            } else if (line.contains(self.dispplanetMoon33Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetMoon33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetMoon33End, with: "")
                setting.dispPlanet[2][common.ZODIAC_MOON] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetMercury33Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetMercury33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetMercury33End, with: "")
                setting.dispPlanet[2][common.ZODIAC_MERCURY] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetVenus33Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetVenus33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetVenus33End, with: "")
                setting.dispPlanet[2][common.ZODIAC_VENUS] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetMars33Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetMars33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetMars33End, with: "")
                setting.dispPlanet[2][common.ZODIAC_MARS] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetJupiter33Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetJupiter33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetJupiter33End, with: "")
                setting.dispPlanet[2][common.ZODIAC_JUPITER] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetSaturn33Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetSaturn33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetSaturn33End, with: "")
                setting.dispPlanet[2][common.ZODIAC_SATURN] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetUranus33Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetUranus33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetUranus33End, with: "")
                setting.dispPlanet[2][common.ZODIAC_URANUS] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetNeptune33Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetNeptune33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetNeptune33End, with: "")
                setting.dispPlanet[2][common.ZODIAC_NEPTUNE] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetPluto33Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetPluto33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetPluto33End, with: "")
                setting.dispPlanet[2][common.ZODIAC_PLUTO] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetDh33Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetDh33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetDh33End, with: "")
                setting.dispPlanet[2][common.ZODIAC_DH_TRUENODE] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetChiron33Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetChiron33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetChiron33End, with: "")
                setting.dispPlanet[2][common.ZODIAC_CHIRON] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetAsc33Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetAsc33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetAsc33End, with: "")
                setting.dispPlanet[2][common.ZODIAC_ASC] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetMc33Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetMc33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetMc33End, with: "")
                setting.dispPlanet[2][common.ZODIAC_MC] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetEarth33Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetEarth33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetEarth33End, with: "")
                setting.dispPlanet[2][common.ZODIAC_EARTH] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetLilith33Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetLilith33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetLilith33End, with: "")
                setting.dispPlanet[2][common.ZODIAC_LILITH] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetSun12Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetSun12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetSun12End, with: "")
                let tmpDic: Dictionary<Int, Bool> = [common.ZODIAC_SUN:(Bool)(tmpLine)!]
                setting.dispPlanet.append(tmpDic)
            } else if (line.contains(self.dispplanetMoon12Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetMoon12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetMoon12End, with: "")
                setting.dispPlanet[3][common.ZODIAC_MOON] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetMercury12Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetMercury12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetMercury12End, with: "")
                setting.dispPlanet[3][common.ZODIAC_MERCURY] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetVenus12Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetVenus12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetVenus12End, with: "")
                setting.dispPlanet[3][common.ZODIAC_VENUS] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetMars12Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetMars12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetMars12End, with: "")
                setting.dispPlanet[3][common.ZODIAC_MARS] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetJupiter12Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetJupiter12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetJupiter12End, with: "")
                setting.dispPlanet[3][common.ZODIAC_JUPITER] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetSaturn12Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetSaturn12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetSaturn12End, with: "")
                setting.dispPlanet[3][common.ZODIAC_SATURN] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetUranus12Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetUranus12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetUranus12End, with: "")
                setting.dispPlanet[3][common.ZODIAC_URANUS] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetNeptune12Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetNeptune12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetNeptune12End, with: "")
                setting.dispPlanet[3][common.ZODIAC_NEPTUNE] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetPluto12Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetPluto12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetPluto12End, with: "")
                setting.dispPlanet[3][common.ZODIAC_PLUTO] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetDh12Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetDh12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetDh12End, with: "")
                setting.dispPlanet[3][common.ZODIAC_DH_TRUENODE] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetChiron12Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetChiron12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetChiron12End, with: "")
                setting.dispPlanet[3][common.ZODIAC_CHIRON] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetAsc12Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetAsc12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetAsc12End, with: "")
                setting.dispPlanet[3][common.ZODIAC_ASC] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetMc12Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetMc12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetMc12End, with: "")
                setting.dispPlanet[3][common.ZODIAC_MC] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetEarth12Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetEarth12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetEarth12End, with: "")
                setting.dispPlanet[3][common.ZODIAC_EARTH] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetLilith12Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetLilith12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetLilith12End, with: "")
                setting.dispPlanet[3][common.ZODIAC_LILITH] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetSun13Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetSun13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetSun13End, with: "")
                let tmpDic: Dictionary<Int, Bool> = [common.ZODIAC_SUN:(Bool)(tmpLine)!]
                setting.dispPlanet.append(tmpDic)
            } else if (line.contains(self.dispplanetMoon13Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetMoon13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetMoon13End, with: "")
                setting.dispPlanet[4][common.ZODIAC_MOON] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetMercury13Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetMercury13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetMercury13End, with: "")
                setting.dispPlanet[4][common.ZODIAC_MERCURY] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetVenus13Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetVenus13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetVenus13End, with: "")
                setting.dispPlanet[4][common.ZODIAC_VENUS] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetMars13Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetMars13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetMars13End, with: "")
                setting.dispPlanet[4][common.ZODIAC_MARS] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetJupiter13Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetJupiter13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetJupiter13End, with: "")
                setting.dispPlanet[4][common.ZODIAC_JUPITER] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetSaturn13Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetSaturn13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetSaturn13End, with: "")
                setting.dispPlanet[4][common.ZODIAC_SATURN] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetUranus13Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetUranus13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetUranus13End, with: "")
                setting.dispPlanet[4][common.ZODIAC_URANUS] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetNeptune13Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetNeptune13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetNeptune13End, with: "")
                setting.dispPlanet[4][common.ZODIAC_NEPTUNE] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetPluto13Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetPluto13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetPluto13End, with: "")
                setting.dispPlanet[4][common.ZODIAC_PLUTO] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetDh13Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetDh13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetDh13End, with: "")
                setting.dispPlanet[4][common.ZODIAC_DH_TRUENODE] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetChiron13Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetChiron13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetChiron13End, with: "")
                setting.dispPlanet[4][common.ZODIAC_CHIRON] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetAsc13Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetAsc13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetAsc13End, with: "")
                setting.dispPlanet[4][common.ZODIAC_ASC] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetMc13Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetMc13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetMc13End, with: "")
                setting.dispPlanet[4][common.ZODIAC_MC] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetEarth13Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetEarth13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetEarth13End, with: "")
                setting.dispPlanet[4][common.ZODIAC_EARTH] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetLilith13Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetLilith13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetLilith13End, with: "")
                setting.dispPlanet[4][common.ZODIAC_LILITH] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetSun23Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetSun23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetSun23End, with: "")
                let tmpDic: Dictionary<Int, Bool> = [common.ZODIAC_SUN:(Bool)(tmpLine)!]
                setting.dispPlanet.append(tmpDic)
            } else if (line.contains(self.dispplanetMoon23Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetMoon23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetMoon23End, with: "")
                setting.dispPlanet[5][common.ZODIAC_MOON] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetMercury23Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetMercury23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetMercury23End, with: "")
                setting.dispPlanet[5][common.ZODIAC_MERCURY] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetVenus23Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetVenus23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetVenus23End, with: "")
                setting.dispPlanet[5][common.ZODIAC_VENUS] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetMars23Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetMars23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetMars23End, with: "")
                setting.dispPlanet[5][common.ZODIAC_MARS] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetJupiter23Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetJupiter23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetJupiter23End, with: "")
                setting.dispPlanet[5][common.ZODIAC_JUPITER] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetSaturn23Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetSaturn23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetSaturn23End, with: "")
                setting.dispPlanet[5][common.ZODIAC_SATURN] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetUranus23Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetUranus23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetUranus23End, with: "")
                setting.dispPlanet[5][common.ZODIAC_URANUS] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetNeptune23Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetNeptune23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetNeptune23End, with: "")
                setting.dispPlanet[5][common.ZODIAC_NEPTUNE] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetPluto23Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetPluto23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetPluto23End, with: "")
                setting.dispPlanet[5][common.ZODIAC_PLUTO] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetDh23Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetDh23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetDh23End, with: "")
                setting.dispPlanet[5][common.ZODIAC_DH_TRUENODE] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetChiron23Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetChiron23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetChiron23End, with: "")
                setting.dispPlanet[5][common.ZODIAC_CHIRON] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetAsc23Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetAsc23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetAsc23End, with: "")
                setting.dispPlanet[5][common.ZODIAC_ASC] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetMc23Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetMc23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetMc23End, with: "")
                setting.dispPlanet[5][common.ZODIAC_MC] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetEarth23Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetEarth23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetEarth23End, with: "")
                setting.dispPlanet[5][common.ZODIAC_EARTH] = (Bool)(tmpLine)!
            } else if (line.contains(self.dispplanetLilith23Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispplanetLilith23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispplanetLilith23End, with: "")
                setting.dispPlanet[5][common.ZODIAC_LILITH] = (Bool)(tmpLine)!

            } else if (line.contains(self.dispaspect0Start)) {
                tmpLine = line.replacingOccurrences(of: self.dispaspect0Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispaspect0End, with: "")
                if (dispaspectCnt == 0) {
                    setting.dispAspect[0][0] = (Bool)(tmpLine)!
                    dispaspectCnt = dispaspectCnt + 1
                } else if (dispaspectCnt == 1) {
                    setting.dispAspect[1][1] = (Bool)(tmpLine)!
                    dispaspectCnt = dispaspectCnt + 1
                } else if (dispaspectCnt == 2) {
                    setting.dispAspect[2][2] = (Bool)(tmpLine)!
                    dispaspectCnt = dispaspectCnt + 1
                } else if (dispaspectCnt == 3) {
                    setting.dispAspect[0][1] = (Bool)(tmpLine)!
                    dispaspectCnt = dispaspectCnt + 1
                } else if (dispaspectCnt == 4) {
                    setting.dispAspect[0][2] = (Bool)(tmpLine)!
                    dispaspectCnt = dispaspectCnt + 1
                } else if (dispaspectCnt == 5) {
                    setting.dispAspect[1][2] = (Bool)(tmpLine)!
                    dispaspectCnt = dispaspectCnt + 1
                }

            } else if (line.contains(self.aspectSun11Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectSun11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectSun11End, with: "")
                let tmpDic: Dictionary<Int, Bool> = [common.ZODIAC_SUN:(Bool)(tmpLine)!]
                setting.dispAspectPlanet.append(tmpDic)
            } else if (line.contains(self.aspectMoon11Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectMoon11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectMoon11End, with: "")
                setting.dispAspectPlanet[0][common.ZODIAC_MOON] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectMercury11Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectMercury11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectMercury11End, with: "")
                setting.dispAspectPlanet[0][common.ZODIAC_MERCURY] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectVenus11Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectVenus11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectVenus11End, with: "")
                setting.dispAspectPlanet[0][common.ZODIAC_VENUS] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectMars11Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectMars11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectMars11End, with: "")
                setting.dispAspectPlanet[0][common.ZODIAC_MARS] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectJupiter11Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectJupiter11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectJupiter11End, with: "")
                setting.dispAspectPlanet[0][common.ZODIAC_JUPITER] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectSaturn11Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectSaturn11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectSaturn11End, with: "")
                setting.dispAspectPlanet[0][common.ZODIAC_SATURN] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectUranus11Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectUranus11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectUranus11End, with: "")
                setting.dispAspectPlanet[0][common.ZODIAC_URANUS] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectNeptune11Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectNeptune11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectNeptune11End, with: "")
                setting.dispAspectPlanet[0][common.ZODIAC_NEPTUNE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectPluto11Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectPluto11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectPluto11End, with: "")
                setting.dispAspectPlanet[0][common.ZODIAC_PLUTO] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectDh11Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectDh11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectDh11End, with: "")
                setting.dispAspectPlanet[0][common.ZODIAC_DH_TRUENODE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectChiron11Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectChiron11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectChiron11End, with: "")
                setting.dispAspectPlanet[0][common.ZODIAC_CHIRON] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectAsc11Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectAsc11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectAsc11End, with: "")
                setting.dispAspectPlanet[0][common.ZODIAC_ASC] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectMc11Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectMc11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectMc11End, with: "")
                setting.dispAspectPlanet[0][common.ZODIAC_MC] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectEarth11Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectEarth11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectEarth11End, with: "")
                setting.dispAspectPlanet[0][common.ZODIAC_EARTH] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectLilith11Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectLilith11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectLilith11End, with: "")
                setting.dispAspectPlanet[0][common.ZODIAC_LILITH] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectSun22Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectSun22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectSun22End, with: "")
                let tmpDic: Dictionary<Int, Bool> = [common.ZODIAC_SUN:(Bool)(tmpLine)!]
                setting.dispAspectPlanet.append(tmpDic)
            } else if (line.contains(self.aspectMoon22Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectMoon22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectMoon22End, with: "")
                setting.dispAspectPlanet[1][common.ZODIAC_MOON] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectMercury22Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectMercury22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectMercury22End, with: "")
                setting.dispAspectPlanet[1][common.ZODIAC_MERCURY] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectVenus22Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectVenus22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectVenus22End, with: "")
                setting.dispAspectPlanet[1][common.ZODIAC_VENUS] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectMars22Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectMars22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectMars22End, with: "")
                setting.dispAspectPlanet[1][common.ZODIAC_MARS] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectJupiter22Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectJupiter22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectJupiter22End, with: "")
                setting.dispAspectPlanet[1][common.ZODIAC_JUPITER] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectSaturn22Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectSaturn22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectSaturn22End, with: "")
                setting.dispAspectPlanet[1][common.ZODIAC_SATURN] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectUranus22Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectUranus22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectUranus22End, with: "")
                setting.dispAspectPlanet[1][common.ZODIAC_URANUS] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectNeptune22Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectNeptune22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectNeptune22End, with: "")
                setting.dispAspectPlanet[1][common.ZODIAC_NEPTUNE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectPluto22Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectPluto22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectPluto22End, with: "")
                setting.dispAspectPlanet[1][common.ZODIAC_PLUTO] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectDh22Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectDh22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectDh22End, with: "")
                setting.dispAspectPlanet[1][common.ZODIAC_DH_TRUENODE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectChiron22Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectChiron22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectChiron22End, with: "")
                setting.dispAspectPlanet[1][common.ZODIAC_CHIRON] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectAsc22Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectAsc22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectAsc22End, with: "")
                setting.dispAspectPlanet[1][common.ZODIAC_ASC] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectMc22Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectMc22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectMc22End, with: "")
                setting.dispAspectPlanet[1][common.ZODIAC_MC] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectEarth22Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectEarth22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectEarth22End, with: "")
                setting.dispAspectPlanet[1][common.ZODIAC_EARTH] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectLilith22Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectLilith22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectLilith22End, with: "")
                setting.dispAspectPlanet[1][common.ZODIAC_LILITH] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectSun33Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectSun33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectSun33End, with: "")
                let tmpDic: Dictionary<Int, Bool> = [common.ZODIAC_SUN:(Bool)(tmpLine)!]
                setting.dispAspectPlanet.append(tmpDic)
            } else if (line.contains(self.aspectMoon33Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectMoon33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectMoon33End, with: "")
                setting.dispAspectPlanet[2][common.ZODIAC_MOON] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectMercury33Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectMercury33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectMercury33End, with: "")
                setting.dispAspectPlanet[2][common.ZODIAC_MERCURY] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectVenus33Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectVenus33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectVenus33End, with: "")
                setting.dispAspectPlanet[2][common.ZODIAC_VENUS] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectMars33Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectMars33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectMars33End, with: "")
                setting.dispAspectPlanet[2][common.ZODIAC_MARS] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectJupiter33Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectJupiter33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectJupiter33End, with: "")
                setting.dispAspectPlanet[2][common.ZODIAC_JUPITER] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectSaturn33Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectSaturn33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectSaturn33End, with: "")
                setting.dispAspectPlanet[2][common.ZODIAC_SATURN] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectUranus33Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectUranus33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectUranus33End, with: "")
                setting.dispAspectPlanet[2][common.ZODIAC_URANUS] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectNeptune33Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectNeptune33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectNeptune33End, with: "")
                setting.dispAspectPlanet[2][common.ZODIAC_NEPTUNE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectPluto33Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectPluto33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectPluto33End, with: "")
                setting.dispAspectPlanet[2][common.ZODIAC_PLUTO] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectDh33Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectDh33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectDh33End, with: "")
                setting.dispAspectPlanet[2][common.ZODIAC_DH_TRUENODE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectChiron33Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectChiron33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectChiron33End, with: "")
                setting.dispAspectPlanet[2][common.ZODIAC_CHIRON] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectAsc33Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectAsc33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectAsc33End, with: "")
                setting.dispAspectPlanet[2][common.ZODIAC_ASC] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectMc33Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectMc33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectMc33End, with: "")
                setting.dispAspectPlanet[2][common.ZODIAC_MC] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectEarth33Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectEarth33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectEarth33End, with: "")
                setting.dispAspectPlanet[2][common.ZODIAC_EARTH] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectLilith33Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectLilith33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectLilith33End, with: "")
                setting.dispAspectPlanet[2][common.ZODIAC_LILITH] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectSun12Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectSun12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectSun12End, with: "")
                let tmpDic: Dictionary<Int, Bool> = [common.ZODIAC_SUN:(Bool)(tmpLine)!]
                setting.dispAspectPlanet.append(tmpDic)
            } else if (line.contains(self.aspectMoon12Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectMoon12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectMoon12End, with: "")
                setting.dispAspectPlanet[3][common.ZODIAC_MOON] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectMercury12Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectMercury12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectMercury12End, with: "")
                setting.dispAspectPlanet[3][common.ZODIAC_MERCURY] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectVenus12Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectVenus12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectVenus12End, with: "")
                setting.dispAspectPlanet[3][common.ZODIAC_VENUS] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectMars12Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectMars12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectMars12End, with: "")
                setting.dispAspectPlanet[3][common.ZODIAC_MARS] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectJupiter12Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectJupiter12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectJupiter12End, with: "")
                setting.dispAspectPlanet[3][common.ZODIAC_JUPITER] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectSaturn12Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectSaturn12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectSaturn12End, with: "")
                setting.dispAspectPlanet[3][common.ZODIAC_SATURN] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectUranus12Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectUranus12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectUranus12End, with: "")
                setting.dispAspectPlanet[3][common.ZODIAC_URANUS] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectNeptune12Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectNeptune12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectNeptune12End, with: "")
                setting.dispAspectPlanet[3][common.ZODIAC_NEPTUNE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectPluto12Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectPluto12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectPluto12End, with: "")
                setting.dispAspectPlanet[3][common.ZODIAC_PLUTO] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectDh12Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectDh12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectDh12End, with: "")
                setting.dispAspectPlanet[3][common.ZODIAC_DH_TRUENODE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectChiron12Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectChiron12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectChiron12End, with: "")
                setting.dispAspectPlanet[3][common.ZODIAC_CHIRON] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectAsc12Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectAsc12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectAsc12End, with: "")
                setting.dispAspectPlanet[3][common.ZODIAC_ASC] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectMc12Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectMc12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectMc12End, with: "")
                setting.dispAspectPlanet[3][common.ZODIAC_MC] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectEarth12Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectEarth12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectEarth12End, with: "")
                setting.dispAspectPlanet[3][common.ZODIAC_EARTH] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectLilith12Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectLilith12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectLilith12End, with: "")
                setting.dispAspectPlanet[3][common.ZODIAC_LILITH] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectSun13Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectSun13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectSun13End, with: "")
                let tmpDic: Dictionary<Int, Bool> = [common.ZODIAC_SUN:(Bool)(tmpLine)!]
                setting.dispAspectPlanet.append(tmpDic)
            } else if (line.contains(self.aspectMoon13Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectMoon13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectMoon13End, with: "")
                setting.dispAspectPlanet[4][common.ZODIAC_MOON] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectMercury13Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectMercury13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectMercury13End, with: "")
                setting.dispAspectPlanet[4][common.ZODIAC_MERCURY] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectVenus13Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectVenus13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectVenus13End, with: "")
                setting.dispAspectPlanet[4][common.ZODIAC_VENUS] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectMars13Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectMars13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectMars13End, with: "")
                setting.dispAspectPlanet[4][common.ZODIAC_MARS] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectJupiter13Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectJupiter13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectJupiter13End, with: "")
                setting.dispAspectPlanet[4][common.ZODIAC_JUPITER] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectSaturn13Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectSaturn13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectSaturn13End, with: "")
                setting.dispAspectPlanet[4][common.ZODIAC_SATURN] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectUranus13Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectUranus13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectUranus13End, with: "")
                setting.dispAspectPlanet[4][common.ZODIAC_URANUS] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectNeptune13Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectNeptune13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectNeptune13End, with: "")
                setting.dispAspectPlanet[4][common.ZODIAC_NEPTUNE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectPluto13Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectPluto13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectPluto13End, with: "")
                setting.dispAspectPlanet[4][common.ZODIAC_PLUTO] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectDh13Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectDh13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectDh13End, with: "")
                setting.dispAspectPlanet[4][common.ZODIAC_DH_TRUENODE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectChiron13Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectChiron13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectChiron13End, with: "")
                setting.dispAspectPlanet[4][common.ZODIAC_CHIRON] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectAsc13Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectAsc13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectAsc13End, with: "")
                setting.dispAspectPlanet[4][common.ZODIAC_ASC] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectMc13Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectMc13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectMc13End, with: "")
                setting.dispAspectPlanet[4][common.ZODIAC_MC] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectEarth13Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectEarth13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectEarth13End, with: "")
                setting.dispAspectPlanet[4][common.ZODIAC_EARTH] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectLilith13Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectLilith13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectLilith13End, with: "")
                setting.dispAspectPlanet[4][common.ZODIAC_LILITH] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectSun23Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectSun23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectSun23End, with: "")
                let tmpDic: Dictionary<Int, Bool> = [common.ZODIAC_SUN:(Bool)(tmpLine)!]
                setting.dispAspectPlanet.append(tmpDic)
            } else if (line.contains(self.aspectMoon23Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectMoon23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectMoon23End, with: "")
                setting.dispAspectPlanet[5][common.ZODIAC_MOON] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectMercury23Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectMercury23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectMercury23End, with: "")
                setting.dispAspectPlanet[5][common.ZODIAC_MERCURY] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectVenus23Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectVenus23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectVenus23End, with: "")
                setting.dispAspectPlanet[5][common.ZODIAC_VENUS] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectMars23Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectMars23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectMars23End, with: "")
                setting.dispAspectPlanet[5][common.ZODIAC_MARS] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectJupiter23Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectJupiter23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectJupiter23End, with: "")
                setting.dispAspectPlanet[5][common.ZODIAC_JUPITER] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectSaturn23Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectSaturn23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectSaturn23End, with: "")
                setting.dispAspectPlanet[5][common.ZODIAC_SATURN] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectUranus23Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectUranus23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectUranus23End, with: "")
                setting.dispAspectPlanet[5][common.ZODIAC_URANUS] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectNeptune23Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectNeptune23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectNeptune23End, with: "")
                setting.dispAspectPlanet[5][common.ZODIAC_NEPTUNE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectPluto23Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectPluto23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectPluto23End, with: "")
                setting.dispAspectPlanet[5][common.ZODIAC_PLUTO] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectDh23Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectDh23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectDh23End, with: "")
                setting.dispAspectPlanet[5][common.ZODIAC_DH_TRUENODE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectChiron23Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectChiron23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectChiron23End, with: "")
                setting.dispAspectPlanet[5][common.ZODIAC_CHIRON] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectAsc23Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectAsc23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectAsc23End, with: "")
                setting.dispAspectPlanet[5][common.ZODIAC_ASC] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectMc23Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectMc23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectMc23End, with: "")
                setting.dispAspectPlanet[5][common.ZODIAC_MC] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectEarth23Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectEarth23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectEarth23End, with: "")
                setting.dispAspectPlanet[5][common.ZODIAC_EARTH] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectLilith23Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectLilith23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectLilith23End, with: "")
                setting.dispAspectPlanet[5][common.ZODIAC_LILITH] = (Bool)(tmpLine)!

            } else if (line.contains(self.aspectConjunction11Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectConjunction11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectConjunction11End, with: "")
                let tmpDic: Dictionary<Int, Bool> = [common.CONJUNCTION:(Bool)(tmpLine)!]
                setting.dispAspectCategory.append(tmpDic)
            } else if (line.contains(self.aspectOpposition11Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectOpposition11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectOpposition11End, with: "")
                setting.dispAspectCategory[0][common.OPPOSITION] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectInconjunct11Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectInconjunct11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectInconjunct11End, with: "")
                setting.dispAspectCategory[0][common.INCONJUNCT] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectSesquiquadrate11Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectSesquiquadrate11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectSesquiquadrate11End, with: "")
                setting.dispAspectCategory[0][common.SESQUIQUADRATE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectTrine11Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectTrine11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectTrine11End, with: "")
                setting.dispAspectCategory[0][common.TRINE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectSquare11Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectSquare11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectSquare11End, with: "")
                setting.dispAspectCategory[0][common.SQUARE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectSextile11Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectSextile11Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectSextile11End, with: "")
                setting.dispAspectCategory[0][common.SEXTILE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectConjunction22Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectConjunction22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectConjunction22End, with: "")
                let tmpDic: Dictionary<Int, Bool> = [common.CONJUNCTION:(Bool)(tmpLine)!]
                setting.dispAspectCategory.append(tmpDic)
            } else if (line.contains(self.aspectOpposition22Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectOpposition22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectOpposition22End, with: "")
                setting.dispAspectCategory[1][common.OPPOSITION] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectInconjunct22Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectInconjunct22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectInconjunct22End, with: "")
                setting.dispAspectCategory[1][common.INCONJUNCT] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectSesquiquadrate22Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectSesquiquadrate22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectSesquiquadrate22End, with: "")
                setting.dispAspectCategory[1][common.SESQUIQUADRATE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectTrine22Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectTrine22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectTrine22End, with: "")
                setting.dispAspectCategory[1][common.TRINE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectSquare22Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectSquare22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectSquare22End, with: "")
                setting.dispAspectCategory[1][common.SQUARE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectSextile22Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectSextile22Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectSextile22End, with: "")
                setting.dispAspectCategory[1][common.SEXTILE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectConjunction33Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectConjunction33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectConjunction33End, with: "")
                let tmpDic: Dictionary<Int, Bool> = [common.CONJUNCTION:(Bool)(tmpLine)!]
                setting.dispAspectCategory.append(tmpDic)
            } else if (line.contains(self.aspectOpposition33Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectOpposition33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectOpposition33End, with: "")
                setting.dispAspectCategory[2][common.OPPOSITION] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectInconjunct33Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectInconjunct33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectInconjunct33End, with: "")
                setting.dispAspectCategory[2][common.INCONJUNCT] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectSesquiquadrate33Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectSesquiquadrate33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectSesquiquadrate33End, with: "")
                setting.dispAspectCategory[2][common.SESQUIQUADRATE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectTrine33Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectTrine33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectTrine33End, with: "")
                setting.dispAspectCategory[2][common.TRINE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectSquare33Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectSquare33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectSquare33End, with: "")
                setting.dispAspectCategory[2][common.SQUARE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectSextile33Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectSextile33Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectSextile33End, with: "")
                setting.dispAspectCategory[2][common.SEXTILE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectConjunction12Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectConjunction12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectConjunction12End, with: "")
                let tmpDic: Dictionary<Int, Bool> = [common.CONJUNCTION:(Bool)(tmpLine)!]
                setting.dispAspectCategory.append(tmpDic)
            } else if (line.contains(self.aspectOpposition12Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectOpposition12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectOpposition12End, with: "")
                setting.dispAspectCategory[3][common.OPPOSITION] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectInconjunct12Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectInconjunct12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectInconjunct12End, with: "")
                setting.dispAspectCategory[3][common.INCONJUNCT] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectSesquiquadrate12Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectSesquiquadrate12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectSesquiquadrate12End, with: "")
                setting.dispAspectCategory[3][common.SESQUIQUADRATE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectTrine12Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectTrine12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectTrine12End, with: "")
                setting.dispAspectCategory[3][common.TRINE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectSquare12Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectSquare12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectSquare12End, with: "")
                setting.dispAspectCategory[3][common.SQUARE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectSextile12Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectSextile12Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectSextile12End, with: "")
                setting.dispAspectCategory[3][common.SEXTILE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectConjunction13Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectConjunction13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectConjunction13End, with: "")
                let tmpDic: Dictionary<Int, Bool> = [common.CONJUNCTION:(Bool)(tmpLine)!]
                setting.dispAspectCategory.append(tmpDic)
            } else if (line.contains(self.aspectOpposition13Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectOpposition13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectOpposition13End, with: "")
                setting.dispAspectCategory[4][common.OPPOSITION] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectInconjunct13Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectInconjunct13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectInconjunct13End, with: "")
                setting.dispAspectCategory[4][common.INCONJUNCT] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectSesquiquadrate13Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectSesquiquadrate13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectSesquiquadrate13End, with: "")
                setting.dispAspectCategory[4][common.SESQUIQUADRATE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectTrine13Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectTrine13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectTrine13End, with: "")
                setting.dispAspectCategory[4][common.TRINE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectSquare13Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectSquare13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectSquare13End, with: "")
                setting.dispAspectCategory[4][common.SQUARE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectSextile13Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectSextile13Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectSextile13End, with: "")
                setting.dispAspectCategory[4][common.SEXTILE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectConjunction23Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectConjunction23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectConjunction23End, with: "")
                let tmpDic: Dictionary<Int, Bool> = [common.CONJUNCTION:(Bool)(tmpLine)!]
                setting.dispAspectCategory.append(tmpDic)
            } else if (line.contains(self.aspectOpposition23Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectOpposition23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectOpposition23End, with: "")
                setting.dispAspectCategory[5][common.OPPOSITION] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectInconjunct23Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectInconjunct23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectInconjunct23End, with: "")
                setting.dispAspectCategory[5][common.INCONJUNCT] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectSesquiquadrate23Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectSesquiquadrate23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectSesquiquadrate23End, with: "")
                setting.dispAspectCategory[5][common.SESQUIQUADRATE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectTrine23Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectTrine23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectTrine23End, with: "")
                setting.dispAspectCategory[5][common.TRINE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectSquare23Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectSquare23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectSquare23End, with: "")
                setting.dispAspectCategory[5][common.SQUARE] = (Bool)(tmpLine)!
            } else if (line.contains(self.aspectSextile23Start)) {
                tmpLine = line.replacingOccurrences(of: self.aspectSextile23Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.aspectSextile23End, with: "")
                setting.dispAspectCategory[5][common.SEXTILE] = (Bool)(tmpLine)!
                
            }
        }
        
        return setting
    }

    func FileToSetting(_ no: Int) -> SettingData {
        let documents = NSSearchPathForDirectoriesInDomains(
            .documentDirectory,
            .userDomainMask, true)[0]
        let fileManager = FileManager.default
        let directoryName = "microcosm"
        let createPath = documents + "/" + directoryName + "/system"
        let filePath = createPath + "/setting" + (String)(no) + ".csm"
        var isDir: ObjCBool = false

        if (!fileManager.fileExists(atPath: filePath, isDirectory: &isDir)) {
            let str: NSString = NewSetting()
            FileManager.default.createFile(atPath: filePath, contents: str.data(using: String.Encoding.utf8.rawValue))
        }

        let url: NSURL = NSURL(fileURLWithPath: filePath)
        var text: NSString
        do {
            text = try NSString(contentsOf: url as URL, encoding: String.Encoding.utf8.rawValue)
        } catch let error as NSError {
            NSLog(error.localizedDescription)
            text = "" as NSString
        }

        return XmlToSetting(text, no: no)
    }

    func NewSetting() -> NSString {
        let newSetting: SettingXmlParserNewSetting = SettingXmlParserNewSetting()
        return newSetting.NewSetting()
    }
}
