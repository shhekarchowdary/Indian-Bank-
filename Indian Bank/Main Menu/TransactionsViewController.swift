//
//  TransactionsViewController.swift
//  Indian Bank
//
//  Created by dhanushkelam on 16/03/21.
//

import UIKit

class TransactionsViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //this fucntion determines the number of rows in the pickerView

    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        //when we have more than 1 pickerview we should use if to know which one we are talking about

        if pickerView == accounttypePV{
            return accounttypes.count
        }
        else{
            return accounttypes.count
        }
    }
    
    //this function to fill the picker view of items from the required array

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == accounttypePV{
            return accounttypes[row]
        }
        else{
            return accounttypes[row]
        }
    }
    
    //this functions to do the action when the user picks any row in the pickerView

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == accounttypePV{
            
            
       }
        
       
        else {
            
            
        }
    }
        var operations = ""
    
    var accounttypes = ["Savings Account","SavingsPro Account","Salary Account"]

    @IBOutlet weak var accounttypePV: UIPickerView!
    @IBOutlet weak var ToAccountPV: UIPickerView!
  
    @IBOutlet weak var balanceLabel: UILabel!
    
    @IBOutlet weak var balanceMoneyLabel: UILabel!
    
    @IBOutlet weak var withdrawLabel: UILabel!
    
    @IBOutlet weak var withdrawAmountTF: UITextField!
    @IBOutlet weak var withdrawbtn: UIButton!
    @IBOutlet weak var depositbtn: UIButton!
    
    @IBOutlet weak var transferLabel: UILabel!
    @IBOutlet weak var transferAmountTF: UITextField!
    @IBOutlet weak var transferbtn: UIButton!
    @IBOutlet weak var FromAccountLabel: UILabel!
    @IBOutlet weak var MsgForWithdraw: UILabel!
    
    
    
    @IBOutlet weak var MsgForTransfer: UILabel!
    @IBOutlet weak var ToAccountLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        accounttypePV.delegate = self
        accounttypePV.dataSource = self
        
        ToAccountPV.delegate = self
        ToAccountPV.dataSource = self
        
        if operations == "cb"{
            balanceLabel.isHidden = false
            balanceMoneyLabel.isHidden = false
            print("Cb")
            
        }
        else if operations == "wd" {
            withdrawLabel.isHidden = false
            withdrawAmountTF.isHidden = false
            withdrawbtn.isHidden = false
            //withdrawacountTF(Text Field)
            //MsgForWithdraw
            print("wd")

        }
        else if operations == "dm"{
            withdrawLabel.isHidden = false
            withdrawAmountTF.isHidden = false
            depositbtn.isHidden = false

        }
        
        else if operations == "tm"{
            FromAccountLabel.isHidden = false
            ToAccountLabel.isHidden = false
            ToAccountPV.isHidden = false
            transferLabel.isHidden = false
            transferAmountTF.isHidden = false
            transferbtn.isHidden = false
            //TransferAmountTF
            //MsgForTransfer
            
            
        }

        // Do any additional setup after loading the view.
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
