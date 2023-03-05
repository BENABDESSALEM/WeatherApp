//
//  UILabel+extension.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 5/3/2023.
//

import Foundation
import UIKit

extension UILabel {
    
    /// Bind a UILabel in order to hide/show according to our needs
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
    
    /// Set attributed text to the UILabel related to the type of the Main object and its value.
    ///
    /// Example:
    /// ```
    /// windSpeedLabel.setAttributedTextWith(tille: "Wind", subtitle: String(format: "%.0f", speed), unit: "m/h")
    /// ```
    /// - Parameter string:
    func setAttributedTextWith(tille:String,subtitle:String,unit:String) {
        let heading = "\(tille)"
        let content = "\n\n\(subtitle) \(unit)"
        let attributedText = NSMutableAttributedString(string: heading, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)])
        attributedText.append(NSAttributedString(string: content, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.white]))
        self.attributedText = attributedText
    }
}
