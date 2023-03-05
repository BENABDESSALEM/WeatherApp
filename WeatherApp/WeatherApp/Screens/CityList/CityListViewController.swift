//
//  CityListViewController.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 4/3/2023.
//

import UIKit

class CityListViewController: UIViewController {

    @IBOutlet weak var citiesTableView: UITableView!
    @IBOutlet weak var availableCitiesLabel: UILabel!
    
    let viewModel = CityListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        setupBindings()
        viewModel.getMyCityWeather()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
        viewModel.checkInfoVisibility()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setGradientBackground()
    }
}

// MARK: - Initialisation & setup methods.

extension CityListViewController {
    
    func initViews() {
        citiesTableView.dataSource = self
        citiesTableView.delegate = self
        citiesTableView.register(CityTableViewCell.nib(), forCellReuseIdentifier: CityTableViewCell.cellId)
        citiesTableView.separatorColor = .clear
    }
    
    func setupBindings() {
        citiesTableView.bindTo(viewModel.addedCities)
        availableCitiesLabel.bindTo(viewModel.isListAvailable)
    }
    
    func setupNavBar() {
        self.navigationItem.setHidesBackButton(true, animated: true)
        let addCityBarButtonItem = UIBarButtonItem(title: "Add City", style: .done, target: self, action: #selector(addNewCity))
        self.navigationItem.rightBarButtonItem  = addCityBarButtonItem
        self.navigationItem.rightBarButtonItem?.tintColor = .white
        self.navigationItem.title = "Weather"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white,NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25)]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    @objc func addNewCity(){
        let CityAddVc = AddCityViewController(nibName: "AddCityViewController", bundle: nil)
        self.navigationController!.pushViewController(CityAddVc, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension CityListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return viewModel.addedCities.value.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let city = viewModel.getCity(at: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.cellId, for: indexPath) as! CityTableViewCell
        cell.cityNameLabel.text = city.trackName
        cell.containerView.layer.cornerRadius = 10
        cell.weatherImageView.clipsToBounds = true
        cell.weatherImageView.image = UIImage(named: city.searchResult.weather?.first?.icon ?? "")
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: - UITableViewDelegate

extension CityListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityWeatherVC = CityWeatherDetailsViewController(nibName: "CityWeatherDetailsViewController", bundle: nil)
        cityWeatherVC.viewModel.weather = viewModel.addedCities.value[indexPath.row]
        self.navigationController!.pushViewController(cityWeatherVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
}
