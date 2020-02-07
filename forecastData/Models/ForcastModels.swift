//
//  ForcastModels.swift
//  forecastData
//
//  Created by Sorasak on 12/16/19.
//  Copyright © 2019 Dol2oMo. All rights reserved.
//

import UIKit
import SwiftyJSON

enum ForcastModels {

    struct ForcastCity {
        
        let city: CityDetail
        let list: [List]
        
        static func deserialize(data: JSON) -> ForcastCity {
            return ForcastModels.ForcastCity(
                city: CityDetail.deserialize(data: JSON(data["city"])),
                //debug
                //list: data["lists"].arrayValue.map(List.deserialize)
                list: data["list"].arrayValue.map(List.deserialize)
            )
        }
    }
    
    struct CityDetail {
        
        let name: String
        let country: String
        
        static func deserialize(data: JSON) -> CityDetail {
            return ForcastModels.CityDetail(
                name: data["name"].stringValue,
                country: data["country"].stringValue
            )
        }
    }
    
    struct List {
        
        let weather: [WeatherDetail]
        let speed: Float
        
        static func deserialize(data: JSON) -> List {
            return ForcastModels.List(
                weather: data["weather"].arrayValue.map(WeatherDetail.deserialize)  ,
                speed: data["speed"].floatValue
            )
        }
    }
    
    struct WeatherDetail {
        
        let main: String
        let description: String
        
        static func deserialize(data: JSON) -> WeatherDetail {
            return ForcastModels.WeatherDetail(
                main: data["main"].stringValue,
                description: data["description"].stringValue
            )
        }
    }
}
