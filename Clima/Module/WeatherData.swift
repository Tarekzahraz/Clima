//
//  WeatherData.swift
//  Clima
//
//  Created by Tarek Zahraz on 13/03/2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData : Codable {
    let name: String
    let main : Main
    let weather : [Weather]?
    
}
struct Main : Codable {

    let temp : Double
}
struct Weather : Codable {
    
   let id : Int
   let main : String
   let description: String
   let icon : Float
    
    /*
    enum CodingKeys : String , CodingKey {
        case  id          = "id"
        case  main        = "main"
        case  description = "description"
        case  icon        = "icon"
        
        
        
    }
     */
}


