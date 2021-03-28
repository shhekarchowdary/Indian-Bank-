

import UIKit

class Register2ViewController: UIViewController {
    
    @IBOutlet weak var customerData: UITextView!
    
    var cinCount:Int? = nil
    var accountCount:Int? = nil
    var customers = [Customer]()
    var cCin = "", cName = "", cfName = "", cdateofBirth = "", cMobile = "", cEmail = "", cAdd = "", cAad = "", cPan = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let data = """
            CIN             : \(cCin)
            Name            : \(cName)
            Father Name     : \(cfName)
            Date of Birth   : \(cdateofBirth)
            Mobile Number   : \(cMobile)
            Email Id        : \(cEmail)
            Address         : \(cAdd)
            Aadhaar         : \(cAad)
            PAN             : \(cPan)
            """
        customerData.text = data
    }
    

    @IBAction func completeRegistrationPressed(_ sender: Any) {
        
        customers.append(Customer(cin: cCin, fullName: cName, fatherName: cfName, DOB: cdateofBirth, phoneNumber: Int(cMobile)!, emailId: cEmail, address: cAdd, panNumber: cPan, aadharNumber: cAad))
        
        performSegue(withIdentifier: "completed", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "completed"{
            let navigation = segue.destination as? UINavigationController
            let destination = navigation?.viewControllers.first as? OpeningViewController
            destination?.customers = self.customers
            destination?.cinCount = self.cinCount!
            destination?.accountCount = self.accountCount!
            destination?.messagetxt = "Registration Successfull"
            print("Registration2: \(self.customers)")
        }
        
    }

    
    

}
