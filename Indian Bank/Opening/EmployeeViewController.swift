

import UIKit

class EmployeeViewController: UIViewController {
    
    var customers = [Customer]()
    var employee = [String:String]()
    var cinCount = 12110
    var accountCount = 1011101
    
    override func viewDidLoad() {
        super.viewDidLoad()
        employee["INDB123"] = "Test@123"
        employee["INDB456"] = "Test@123"
        if customers.count == 0{
            customers.append(Customer(cin: "11111", fullName: "Pavan", fatherName: "Satyanarayana", DOB: "13-01-1996", phoneNumber: 9898989898, emailId: "pavan@gmail.com", address: "2-34,Danavaipeta,Rajahmundry.", panNumber: "ABCDE2345K", aadharNumber: "1234 1234 1234"))
            customers.append(Customer(cin: "11112", fullName: "Palnadu", fatherName: "Satyanarayana", DOB: "13-01-1996", phoneNumber: 9898989898, emailId: "pavan@gmail.com", address: "2-34,Danavaipeta,Rajahmundry.", panNumber: "ABCDE2345K", aadharNumber: "1234 1234 1234"))
        }
    }
    
    @IBAction func employeeLoginPressed(_ sender: Any) {
        performSegue(withIdentifier: "loginScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginScreen"{
            let destination = segue.destination as? EmployeeLoginViewController
            destination?.customers = customers
            destination?.employee = employee
            destination?.cinCount = cinCount
            destination?.accountCount = accountCount
        }
        
    }

}
