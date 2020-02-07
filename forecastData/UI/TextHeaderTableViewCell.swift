//
//  SubSansiriTextHeaderTableViewCell.swift
//  Sansiri
//
//  Created by Dol2oMo on 3/16/18.
//  Copyright © 2018 Dol2oMo. All rights reserved.
//

import UIKit

class TextHeaderTableViewCell: UITableViewHeaderFooterView {

    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.title.text = ""
    }

    open func setData(data: String) {
        self.title.text = data
    }
    
}
