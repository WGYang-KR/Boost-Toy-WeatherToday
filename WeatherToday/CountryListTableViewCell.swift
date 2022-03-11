//
//  CountryListTableViewCell.swift
//  WeatherToday
//
//  Created by WG Yang on 2022/03/11.
//

import UIKit

class CountryListTableViewCell: UITableViewCell {

    @IBOutlet var flagImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    var korean_name: String?
    var asset_name: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
