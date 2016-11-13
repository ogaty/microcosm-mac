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
    
    func XmlToConfig(_ xml: NSString) -> SettingData {
        let setting: SettingData = SettingData(0)
        var inUserData: Bool = false
        let common: CommonData = CommonData()
        
        xml.enumerateLines {
            line, stop in
            var tmpLine : String = ""
            if (line == self.xmlhead) {
                tmpLine = line.replacingOccurrences(of: self.xmlhead, with: "")
            } else if (line.contains(self.xmltop)) {
                inUserData = true
                tmpLine = line.replacingOccurrences(of: self.xmltop, with: "")
            } else if (line.contains(self.xmlend)) {
                inUserData = false
                tmpLine = line.replacingOccurrences(of: self.xmlend, with: "")
            } else if (line.contains(self.dispnameStart)) {
                tmpLine = line.replacingOccurrences(of: self.dispnameStart, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.dispnameEnd, with: "")
                setting.dispName = tmpLine
            } else if (line.contains(self.orbSunSoft1st0Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunSoft1st0Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunSoft1st0End, with: "")
                setting.orbs[0][common.SUN_SOFT_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbSunSoft1st1Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunSoft1st1Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunSoft1st1End, with: "")
                setting.orbs[1][common.SUN_SOFT_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbSunSoft1st2Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunSoft1st2Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunSoft1st2End, with: "")
                setting.orbs[2][common.SUN_SOFT_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbSunSoft1st3Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunSoft1st3Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunSoft1st3End, with: "")
                setting.orbs[3][common.SUN_SOFT_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbSunSoft1st4Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunSoft1st4Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunSoft1st4End, with: "")
                setting.orbs[4][common.SUN_SOFT_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbSunSoft1st5Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbSunSoft1st5Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbSunSoft1st5End, with: "")
                setting.orbs[5][common.SUN_SOFT_1ST] = (Double)(tmpLine)!

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
                setting.orbs[0][common.MOON_SOFT_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonHard1st1Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonHard1st1Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonHard1st1End, with: "")
                setting.orbs[1][common.MOON_SOFT_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonHard1st2Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonHard1st2Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonHard1st2End, with: "")
                setting.orbs[2][common.MOON_SOFT_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonHard1st3Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonHard1st3Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonHard1st3End, with: "")
                setting.orbs[3][common.MOON_SOFT_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonHard1st4Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonHard1st4Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonHard1st4End, with: "")
                setting.orbs[4][common.MOON_SOFT_1ST] = (Double)(tmpLine)!
            } else if (line.contains(self.orbMoonHard1st5Start)) {
                tmpLine = line.replacingOccurrences(of: self.orbMoonHard1st5Start, with: "")
                tmpLine = tmpLine.replacingOccurrences(of: self.orbMoonHard1st5End, with: "")
                setting.orbs[5][common.MOON_SOFT_1ST] = (Double)(tmpLine)!

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
                
            }
        }
        
        return setting
    }
}
