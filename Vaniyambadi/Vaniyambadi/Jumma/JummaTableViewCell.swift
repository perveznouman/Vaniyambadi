//
//  JummaTableViewCell.swift
//  Vaniyambadi
//
//  Created by Nouman Pervez on 04/03/20.
//  Copyright © 2020 Nouman Pervez. All rights reserved.
//

import UIKit

class JummaTableViewCell: BaseTableViewCell {

    @IBOutlet weak var mosque_lable: UILabel!
    @IBOutlet weak var area_lable: UILabel!
    @IBOutlet weak var time_lable: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func setupData (_ jumma: Jumma, forIndex index: Int) -> Void {
        
        mosque_lable.text = jumma.mosque
        area_lable.text = jumma.area
        time_lable.text = jumma.time
        setBackgroundColor(for: index)
    }
    
    private func setBackgroundColor (for index: Int) -> Void {
        
        DispatchQueue.main.async {
            self.mosque_lable.backgroundColor = UIColor.clear
            self.area_lable.backgroundColor = UIColor.clear
            self.time_lable.backgroundColor = UIColor.clear

            if index % 2 == 0 {
                self.backgroundColor = UIColor.lightGray
            }
            else {
                self.backgroundColor = UIColor.white
            }
        }
    }
}
