//
//  UIViewController+extension.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 5/3/2023.
//

import Foundation
import UIKit

extension UIViewController {
    /// Hide keyboard automatically after tapping around.
    ///
    /// Example:
    /// ```
    /// override func viewDidLoad() {
    ///      super.viewDidLoad()
    ///      self.hideKeyboardWhenTappedAround()
    /// }
    ///
    /// ```
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    /// Set gradient of the background .
    ///
    /// Example:
    /// ```
    /// override func viewDidLayoutSubviews() {
    ///      super.viewDidLayoutSubviews()
    ///      self.setGradientBackground()
    /// }
    ///
    /// ```

    func setGradientBackground() {
        let colorTop =  UIColor(red: 0.0/255.0, green: 137.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red:3.0/255.0, green: 36.0/255.0, blue: 128.0/255.0, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
}
