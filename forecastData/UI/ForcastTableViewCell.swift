//
//  ForcastTableViewCell.swift
//  forecastData
//
//  Created by Sorasak on 12/16/19.
//  Copyright © 2019 Dol2oMo. All rights reserved.
//

import UIKit

class ForcastTableViewCell: UITableViewCell {
    
    @IBOutlet weak var forcastWetherTitle: UILabel!
    @IBOutlet weak var forcastWetherDetail: UILabel!
    @IBOutlet weak var forcastWetherSpeed: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func settingTextWith(data: ForcastModels.WeatherDetail, speed: Float) {
    
        forcastWetherTitle.text = "Weather: \(data.main)"
        forcastWetherDetail.text = "Weather Detail: \(data.description)"
        forcastWetherSpeed.text = "Wind speed: \(speed)"
    }

}
