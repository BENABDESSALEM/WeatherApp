//
//  UITableView+extension.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 4/3/2023.
//

import Foundation
import UIKit

extension UITableView {
    
    /// Bind a UITableView in order to reload it automatically once the datasource array mutates
    ///
    /// Example:
    /// ```
    /// tableView.bindTo(viewModel.results)
    /// ```
    /// - Parameter bindable: the bounded property
    func bindTo<T>(_ bindable: Bindable<T>) {
        bindable.bind { [weak self] _ in
            self?.reloadData()
        }
    }
}
