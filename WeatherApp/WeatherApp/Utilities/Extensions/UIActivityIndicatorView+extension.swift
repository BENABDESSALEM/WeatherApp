//
//  UIActivityIndicatorView+extension.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 4/3/2023.
//

import Foundation
import UIKit

extension UIActivityIndicatorView {
    
    /// Bind a UIActivityIndicatorView in order to enable/disable  and animate it automatically
    ///
    /// Example:
    /// ```
    /// activityIndicator.bindTo(viewModel.isLoadingEnabled)
    /// ```
    /// - Parameter bindable: the bounded property
    func bindTo(_ bindable: Bindable<Bool>) {
        bindable.bind { [weak self] isEnabled in
            if isEnabled {
                self?.isHidden = false
                self?.startAnimating()
            } else {
                self?.isHidden = true
                self?.stopAnimating()
            }
        }
    }
}
