//
//  PayBillsTransactionsViewController.swift
//  Indian Bank
//
//  Created by dhanushkelam on 17/03/21.
//

import UIKit

class PayBillsTransactionsViewController: UIViewController {
    var choice = ""
    @IBOutlet weak var billIdLabel: UILabel!
    
    @IBOutlet weak var billIdTF: UITextField!

    @IBOutlet weak var ElectricityBillLabel: UILabel!
    
    @IBOutlet weak var BroadbandBillLabel: UILabel!
    
    @IBOutlet weak var BillAmount: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var postpaidBillLabel: UILabel!
    
    @IBOutlet weak var DTHBillLabel: UILabel!
    @IBOutlet weak var creditBillLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if choice == "eb"{
            
            ElectricityBillLabel.isHidden = false
            
        }
        else if choice == "bb"{
            
            BroadbandBillLabel.isHidden = false
        }
        else if choice == "pb"{
            
            postpaidBillLabel.isHidden = false
            
        }
        else if choice == "cb"{
            creditBillLabel.isHidden = false
            billIdLabel.isHidden = true
            billIdTF.isHidden = true
        }
        else if choice == "db"{
            DTHBillLabel.isHidden = false
        }
    

        // Do any additional setup after loading the view.
    }
    
    @IBAction func PayBillbtn(_ sender: Any) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
