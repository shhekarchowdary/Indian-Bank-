

import UIKit

class CustomerIdentificationViewController: UIViewController, UITextFieldDelegate{
    
    
    @IBOutlet weak var customerin: UITextField!
    @IBOutlet weak var customerData: UITextView!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    
    
    
    var customers = [Customer]()
    var foundCustomer:Customer?
    var cinCount:Int? = nil
    var accountCount:Int? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        customerin.delegate = self
        customerData.text = ""
        message.text = ""
        continueButton.isEnabled = false
        continueButton.alpha = 0.5
        // Do any additional setup after loading the view.
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
    
    @IBAction func getDataPressed(_ sender: Any) {
        if checkInputs(){
            let cin = customerin.text
            for customer in customers{
                if customer.cin == cin{
                    foundCustomer = customer
                    message.textColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
                    message.text = "Customer Found"
                    let data = """
                    Customer Id    : \(customer.cin)
                    Customer Name  : \(customer.fullName)
                    Mobile Number  : \(customer.phoneNumber)
                    """
                    customerData.text = data
                    continueButton.isEnabled = true
                    continueButton.alpha = 1
                    break
                }else {
                    message.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
                    message.text = "No Customer Found"
                    customerData.text = ""
                }
            }
        }
    }
    
    @IBAction func continueButtonPressed(_ sender: Any) {
        if foundCustomer!.accounts.isEmpty{
            performSegue(withIdentifier: "noAccount", sender: self)
        }else {
            performSegue(withIdentifier: "haveAccount", sender: self)
        }
    }
    

    func checkInputs() -> Bool{
        if customerin.text != ""{
                return true
        }else{
            customerin.placeholder = "Please enter Customer Id"
            placeColourRed(field: "customerin")
            return false
        }
    }
    
    func placeColourRed(field:String){
        if field == "customerin" {
            let color = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            let placeholder = customerin.placeholder ?? "" //There should be a placeholder set in storyboard or elsewhere string or pass empty
            customerin.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "noAccount"{
            let destinationController = segue.destination as? AccountCreationViewController
            destinationController?.customers = self.customers
            destinationController?.customer = self.foundCustomer
            destinationController?.accountCount = self.accountCount
            destinationController?.cinCount = self.cinCount
            destinationController?.messagetxt = "No Account exists for Customer Please Create One"
        } else if segue.identifier == "haveAccount"{
            let navigation = segue.destination as? UINavigationController
            let destination = navigation?.viewControllers.first as? MainMenuViewController
            destination?.customers = self.customers
            destination?.customer = self.foundCustomer
            destination?.accountCount = self.accountCount
            destination?.cinCount = self.cinCount
        }
    }
    
    
    
    
}
