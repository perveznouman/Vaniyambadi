//
//  NamazTimingViewController.swift
//  Vaniyambadi
//
//  Created by Nouman Pervez on 05/03/20.
//  Copyright © 2020 Nouman Pervez. All rights reserved.
//

import UIKit

class NamazTimingViewController: BaseViewController {

    var namazTimingList = [NamazTimings]()
    @IBOutlet weak var namazTimings_tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let n1 = NamazTimings("سحور‎", "5:01am")
        let n2 = NamazTimings("صبح", "5:11am")
        let n3 = NamazTimings("طلوع آفتاب", "6:30am")
        let n4 = NamazTimings("زوال", "12:27pm")
        let n5 = NamazTimings("عصر", "4:45pm")
        let n6 = NamazTimings("إفطار‎", "6:25pm")
        let n7 = NamazTimings("مغرب", "6:25pm")
        let n8 = NamazTimings("عشاء", "7:43pm")
        namazTimingList.append(contentsOf: [n1, n2, n3, n4, n5, n6, n7, n8])
        namazTimings_tableView.dataSource = self
        namazTimings_tableView.delegate = self
        
        namazTimings_tableView.rowHeight = UITableView.automaticDimension
        namazTimings_tableView.estimatedRowHeight = 44

    }
}

extension NamazTimingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        namazTimingList.count + 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: BaseTableViewCell?
        switch indexPath.row {
        case (0...7):
            let namazTiming_cell = tableView.dequeueReusableCell(withIdentifier: CellConstant.kNamazCellIdentifier, for: indexPath) as! NamazTimingTableViewCell
            namazTiming_cell.setupData(namazTimingList[indexPath.row])
            cell = namazTiming_cell
            break
        case (8):
            let infoCell = tableView.dequeueReusableCell(withIdentifier: CellConstant.kInfoCellIdentifier, for: indexPath) as! InfoTableViewCell
            infoCell.info_lable?.text = "Vaniymabadi App is design to provide town updtes. Please feel free to reach us to provide updates and report errors."
            cell = infoCell
            break
        case (9):
            let infoCell = tableView.dequeueReusableCell(withIdentifier: CellConstant.kInfoCellIdentifier, for: indexPath) as! InfoTableViewCell
            infoCell.info_lable?.text = "Phone: 9487893137"
            cell = infoCell
            break
        case (10):
            let infoCell = tableView.dequeueReusableCell(withIdentifier: CellConstant.kInfoCellIdentifier, for: indexPath) as! InfoTableViewCell
            infoCell.info_lable?.text = "contact@theadvotis.com"
            cell = infoCell
            break
        default:
            break
        }
        return cell!

    }
}

extension NamazTimingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        switch indexPath.row {
        case (0...7):
            return 45
        default:
            return UITableView.automaticDimension
        }
    }
}
