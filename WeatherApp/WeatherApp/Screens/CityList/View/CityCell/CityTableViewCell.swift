//
//  CityTableViewCell.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 4/3/2023.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    static let cellId = String(describing: CityTableViewCell.self)
    static func nib() -> UINib { return UINib(nibName: cellId, bundle: nil) }
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var weatherImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
