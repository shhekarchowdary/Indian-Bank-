//
//  SubMenuViewController.swift
//  Indian Bank
//
//  Created by dhanushkelam on 16/03/21.
//

import UIKit

class SubMenuViewController: UIViewController {
    var main = ""
    var selection = ""

    @IBOutlet weak var paybillsubmenu: UIStackView!
    @IBOutlet weak var bankingsubmenu: UIStackView!
    @IBOutlet weak var bookingsubmenu: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if main == "banking"{
            bankingsubmenu.isHidden = false
        }
        else if main == "paybill"{
            paybillsubmenu.isHidden = false
        }
        else if main == "booking"{
            bookingsubmenu.isHidden = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //create a reference for the DetailsViewController
        if segue.identifier == "transactions"{
            let svc = segue.destination as? TransactionsViewController
            svc!.operations = self.selection

        }
        else if segue.identifier == "paybill"{
            let pvc = segue.destination as? PayBillsTransactionsViewController
            pvc!.choice = self.selection

        }
        else if segue.identifier == "movies"{
            let pvc = segue.destination as? MovieTicketsViewController
           // pvc!.choice = self.selecton
        }
        else if segue.identifier == "travel"{
            let pvc = segue.destination as? TravelViewController
          //  pvc!.choice = self.selection

        }
        else if segue.identifier == "event"{
            let pvc = segue.destination as? EventsViewController
          //  pvc!.choice = self.selection

        }
        else if segue.identifier == "hotel"{
            let pvc = segue.destination as? HotelViewController
          //  pvc!.choice = self.selection

        }
        
       
        //pass values from self to the other view controller
        
        
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
    
    @IBAction func movies(_ sender: Any) {
        performSegue(withIdentifier: "movies", sender: self)

    }
    @IBAction func travel(_ sender: Any) {
        performSegue(withIdentifier: "travel", sender: self)

    }
    @IBAction func event(_ sender: Any) {
        performSegue(withIdentifier: "event", sender: self)

    }
    
    @IBAction func hotel(_ sender: Any) {
        performSegue(withIdentifier: "hotel", sender: self)

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
