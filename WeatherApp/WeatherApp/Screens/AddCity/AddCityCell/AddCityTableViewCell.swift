//
//  AddCityTableViewCell.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 4/3/2023.
//

import UIKit

class AddCityTableViewCell: UITableViewCell {

    static let cellId = String(describing: AddCityTableViewCell.self)
    static func nib() -> UINib { return UINib(nibName: cellId, bundle: nil) }
    
    @IBOutlet weak var cityName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
