//
//  NamazTimingViewController.swift
//  Vaniyambadi
//
//  Created by Nouman Pervez on 05/03/20.
//  Copyright © 2020 Nouman Pervez. All rights reserved.
//

import UIKit
import MessageUI

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
    
    fileprivate func sendEmail() {
        
        DispatchQueue.main.async {
            if MFMailComposeViewController.canSendMail() {
                
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients([NamazTimingsConstant.kemailId])
                mail.setMessageBody("<p>Hi!</p>", isHTML: true)
                mail.setSubject("Feedback")
                self.present(mail, animated: true)
            } else {
                
                let alert = UIAlertController(title: AlertConstant.kError, message: AlertConstant.kEmailErrorMessage, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: AlertConstant.kOk, style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
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
            let namazTiming_cell = tableView.dequeueReusableCell(withIdentifier: CellIDConstant.kNamazCellIdentifier, for: indexPath) as! NamazTimingTableViewCell
            namazTiming_cell.setupData(namazTimingList[indexPath.row])
            cell = namazTiming_cell
            break
        case (8):
            let infoCell = tableView.dequeueReusableCell(withIdentifier: CellIDConstant.kInfoCellIdentifier, for: indexPath) as! InfoTableViewCell
            infoCell.info_lable?.text = NamazTimingsConstant.kAppInfo
            cell = infoCell
            break
        case (9):
            let infoCell = tableView.dequeueReusableCell(withIdentifier: CellIDConstant.kInfoCellIdentifier, for: indexPath) as! InfoTableViewCell
            infoCell.info_lable?.text = "Phone: "+NamazTimingsConstant.kPhoneNumber
            cell = infoCell
            break
        case (10):
            let infoCell = tableView.dequeueReusableCell(withIdentifier: CellIDConstant.kInfoCellIdentifier, for: indexPath) as! InfoTableViewCell
            infoCell.info_lable?.text = "Email: "+NamazTimingsConstant.kemailId
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 9:
            UIApplication.shared.open(NSURL(string: "tel://"+NamazTimingsConstant.kPhoneNumber)! as URL, options: [:], completionHandler: nil)
            break
        case 10:
            sendEmail()
            break
        default:
            break
        }
    }
}

extension NamazTimingViewController: MFMailComposeViewControllerDelegate {
    
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
