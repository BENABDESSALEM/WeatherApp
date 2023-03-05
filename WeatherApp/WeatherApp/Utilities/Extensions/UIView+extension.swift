//
//  UIView+extension.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 5/3/2023.
//

import Foundation
import UIKit

extension UIView {
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

    func setBackgroundGradient(colors:[CGColor],isVertical:Bool) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.startPoint = isVertical ? CGPoint(x: 0.5, y: 0) : CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = isVertical ? CGPoint(x: 0.5, y: 1) : CGPoint(x: 1, y: 0.5)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at:0)
    }
}
