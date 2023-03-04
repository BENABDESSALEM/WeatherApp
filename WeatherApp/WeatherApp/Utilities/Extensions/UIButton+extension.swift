//
//  UIButton+extension.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 4/3/2023.
//

import Foundation
import UIKit

extension UIButton {
    
    /// Bind a UIButton in order to enable/disable it automatically
    ///
    /// Example:
    /// ```
    /// btnSearch.bindTo(viewModel.isButtonEnabled)
    /// ```
    /// - Parameter bindable: the bounded property
    func bindTo(_ bindable: Bindable<Bool>) {
        bindable.bind { [weak self] isEnabled in
            self?.isEnabled = true
        }
    }
}
