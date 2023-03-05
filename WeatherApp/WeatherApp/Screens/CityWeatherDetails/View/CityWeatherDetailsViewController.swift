//
//  CityWeatherDetailsViewController.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 4/3/2023.
//

import UIKit

class CityWeatherDetailsViewController: UIViewController {

    @IBOutlet weak var weatherDescLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var feelLikeLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    
    let viewModel = CityWeatherDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setGradientBackground()
    }
    
    // MARK: SetUpView
    
    func initViews() {
        cityNameLabel.text = viewModel.weather?.name
        weatherDescLabel.text = viewModel.weather?.weather?.first?.description
        weatherImageView.image = UIImage(named: viewModel.weather?.weather?.first?.icon ?? "")
        if let tempValue = viewModel.weather?.main?.temp {
            let celsiusValue = viewModel.toCelsius(kelvin: tempValue)
            tempLabel.text =  String(format: "%.0f °C", celsiusValue)
        }
        if let speed = viewModel.weather?.wind?.speed {
            windSpeedLabel.setAttributedTextWith(tille: "Wind", subtitle: String(format: "%.0f", speed), unit: "m/h")
        }
        if let feelLikeValue = viewModel.weather?.main?.feelLike {
            let celsiusValue = viewModel.toCelsius(kelvin: feelLikeValue)
            feelLikeLabel.setAttributedTextWith(tille: "Feel like", subtitle: String(format: "%.0f °C", celsiusValue), unit: "")
        }
        if let pressureValue = viewModel.weather?.main?.pressure {
            pressureLabel.setAttributedTextWith(tille: "Pressure", subtitle: "\( pressureValue)", unit: "mbar")
        }
        if let humidityValue = viewModel.weather?.main?.humidity {
            humidityLabel.setAttributedTextWith(tille: "Humidity", subtitle: "\( humidityValue)", unit: "%")
        }
    }
}