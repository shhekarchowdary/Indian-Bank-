

import UIKit

class EmployeeLoginViewController: UIViewController {
    
    var customers = [Customer]()
    var employee = [String:String]()
    var loginUser:String = ""
    var cinCount:Int? = nil
    var accountCount:Int? = nil
    
    @IBOutlet weak var empId: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var message: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        message.text = ""
    }
    
    @IBAction func loginPressed(_ sender: Any){
        loginUser = ""
        if checkInputs() {
            let emp = empId.text!
            let epassword = password.text!
            var userExists = 0
            for (empl,pass) in employee
            {
                if  empl == emp
                {
                    userExists = 1
                    if pass == epassword{
                        loginUser = emp
                        message.text = "Login Succesfull"
                        message.textColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
                        empId.text = ""
                        password.text = ""
                        performSegue(withIdentifier: "empLogin", sender: self)
                        break
                    }else{
                        message.text = "Wrong Password"
                        message.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
                    }
                }
            }
            if userExists == 0{
                message.text = "User Doesn't Exists"
                message.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            }
        }
    }
    
    func checkInputs() -> Bool{
        if empId.text != ""{
            if password.text != ""{
                return true
            }else{
                password.placeholder = "Please enter Password"
                placeColourRed(field: "password")
                return false
            }
        }else{
            empId.placeholder = "Please enter Employee Id"
            placeColourRed(field: "empId")
            return false
        }
    }
    
    func placeColourRed(field:String){
        if field == "empId" {
            let color = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            let placeholder = empId.placeholder ?? "" //There should be a placeholder set in storyboard or elsewhere string or pass empty
            empId.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        }else if field == "password"{
            let color = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            let placeholder = password.placeholder ?? "" //There should be a placeholder set in storyboard or elsewhere string or pass empty
            password.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "empLogin"{
            let navigation = segue.destination as? UINavigationController
            let destination = navigation?.viewControllers.first as? OpeningViewController
            destination?.empLogin = loginUser
            destination?.customers = customers
            destination?.cinCount = cinCount
            destination?.accountCount = accountCount
        }
        
    }
    
    
    
    

}
