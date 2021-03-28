

import UIKit

class TransactionsViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource, UITextFieldDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == accounttypePV{
            return customer?.accounts.count ?? 0
        }
        else{
            return customer?.accounts.count ?? 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == accounttypePV{
            return customer?.accounts[row]?.type
        }
        else{
            return customer?.accounts[row]?.type
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == accounttypePV{
            if operations == "cb"{
                balanceMoneyLabel.text = String(customer?.accounts[row]?.currentBalance ?? 0.0)
            }else if operations == "wd" || operations == "dm" || operations == "tm" {
                accountSelected1 = row
            }
       }
        else {
            if operations == "tm"{
                accountSelected2 = row
            }
        }
    }
    
    var operations = ""
    var customer:Customer?
    var customers = [Customer]()
    var accountSelected1 = 0
    var accountSelected2 = 0
    var toCustomer:Customer?
    var toAccount:Int?
    

    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var getAccountStack: UIStackView!
    @IBOutlet weak var accounttypePV: UIPickerView!
    @IBOutlet weak var accountNumber: UITextField!
    @IBOutlet weak var ToAccountPV: UIPickerView!
  
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var balanceMoneyLabel: UILabel!
    
    @IBOutlet weak var withdrawbtn: UIButton!
    @IBOutlet weak var depositbtn: UIButton!
    @IBOutlet weak var transferbtn: UIButton!

    
    @IBOutlet weak var FromAccountLabel: UILabel!
    @IBOutlet weak var messageTransactions: UILabel!
    @IBOutlet weak var referenceId: UILabel!
    @IBOutlet weak var ToAccountLabel: UILabel!
    @IBOutlet weak var customerData: UITextView!
    
    @IBOutlet weak var enterAmountView: UIStackView!
    @IBOutlet weak var amountEntered: UITextField!
    @IBOutlet weak var transImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageTransactions.text = ""
        referenceId.text = ""
        
        amountEntered.delegate = self
        accountNumber.delegate = self
        
        accounttypePV.delegate = self
        accounttypePV.dataSource = self
        
        ToAccountPV.delegate = self
        ToAccountPV.dataSource = self
        
        if operations == "cb"{
            header.text = "Check Balance"
            FromAccountLabel.isHidden = false
            accounttypePV.isHidden = false
            balanceLabel.isHidden = false
            balanceMoneyLabel.isHidden = false
            print("Cb")
            if (customer?.accounts.count)! >= 1{
                balanceMoneyLabel.text = String(customer?.accounts[0]?.currentBalance ?? 0.0)
            }
            
        }
        else if operations == "wd" {
            header.text = "WithDrawal"
            FromAccountLabel.isHidden = false
            accounttypePV.isHidden = false
            enterAmountView.isHidden = false
            withdrawbtn.isHidden = false
            print("wd")
            if (customer?.accounts.count)! >= 1{
                accountSelected1 = 0
            }

        }
        else if operations == "dm"{
            header.text = "Deposit"
            FromAccountLabel.isHidden = false
            accounttypePV.isHidden = false
            enterAmountView.isHidden = false
            depositbtn.isHidden = false
            if (customer?.accounts.count)! >= 1{
                accountSelected1 = 0
            }
        }
        
        else if operations == "tm"{
            header.text = "Transfer"
            FromAccountLabel.text = "Select From Account"
            FromAccountLabel.isHidden = false
            accounttypePV.isHidden = false
            ToAccountLabel.isHidden = false
            ToAccountPV.isHidden = false
            enterAmountView.isHidden = false
            transferbtn.isHidden = false
            if (customer?.accounts.count)! >= 1{
                accountSelected1 = 0
                accountSelected2 = 0
            }
        }else if operations == "tmo"{
            header.text = "Transfer to Others"
            getAccountStack.isHidden = false
            
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
    
    
    func checkAmountFeild() -> Bool{
        if amountEntered.text == ""{
            messageTransactions.text = "Please Enter Amount"
            messageTransactions.textColor = .systemRed
            return false
        }
        return true
    }
    
    @IBAction func getAccountDetailsPressed(_ sender: Any) {
        if accountNumber.text != ""{
            let gAccountNumber = accountNumber.text!
            var rep = 1
            var found = 0
            for cus in customers{
                if rep == 1{
                    if cus.accounts.count >= 1{
                        for i in 0...cus.accounts.count-1{
                            if cus.accounts[i]?.accountNo == gAccountNumber{
                                let cData = """
                                Account Holder Name: \(cus.fullName)
                                Mobile Number: \(cus.phoneNumber)
                                """
                                toCustomer = cus
                                toAccount = i
                                getAccountStack.isHidden = true
                                customerData.text = cData
                                customerData.isHidden = false
                                FromAccountLabel.isHidden = false
                                accounttypePV.isHidden = false
                                enterAmountView.isHidden = false
                                transferbtn.isHidden = false
                                rep = 0
                                found = 1
                                break
                            }
                        }
                    }
                }
            }
            if found == 1{
                messageTransactions.text = "No Account Found for Given Details"
                messageTransactions.textColor = .systemRed
            }
        }else{
            messageTransactions.text = "Please Enter Account Number"
            messageTransactions.textColor = .systemRed
        }
    }
    
    
    
    @IBAction func withDrawButtonPressed(_ sender: Any) {
        if checkAmountFeild() {
            let amount = Double(amountEntered.text!)!
            var currentBalance = (customer?.accounts[accountSelected1]?.currentBalance)!
            let withDrawlLimit  = (customer?.accounts[accountSelected1]?.maxWithdrawal)!
            if amount <= withDrawlLimit{
                if customer?.accounts[accountSelected1]?.withDraw(amount: amount) == true {
                    let transactionId = (Int.random(in: 11111..<99999))
                    currentBalance = (customer?.accounts[accountSelected1]?.currentBalance)!
                    FromAccountLabel.isHidden = true
                    accounttypePV.isHidden = true
                    enterAmountView.isHidden = true
                    withdrawbtn.isHidden = true
                    transImage.isHidden = false
                    messageTransactions.text = "Withdrawl Successful - Balance: \(currentBalance)"
                    messageTransactions.textColor = #colorLiteral(red: 0.06274509804, green: 0.7803921569, blue: 0.8666666667, alpha: 1)
                    referenceId.text = "Transaction Id: \(transactionId)"
                    referenceId.textColor = #colorLiteral(red: 0.06274509804, green: 0.7803921569, blue: 0.8666666667, alpha: 1)
                    
                }else{
                    messageTransactions.text = "Insufficient Balance: \(currentBalance)"
                    messageTransactions.textColor = .systemRed
                   
                }
            }else{
                messageTransactions.text = "Amount greater than WithDrawl Limit: \(withDrawlLimit)"
                messageTransactions.textColor = .systemRed
            }
        }
    }
    
    
    @IBAction func depositButtonPressed(_ sender: Any) {
        if checkAmountFeild(){
            let amount = Double(amountEntered.text!)!
            var currentBalance = (customer?.accounts[accountSelected1]?.currentBalance)!
            if customer?.accounts[accountSelected1]?.deposit(amount: amount) == true {
                let transactionId = (Int.random(in: 11111..<99999))
                currentBalance = (customer?.accounts[accountSelected1]?.currentBalance)!
                FromAccountLabel.isHidden = true
                accounttypePV.isHidden = true
                enterAmountView.isHidden = true
                depositbtn.isHidden = true
                transImage.isHidden = false
                messageTransactions.text = "Deposit Successful - Balance: \(currentBalance)"
                messageTransactions.textColor = #colorLiteral(red: 0.06274509804, green: 0.7803921569, blue: 0.8666666667, alpha: 1)
                referenceId.text = "Transaction Id: \(transactionId)"
                referenceId.textColor = #colorLiteral(red: 0.06274509804, green: 0.7803921569, blue: 0.8666666667, alpha: 1)
            }else{
                let depositLimit = (customer?.accounts[accountSelected1]?.maxDeposit)!
                messageTransactions.text = "Amount greater than Deposit Limit: \(depositLimit)"
                messageTransactions.textColor = .systemRed
            }
        }
    }
    
    
    @IBAction func transferButtonPressed(_ sender: Any) {
        if operations == "tm"{
            if accountSelected1 != accountSelected2{
                if checkAmountFeild(){
                    let amount = Double(amountEntered.text!)!
                    var currentBalance = (customer?.accounts[accountSelected1]?.currentBalance)!
                    if customer?.transfermoney(from: accountSelected1, to: accountSelected2, amount: amount) == true{
                        let transactionId = (Int.random(in: 11111..<99999))
                        currentBalance = (customer?.accounts[accountSelected1]?.currentBalance)!
                        customerData.isHidden = false
                        FromAccountLabel.isHidden = true
                        accounttypePV.isHidden = true
                        enterAmountView.isHidden = true
                        transferbtn.isHidden = true
                        transImage.isHidden = false
                        messageTransactions.text = "Tranfer Successful"
                        messageTransactions.textColor = #colorLiteral(red: 0.06274509804, green: 0.7803921569, blue: 0.8666666667, alpha: 1)
                        referenceId.text = "Transaction Id: \(transactionId)"
                        referenceId.textColor = #colorLiteral(red: 0.06274509804, green: 0.7803921569, blue: 0.8666666667, alpha: 1)
                        
                    }else{
                        messageTransactions.text = "Insufficient Balance in From Account: \(currentBalance)"
                        messageTransactions.textColor = .systemRed
                    }
                }
            }else {
                messageTransactions.text = "From and To Accounts are Same"
                messageTransactions.textColor = .systemRed
            }
        }else if operations == "tmo"{
            if checkAmountFeild(){
                let amount = Double(amountEntered.text!)!
                var currentBalance = (customer?.accounts[accountSelected1]?.currentBalance)!
                if customer?.accounts[accountSelected1]?.withDraw(amount: amount) == true{
                    toCustomer?.accounts[toAccount!]?.currentBalance += amount
                    let transactionId = (Int.random(in: 11111..<99999))
                    currentBalance = (customer?.accounts[accountSelected1]?.currentBalance)!
                    customerData.isHidden = true
                    FromAccountLabel.isHidden = true
                    accounttypePV.isHidden = true
                    ToAccountLabel.isHidden = true
                    ToAccountPV.isHidden = true
                    enterAmountView.isHidden = true
                    transferbtn.isHidden = true
                    transImage.isHidden = false
                    messageTransactions.text = "Tranfer Successful -Account Balance: \(currentBalance)"
                    messageTransactions.textColor = #colorLiteral(red: 0.06274509804, green: 0.7803921569, blue: 0.8666666667, alpha: 1)
                    referenceId.text = "Transaction Id: \(transactionId)"
                    referenceId.textColor = #colorLiteral(red: 0.06274509804, green: 0.7803921569, blue: 0.8666666667, alpha: 1)
                    
                }else{
                    messageTransactions.text = "Insufficient Balance in From Account: \(currentBalance)"
                    messageTransactions.textColor = .systemRed
                }
            }
        }
        
    }

}
