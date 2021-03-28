

import UIKit

class AccountCreationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate
{
    @IBOutlet weak var pickerViewButton: UIButton!
    @IBOutlet weak var savingsProView: UIView!
    @IBOutlet weak var salaryView: UIView!
    @IBOutlet weak var savingsView: UIView!
    @IBOutlet weak var accountdetails: UIImageView!
    
    
    @IBOutlet weak var savingsIntial: UITextField!
    @IBOutlet weak var savingsProInitial: UITextField!
    
    @IBOutlet weak var company: UITextField!
    @IBOutlet weak var customerEmployeeId: UITextField!
    @IBOutlet weak var salaryInitial: UITextField!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var accountData: UITextView!
    
    var customers = [Customer]()
    var customer:Customer?
    var messagetxt:String? = nil
    var accountCount:Int?
    var cinCount:Int? = nil
    
    let screenWidth = UIScreen.main.bounds.width - 30
    let screenHeight = UIScreen.main.bounds.height / 3
    var selectedRow = 0
    
    var accountTypes = ["Savings Account","Savings Pro Account","Salary Account"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        savingsIntial.delegate = self
        savingsProInitial.delegate = self
        salaryInitial.delegate = self
        
        
        print("Account Creation: \(accountCount ?? 0)")
        
        setAccountTypes()
        
        message.text = messagetxt
        accountData.text = ""
        
        self.savingsProView.isHidden = true
        self.salaryView.isHidden = true
        self.savingsView.isHidden = true
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacters = "1234567890"
        let allowedCharcterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharcterSet = CharacterSet(charactersIn: string)
        return allowedCharcterSet.isSuperset(of: typedCharcterSet)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func setAccountTypes(){
        if customer?.accounts.count != 0{
            for account in (customer?.accounts)!{
                for index in 0...accountTypes.count-1{
                    if accountTypes[index] == account?.type{
                        accountTypes.remove(at: index)
                        break
                    }
                }
            }
        }
    }
    
    @IBAction func popUpPicker(_ sender: Any)
    {
        message.text = ""
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: screenWidth, height: screenHeight)
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: screenWidth, height:screenHeight))
        pickerView.delegate = self
        pickerView.dataSource = self
        
        pickerView.selectRow(selectedRow, inComponent: 0, animated: false)
        
        vc.view.addSubview(pickerView)
        pickerView.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
        pickerView.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor).isActive = true
        
        let alert = UIAlertController(title: "Select Account Type", message: "", preferredStyle: .actionSheet)
        
        alert.popoverPresentationController?.sourceView = pickerViewButton
        alert.popoverPresentationController?.sourceRect = pickerViewButton.bounds
        
        alert.setValue(vc, forKey: "contentViewController")
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (UIAlertAction) in
        }))
        
        alert.addAction(UIAlertAction(title: "Select", style: .default, handler: { (UIAlertAction) in
            self.selectedRow = pickerView.selectedRow(inComponent: 0)
            let selected = Array(self.accountTypes)[self.selectedRow]
            self.pickerViewButton.setTitle(selected, for: .normal)
            
            if selected == "Savings Account"{
                self.accountdetails.image = UIImage(named: "SavingsAccount")
                self.savingsProView.isHidden = true
                self.salaryView.isHidden = true
                self.savingsView.isHidden = false
            }else if selected == "Savings Pro Account"{
                self.accountdetails.image = UIImage(named: "SavingsProAccount")
                self.savingsProView.isHidden = false
                self.salaryView.isHidden = true
                self.savingsView.isHidden = true
            }else if selected == "Salary Account"{
                self.accountdetails.image = UIImage(named: "SalaryAccount")
                self.savingsProView.isHidden = true
                self.salaryView.isHidden = false
                self.savingsView.isHidden = true
            }
            
        }))
        
        accountData.text = ""
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func savingsCreatePressed(_ sender: Any) {
        
        let initialAmount = Double(savingsIntial.text ?? "0") ?? 0.0
        if initialAmount > 0{
            accountCount! += 1
            let accountNumber = String(accountCount!)
            if customer?.createAccount(type: 1, accountNumber: accountNumber, initialamount: initialAmount, companyName: "", empId: "") == true {
                message.text = "Account Creation Successfull"
                message.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                let customerAccountData = """
                Account Type    : Savings
                Account Number  : \(accountNumber)
                Account Balance : \(initialAmount)
                """
                accountData.text = customerAccountData
                self.savingsProView.isHidden = true
                self.salaryView.isHidden = true
                self.savingsView.isHidden = true
                setAccountTypes()
            }
        }else{
            message.text = "Initial Amount taken as 0"
            accountCount! += 1
            let accountNumber = String(accountCount!)
            if customer?.createAccount(type: 1, accountNumber: accountNumber, initialamount: initialAmount, companyName: "", empId: "") == true {
                message.text = "Account Creation Successfull"
                message.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                let customerAccountData = """
                Account Type    : Savings
                Account Number  : \(accountNumber)
                Account Balance : \(initialAmount)
                """
                accountData.text = customerAccountData
                self.savingsProView.isHidden = true
                self.salaryView.isHidden = true
                self.savingsView.isHidden = true
                setAccountTypes()
            }
        }
        
    }
    
    @IBAction func savingsProCreatePressed(_ sender: Any) {
        let initialAmount = Double(savingsProInitial.text ?? "0") ?? 0.0
        accountCount! += 1
        if initialAmount > 2000{
            let accountNumber = String(accountCount!)
            if customer?.createAccount(type: 2, accountNumber: accountNumber, initialamount: initialAmount, companyName: "", empId: "")  == true {
                message.text = "Account Creation Successfull"
                message.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                let customerAccountData = """
                Account Type    : Savings Pro
                Account Number  : \(accountNumber)
                Account Balance : \(initialAmount)
                """
                accountData.text = customerAccountData
                self.savingsProView.isHidden = true
                self.salaryView.isHidden = true
                self.savingsView.isHidden = true
                setAccountTypes()
            }
        }else {
            message.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            message.text = "Initial Amount must be greater than 2000"
        }
        
    }
    
    
    
    
    @IBAction func salaryCreatePressed(_ sender: Any) {
        let initialAmount = Double(salaryInitial.text ?? "0") ?? 0.0
        if initialAmount > 0{
            accountCount! += 1
            let accountNumber = String(accountCount!)
            if company.text != ""{
                if customerEmployeeId.text != ""{
                    let companyName = company.text!
                    let cempId = customerEmployeeId.text!
                    if customer?.createAccount(type: 3, accountNumber: accountNumber, initialamount: initialAmount, companyName: companyName, empId: cempId)  == true {
                        message.text = "Account Creation Successfull"
                        message.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                        let customerAccountData = """
                        Account Type    : Salary
                        Account Number  : \(accountNumber)
                        Account Balance : \(initialAmount)
                        """
                        accountData.text = customerAccountData
                        self.savingsProView.isHidden = true
                        self.salaryView.isHidden = true
                        self.savingsView.isHidden = true
                        setAccountTypes()
                    }
                }else{
                        customerEmployeeId.placeholder = "Cannot be Empty"
                        let color = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
                        let placeholder = customerEmployeeId.placeholder ?? ""
                        customerEmployeeId.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
                }
                
            }else{
                company.placeholder = "Cannot be Empty"
                let color = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
                let placeholder = company.placeholder ?? ""
                company.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
            }

        }else {
            message.text = "Initial Amount taken as 0"
            accountCount! += 1
            let accountNumber = String(accountCount!)
            if company.text != ""{
                if customerEmployeeId.text != ""{
                    let companyName = company.text!
                    let cempId = customerEmployeeId.text!
                    if customer?.createAccount(type: 2, accountNumber: accountNumber, initialamount: initialAmount, companyName: companyName, empId: cempId)  == true {
                        message.text = "Account Creation Successfull"
                        message.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                        let customerAccountData = """
                        Account Type    : Salary
                        Account Number  : \(accountNumber)
                        Account Balance : \(initialAmount)
                        """
                        accountData.text = customerAccountData
                        self.savingsProView.isHidden = true
                        self.salaryView.isHidden = true
                        self.savingsView.isHidden = true
                        setAccountTypes()
                    }
                }else{
                        customerEmployeeId.placeholder = "Cannot be Empty"
                        let color = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
                        let placeholder = customerEmployeeId.placeholder ?? ""
                        customerEmployeeId.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
                }
                
            }else{
                company.placeholder = "Cannot be Empty"
                let color = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
                let placeholder = company.placeholder ?? ""
                company.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
            }
        }
        
}
    
    
    @IBAction func continuePressed(_ sender: Any) {
        if (customer?.accounts.count)! >= 1{
            performSegue(withIdentifier: "continuetoMainMenu", sender: self)
        }else{
            message.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            message.text = "Please Create Account to Continue"
        }
        
    }
    
    
  
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
    {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 30))
        label.text = Array(accountTypes)[row]
        label.sizeToFit()
        return label
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        accountTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat
    {
        return 60
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "continuetoMainMenu"{
            let navigation = segue.destination as? UINavigationController
            let destination = navigation?.viewControllers.first as? MainMenuViewController
            destination?.customers = self.customers
            destination?.customer = self.customer
            destination?.accountCount = self.accountCount
            destination?.cinCount = self.cinCount
        }
        
    }
    
    
}

