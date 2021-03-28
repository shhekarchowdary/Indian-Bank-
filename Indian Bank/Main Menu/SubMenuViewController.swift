

import UIKit

class SubMenuViewController: UIViewController {
    var main = ""
    var selection = ""
    var customer:Customer?
    var customers = [Customer]()
    
    @IBOutlet weak var paybillsubmenu: UIStackView!
    @IBOutlet weak var bankingsubmenu: UIStackView!
    @IBOutlet weak var message: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        message.text = ""
        // Do any additional setup after loading the view.
        if main == "banking"{
            bankingsubmenu.isHidden = false
        }
        else if main == "paybill"{
            paybillsubmenu.isHidden = false
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //create a reference for the DetailsViewController
        if segue.identifier == "transactions"{
            let svc = segue.destination as? TransactionsViewController
            svc?.operations = self.selection
            svc?.customer = self.customer
            svc?.customers = self.customers

        }
        else if segue.identifier == "paybill"{
            let pvc = segue.destination as? PayBillsTransactionsViewController
            pvc?.choice = self.selection
            pvc?.customer = self.customer
            
        }
        
        
    }
   
    
    
    @IBAction func checkbalance(_ sender: Any) {
        selection = "cb"
        performSegue(withIdentifier: "transactions", sender: self)

    }
    @IBAction func withdrawmoney(_ sender: Any) {
        selection = "wd"
        performSegue(withIdentifier: "transactions", sender: self)
    }
    @IBAction func depositmoney(_ sender: Any) {
        selection = "dm"
        performSegue(withIdentifier: "transactions", sender: self)
    }
    
    @IBAction func transfermoney(_ sender: Any) {
        selection = "tm"
        if (customer?.accounts.count)! > 1{
            performSegue(withIdentifier: "transactions", sender: self)
        }else{
            message.text = "You don't have multiple Accounts to Transfer"
            message.textColor = .systemRed
        }
    }
    
    @IBAction func transferOthers(_ sender: Any) {
        selection = "tmto"
        performSegue(withIdentifier: "transactions", sender: self)
    }
    
    
    
    
    @IBAction func electricitybill(_ sender: Any) {
        selection = "eb"
        performSegue(withIdentifier: "paybill", sender: self)
        
    }
    
    @IBAction func broadbandbill(_ sender: Any) {
        selection = "bb"
        performSegue(withIdentifier: "paybill", sender: self)
    }
    
    @IBAction func postpaidbill(_ sender: Any) {
        selection = "pb"
        performSegue(withIdentifier: "paybill", sender: self)
    }
    @IBAction func creditbill(_ sender: Any) {
        selection = "cb"
        performSegue(withIdentifier: "paybill", sender: self)
    }
    
    
    @IBAction func dthbill(_ sender: Any) {
        selection = "db"
        performSegue(withIdentifier: "paybill", sender: self)
    }
    
    

}
