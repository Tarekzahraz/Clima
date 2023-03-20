//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController  , UITextFieldDelegate  , WeatherManagerDelegate {
    
    
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        weatherManager.delegate = self
        
        searchTextField.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: #selector( dismissKeyboard))
        view.addGestureRecognizer(tap)
        dismissKeyboard()
        
        
    }
    
    
    @IBAction func searckPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let City = searchTextField.text {
            
            weatherManager.WeatherUser(cityName: City)
        }
        searchTextField.text = " "
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
            
        } else {
            textField.placeholder = "Type something pls "
            return false
        }
    }
    func didUapdteWeather(weather: WeatherModule) {
        print( weather.temperature )
    }
    
}

