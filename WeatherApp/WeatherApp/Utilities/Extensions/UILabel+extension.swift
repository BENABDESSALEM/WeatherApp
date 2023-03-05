//
//  UILabel+extension.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 5/3/2023.
//

import Foundation
import UIKit

extension UILabel {
    
    /// Bind a UILabel in order to hide/show  according to our needs
    ///
    /// Example:
    /// ```
    /// availableCitiesLabel.bindTo(viewModel.isCitiesListAvailable)
    /// ```
    /// - Parameter bindable: the bounded property
    func bindTo(_ bindable: Bindable<Bool>) {
        bindable.bind { [weak self] isAvailable in
            if isAvailable {
                self?.isHidden = true
            } else {
                self?.isHidden = false
            }
        }
    }
}
