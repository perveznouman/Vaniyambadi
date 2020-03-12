//
//  JummaViewController.swift
//  Vaniyambadi
//
//  Created by Nouman Pervez on 04/03/20.
//  Copyright © 2020 Nouman Pervez. All rights reserved.
//

import UIKit

class JummaViewController: BaseViewController {
    
    @IBOutlet weak var jumma_tableView: UITableView!
    fileprivate var jummaList = [Jumma]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let j1 = Jumma(mosque: "Namaz Gah", area: "CL road", time: "-")
        let j2 = Jumma(mosque: "Masjid-e-Tottipatra", area: "Muslimpur", time: "01:00")
        let j3 = Jumma(mosque: "Masjid-e-Zaib", area: "Maduranada Nagar", time: "-")
        jummaList.append(contentsOf: [j1, j2, j3, j1, j2, j3, j1, j2, j3, j1, j2, j3, j1, j2, j3, j1, j2, j3, j1, j2, j3, j1, j2, j3, j1, j2, j3, j1, j2, j3])
        jumma_tableView.dataSource = self
        jumma_tableView.delegate = self
        
        let headerNib = UINib.init(nibName: "JummaHeaderView", bundle: Bundle.main)
        jumma_tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "JummaHeaderView")

    }
}

extension JummaViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jummaList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIDConstant.kJummanCellIdentifier, for: indexPath) as! JummaTableViewCell
        cell.setupData(jummaList[indexPath.row], forIndex: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
}

extension JummaViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "JummaHeaderView") as! JummaHeaderView
        return headerView
    }
}

