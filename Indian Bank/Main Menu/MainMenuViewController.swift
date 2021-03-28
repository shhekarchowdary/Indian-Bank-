
import UIKit

class MainMenuViewController: UIViewController {
    
    var customers = [Customer]()
    var messagetxt:String? = ""
    var selection = ""
    var customer:Customer?
    var accountCount:Int? = nil
    var cinCount:Int? = nil

    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var error: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        message.text = "Customer Name: \(customer?.fullName ?? "Nil")"
        message.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        error.text = ""
        print(customer?.accounts.count ?? 0)
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "submenu"{
            //create a reference for the DetailsViewController
            let svc = segue.destination as? SubMenuViewController
            svc?.customer = self.customer
            //pass values from self to the other view controller
            svc!.main = self.selection
        }
        if segue.identifier == "createAnotherAccount"{
            let destinationViewController = segue.destination as? AccountCreationViewController
            destinationViewController?.customers = self.customers
            destinationViewController?.customer = self.customer
            destinationViewController?.accountCount = self.accountCount
            destinationViewController?.cinCount = self.cinCount
        }
        if segue.identifier == "editProfile"{
            let destinationViewController = segue.destination as? UpdateViewController
            destinationViewController?.customer = self.customer
        }
        if segue.identifier == "customerOverview"{
            let destinationViewController = segue.destination as? OverviewViewController
            destinationViewController?.customer = self.customer
        }
        if segue.identifier == "homeScreen"{
            let navigation = segue.destination as? UINavigationController
            let destination = navigation?.viewControllers.first as? OpeningViewController
            destination?.customers = customers
            destination?.cinCount = cinCount
            destination?.accountCount = accountCount
        }
    
    }
    
    @IBAction func banking(_ sender: Any) {
        selection = "banking"
        performSegue(withIdentifier: "submenu", sender: self)
    }
    
    @IBAction func paybill(_ sender: Any) {
        selection = "paybill"
        performSegue(withIdentifier: "submenu", sender: self)
    }
    
    @IBAction func customerOverviewPressed(_ sender: Any) {
        performSegue(withIdentifier: "customerOverview", sender: self)
    }
    
    @IBAction func editProfilePressed(_ sender: Any) {
        performSegue(withIdentifier: "editProfile", sender: self)
    }
    
    @IBAction func cAAccountPressed(_ sender: Any) {
        if (customer?.accounts.count)! >= 3{
            error.text = "You own all account types available"
            error.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }else{
            performSegue(withIdentifier: "createAnotherAccount", sender: self)
        }
    }
    
    @IBAction func homeButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "homeScreen", sender: self)
    }
    
    
    
    

}
