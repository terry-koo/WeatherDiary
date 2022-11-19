//
//  WeatherCondition+Extension.swift
//  날씨장
//
//  Created by KiWoong Hong on 2022/11/07.
//

import SwiftUI
import WeatherKit

/*
 Declaration
 enum WeatehrCondition
 */

extension WeatherCondition {
    /*
     MARK: WeatherKit WeatherCondition enum Data
     
     Getting visibility properties
     case blowingDust               //     Blowing dust or sandstorm.
     case clear                     //     Clear.
     case cloudy                    //     Cloudy, overcast conditions.
     case foggy                     //     Fog.
     case haze                      //     Haze.
     case mostlyClear               //     Mostly clear.
     case mostlyCloudy              //     Mostly cloudy.
     case partlyCloudy              //     Partly cloudy.
     case smoky                     //     Smoky.
     
     Getting wind properties
     case breezy                    //     Breezy, light wind.
     case windy                     //     Windy.
     
     Getting precipitation properties
     case drizzle                   //     Drizzle or light rain.
     case heavyRain                 //     Heavy rain.
     case isolatedThunderstorms     //     Thunderstorms covering less than 1/8 of the forecast area.
     case rain                      //     Rain.
     case sunShowers                //     Rain with visible sun.
     case scatteredThunderstorms    //     Numerous thunderstorms spread across up to 50% of the forecast area.
     case strongStorms              //     Notably strong thunderstorms.
     case thunderstorms             //     Thunderstorms.
     
     Getting hazardous properties
     case frigid                    //     Frigid conditions, low temperatures, or ice crystals.
     case hail                      //     Hail.
     case hot                       //     High temperatures.
     
     Getting winter precipitation properties
     case flurries                  //     Flurries or light snow.
     case sleet                     //     Sleet.
     case snow                      //     Snow.
     case sunFlurries               //     Snow flurries with visible sun.
     case wintryMix                 //     Wintry mix.
     
     Getting hazardous winter properties
     case blizzard                  //     Blizzard.
     case blowingSnow               //     Blowing or drifting snow.
     case freezingDrizzle           //     Freezing drizzle or light rain.
     case freezingRain              //     Freezing rain.
     case heavySnow                 //     Heavy snow.
     
     Getting tropical hazard properties
     case hurricane                 //     Hurricane.
     case tropicalStorm             //     Tropical storm.
     */
    
    var koreanValue: String {
        switch self {
        case .blowingDust: return "먼지바람"
        case .clear: return "맑음"
        case .cloudy: return "구름"
        case .foggy: return "흐림"
        case .haze: return "안개"
        case .mostlyClear: return "거의맑음"
        case .mostlyCloudy: return "구름많음"
        case .partlyCloudy: return "구름보통"
        case .smoky: return "껌껌"
        case .breezy: return "산들바람"
        case .windy: return "바람"
        case .rain: return "비"
        case .heavyRain: return "비콸콸"
        case .freezingRain: return "얼음비"
        case .snow: return "눈"
        case .heavySnow: return "함박눈"
        case .blowingSnow: return "눈보라"
        default: return "기타"
        }
    }
    
    var imageName: String {
        switch self {
        case .blowingDust: return "windy"
        case .clear: return "sun"
        case .cloudy: return "windy"
        case .foggy: return "windy"
        case .haze: return "windy"
        case .mostlyClear: return "sun"
        case .mostlyCloudy: return "windy"
        case .partlyCloudy: return "sunnyCloudy"
        case .smoky: return "windy"
        case .breezy, .windy: return "windy"
        case .rain, .heavyRain, .freezingRain: return "rain"
        case .snow, .heavySnow, .blowingSnow: return "snow"
        default: return "windy"
        }
    }
}

