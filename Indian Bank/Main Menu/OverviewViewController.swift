//
//  OverviewViewController.swift
//  Indian Bank
//
//  Created by SOMA SEKHAR ANAPARTHI on 27/03/21.
//

import UIKit

class OverviewViewController: UIViewController {
    
    @IBOutlet weak var cin: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var fatherName: UILabel!
    @IBOutlet weak var dob: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var eMailid: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var aadhar: UILabel!
    @IBOutlet weak var panNumber: UILabel!
    
    @IBOutlet weak var combinedStack: UIStackView!
    @IBOutlet weak var combinedBalance: UILabel!
    
    @IBOutlet weak var account1Stack: UIStackView!
    @IBOutlet weak var account1Type: UILabel!
    @IBOutlet weak var account1Number: UILabel!
    @IBOutlet weak var account1Balance: UILabel!
    
    @IBOutlet weak var account2Stack: UIStackView!
    @IBOutlet weak var account2Type: UILabel!
    @IBOutlet weak var account2Number: UILabel!
    @IBOutlet weak var account2Balance: UILabel!

    @IBOutlet weak var account3Stack: UIStackView!
    @IBOutlet weak var account3Type: UILabel!
    @IBOutlet weak var account3Number: UILabel!
    @IBOutlet weak var account3Balance: UILabel!
    
    
    var customer:Customer?

    override func viewDidLoad() {
        super.viewDidLoad()
        showCustomerData()
        showCombinedBalance()
        showAccountsData()
    }
    
    func showCustomerData(){
        cin.text = customer?.cin
        name.text = customer?.fullName
        fatherName.text = customer?.fatherName
        dob.text = customer?.dob
        phoneNumber.text = String(customer?.phoneNumber ?? 9999999999)
        eMailid.text = customer?.emailId
        address.text = customer?.address
        aadhar.text = customer?.aadharNumber
        panNumber.text = customer?.panNumber
    }
    
    func showCombinedBalance(){
        var combiBalance = 0.0
        for account in (customer?.accounts)!{
            combiBalance += account!.currentBalance
        }
        combinedBalance.text = String(format: "%.2f", combiBalance)
    }
    
    func showAccountsData(){
        let numberofAccounts = customer?.accounts.count
        
        if numberofAccounts == 1{
            account1Type.text = customer?.accounts[0]?.type
            account1Number.text = customer?.accounts[0]?.accountNo
            account1Balance.text = String((customer?.accounts[0]?.currentBalance)!)
            account2Stack.isHidden = true
            account3Stack.isHidden = true
        }else if numberofAccounts == 2{
            account1Type.text = customer?.accounts[0]?.type
            account1Number.text = customer?.accounts[0]?.accountNo
            account1Balance.text = String((customer?.accounts[0]?.currentBalance)!)
            account2Type.text = customer?.accounts[1]?.type
            account2Number.text = customer?.accounts[1]?.accountNo
            account2Balance.text = String((customer?.accounts[1]?.currentBalance)!)
            account3Stack.isHidden = true
        }else{
            account1Type.text = customer?.accounts[0]?.type
            account1Number.text = customer?.accounts[0]?.accountNo
            account1Balance.text = String((customer?.accounts[0]?.currentBalance)!)
            account2Type.text = customer?.accounts[1]?.type
            account2Number.text = customer?.accounts[1]?.accountNo
            account2Balance.text = String((customer?.accounts[1]?.currentBalance)!)
            account3Type.text = customer?.accounts[2]?.type
            account3Number.text = customer?.accounts[2]?.accountNo
            account3Balance.text = String((customer?.accounts[2]?.currentBalance)!)
        }
    }

}
