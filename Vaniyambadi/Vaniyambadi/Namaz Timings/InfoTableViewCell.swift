//
//  InfoTableViewCell.swift
//  Vaniyambadi
//
//  Created by Nouman Pervez on 05/03/20.
//  Copyright © 2020 Nouman Pervez. All rights reserved.
//

import UIKit

class InfoTableViewCell: BaseTableViewCell {

    @IBOutlet weak var info_lable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
