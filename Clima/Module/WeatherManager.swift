//
//  WeatherManager.swift
//  Clima
//
//  Created by Tarek Zahraz on 10/03/2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation



protocol WeatherManagerDelegate {
    
    func didUapdteWeather( weather : WeatherModule)
    
}

struct WeatherManager {
    
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=88d3b33ca929484a33712d4bd06607b6&units=metric"
    
    var delegate : WeatherManagerDelegate?
    
    func WeatherUser (cityName: String){
        
        let urlString =  ("\(weatherURL)&q=\(cityName)")
        performRequest(urlString: urlString)
        
    }
    
    
    
    func performRequest ( urlString: String){
        
        // Create URL
        if   let Url = URL (string: urlString) {
            
            // create session URL
            
            let session = URLSession(configuration: .default)
            
            
            // Give the session a task
            
            let task = session.dataTask(with: Url) { (data , response , error) in
                
                if  error != nil {
                    print(error!)
                    // self.delegate?.didFailError(error: error!)
                    return
                }
                
                if  let safeDate = data {
                    
                    if  let weather = self.personJSON (weatherData:  safeDate) {
                        
                        self.delegate?.didUapdteWeather(weather:  weather )
                    }
                }
            }
            task.resume()
        }
    }
    
    func personJSON (weatherData : Data) -> WeatherModule? {
        
        let decoder = JSONDecoder()
        
        do {
            
            let decoderData = try decoder.decode(WeatherData.self , from: weatherData)
            let name  = decoderData.name
            let id    = decoderData.weather![0].id
            let temp  = decoderData.main.temp
            
            
            let weather = WeatherModule(conditionId: id, cityName: name, temperature: temp)
            print ( decoderData.weather![0].id)
            return weather
           
        } catch {
            
            print (error)
            return nil
            
        }
    }
    
    
}
