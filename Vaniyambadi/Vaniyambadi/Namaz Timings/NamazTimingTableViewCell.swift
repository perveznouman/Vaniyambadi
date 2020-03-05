//
//  NamazTimingTableViewCell.swift
//  Vaniyambadi
//
//  Created by Nouman Pervez on 05/03/20.
//  Copyright © 2020 Nouman Pervez. All rights reserved.
//

import UIKit

class NamazTimingTableViewCell: BaseTableViewCell {

    @IBOutlet weak var time_lable: UILabel!
    @IBOutlet weak var namaz_lable: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func setupData (_ namaz: NamazTimings) -> Void {
          
          namaz_lable.text = namaz.namaz
          time_lable.text = namaz.time
      }

}
