

import UIKit


class OpeningViewController: UIViewController {

    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var empId: UILabel!
    
    
    var customers = [Customer]()
    var empLogin:String? = nil
    var messagetxt:String? = nil
    var cinCount:Int? = nil
    var accountCount:Int? = nil
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        message.text = messagetxt
        message.textColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        empId.text = "Logged in Emp Id: \(empLogin ?? "Test" )"
        print("Opening Loaded: \(self.customers)")
    }

    @IBAction func existingCustomerPressed(_ sender: Any){
        performSegue(withIdentifier: "existingCustomer", sender: self)
    }
    
    @IBAction func newCustomerPressed(_ sender: Any){
        performSegue(withIdentifier: "newCustomer", sender: self)
    }
    
    @IBAction func logOutPressed(_ sender: Any) {
        performSegue(withIdentifier: "logOut", sender: self)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "existingCustomer"{
            let destinationController = segue.destination as? CustomerIdentificationViewController
            destinationController?.customers = self.customers
            destinationController?.accountCount = self.accountCount
            destinationController?.cinCount = self.cinCount
            print("Opening: \(self.customers)")
        }
        if segue.identifier == "newCustomer"{
            let destinationController = segue.destination as? Register1ViewController
            destinationController?.customers = self.customers
            destinationController?.accountCount = self.accountCount
            destinationController?.cinCount = self.cinCount
            print("Opening: \(self.customers)")
        }
        if segue.identifier == "logOut"{
            let navigation = segue.destination as? UINavigationController
            let destination = navigation?.viewControllers.first as? EmployeeViewController
            destination?.customers = self.customers
            destination?.cinCount = self.cinCount!
            destination?.accountCount = self.accountCount!
        }
        
    }
    
    

}
