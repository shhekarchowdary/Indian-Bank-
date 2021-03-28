

import UIKit

class PayBillsTransactionsViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate{
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return customer?.accounts.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return customer?.accounts[row]?.type
    }
    

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
                accountSelected1 = row
    }
    
    var choice = ""
    var billType = 0
    var customer:Customer?
    var accountSelected1 = 0
    
    
    @IBOutlet weak var enterBillStack: UIStackView!
    @IBOutlet weak var billIdLabel: UILabel!
    @IBOutlet weak var billIdTF: UITextField!
    
    @IBOutlet weak var showBillStack: UIStackView!
    @IBOutlet weak var billTypeLabel: UILabel!
    @IBOutlet weak var billAmountLabel: UILabel!
    
    @IBOutlet weak var successImage: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var currentBalanceLabel: UILabel!
    @IBOutlet weak var transactionIdLabel: UILabel!
    
    @IBOutlet weak var accountPicker: UIPickerView!
    @IBOutlet weak var getBillButton: UIButton!
    @IBOutlet weak var payBillButton: UIButton!
    
    @IBOutlet weak var header: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        billIdTF.delegate = self
        messageLabel.text = ""
        
        accountPicker.delegate = self
        accountPicker.dataSource = self
        
        messageLabel.text = ""
        currentBalanceLabel.text = ""
        transactionIdLabel.text = ""
        if choice == "eb"{
            billType = 1
            header.text = "Electricity Bill"
            billTypeLabel.text = "Your Electricity Bill is:"
            if (customer?.accounts.count)! >= 1{
                accountSelected1 = 0
            }
        }
        else if choice == "bb"{
            billType = 2
            header.text = "Broadband Bill"
            billTypeLabel.text = "Your Broadband Bill is:"
            if (customer?.accounts.count)! >= 1{
                accountSelected1 = 0
            }
        }
        else if choice == "pb"{
            billType = 3
            header.text = "Postpaid Bill"
            billTypeLabel.text = "Your Postpaid Bill is:"
            if (customer?.accounts.count)! >= 1{
                accountSelected1 = 0
            }
        }
        else if choice == "cb"{
            billType = 4
            header.text = "Credit Card Bill"
            enterBillStack.isHidden = true
            billTypeLabel.text = "Your Credit Card Bill is:"
            if (customer?.accounts.count)! >= 1{
                accountSelected1 = 0
            }
        }
        else if choice == "db"{
            billType = 5
            header.text = "DTH Bill"
            billTypeLabel.text = "Your DTH Bill is:"
            if (customer?.accounts.count)! >= 1{
                accountSelected1 = 0
            }
        }
    
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacters = "1234567890"
        let allowedCharcterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharcterSet = CharacterSet(charactersIn: string)
        return allowedCharcterSet.isSuperset(of: typedCharcterSet)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getBillButtonPressed(_ sender: Any) {
        if billType != 4{
            if billIdTF.text != ""{
                let billAmount = customer?.getBillAmount(billType: billType)
                billAmountLabel.text = String(format: "%.2f",billAmount!)
                messageLabel.text = ""
                showBillStack.isHidden = false
                accountPicker.isHidden = false
                payBillButton.isHidden = false
            }else{
                messageLabel.text = "Please Enter Bill ID"
                messageLabel.textColor = .systemRed
            }
        }else{
            let billAmount = customer?.getBillAmount(billType: billType)
            billAmountLabel.text = String(format: "%.2f",billAmount!)
            showBillStack.isHidden = false
            accountPicker.isHidden = false
            payBillButton.isHidden = false
        }
        
    }
    
    
    @IBAction func payBillButtonPressed(_ sender: Any) {
        let billAmount = Double(billAmountLabel.text!)
        var currentBalance = (customer?.accounts[accountSelected1]?.currentBalance)!
        if customer?.accounts[accountSelected1]?.withDraw(amount: billAmount!) == true {
            let transactionId = (Int.random(in: 11111..<99999))
            currentBalance = (customer?.accounts[accountSelected1]?.currentBalance)!
            enterBillStack.isHidden = true
            showBillStack.isHidden = true
            accountPicker.isHidden = true
            getBillButton.isHidden = true
            payBillButton.isHidden = true
            successImage.isHidden = false
            
            messageLabel.text = "Bill Payment Successful)"
            currentBalanceLabel.text = "Current Balance: \(currentBalance)"
            transactionIdLabel.text = "Bill Payment Reference Id: \(transactionId) "
            messageLabel.textColor = #colorLiteral(red: 0.06274509804, green: 0.7803921569, blue: 0.8666666667, alpha: 1)
            transactionIdLabel.textColor = #colorLiteral(red: 0.06274509804, green: 0.7803921569, blue: 0.8666666667, alpha: 1)
            currentBalanceLabel.textColor = #colorLiteral(red: 0.4488811493, green: 0.5629473925, blue: 0.6145939231, alpha: 1)
            
        }else{
            messageLabel.text = "Insufficient Balance: \(currentBalance)"
            messageLabel.textColor = .systemRed
           
        }
    }
    


}
