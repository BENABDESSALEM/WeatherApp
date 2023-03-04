//
//  AddCityViewController.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 4/3/2023.
//

import UIKit

class AddCityViewController: UIViewController {

    @IBOutlet weak var addCityTableView: UITableView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let viewModel = AddCityViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        setupBindings()
    }
    
    // MARK: IBActions.
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        viewModel.searchText = searchTextField.text
        viewModel.performSearch()
    }
}

// MARK: - Initialisation & setup methods.

extension AddCityViewController {
    func initViews() {
        addCityTableView.dataSource = self
        addCityTableView.delegate = self
        addCityTableView.register(AddCityTableViewCell.nib(), forCellReuseIdentifier: AddCityTableViewCell.cellId)
        addCityTableView.separatorColor = .clear
    }
    
    func setupBindings() {
        addCityTableView.bindTo(viewModel.results)
        searchButton.bindTo(viewModel.isButtonEnabled)
        activityIndicator.bindTo(viewModel.isLoadingEnabled)
    }
}

// MARK: - UITableViewDataSource.

extension AddCityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
          return viewModel.results.value.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let item = viewModel.getSearchResultVM(at: indexPath.row)
            let cell = tableView.dequeueReusableCell(withIdentifier: AddCityTableViewCell.cellId, for: indexPath) as! AddCityTableViewCell
            cell.cityName.text = item.trackName
            cell.selectionStyle = .none
            return cell
    }
}

// MARK: - UITableViewDelegate.

extension AddCityViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
