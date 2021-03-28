//
//  MainMenuViewController.swift
//  Indian Bank
//
//  Created by dhanushkelam on 16/03/21.
//

import UIKit

class MainMenuViewController: UIViewController {
    var selection = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //create a reference for the DetailsViewController
        let svc = segue.destination as? SubMenuViewController
       
        //pass values from self to the other view controller
        svc!.main = self.selection
        
        
    }
    
    @IBAction func banking(_ sender: Any) {
        selection = "banking"
        performSegue(withIdentifier: "submenu", sender: self)
        

    }
    @IBAction func paybill(_ sender: Any) {
        selection = "paybill"
        performSegue(withIdentifier: "submenu", sender: self)


    }
    
    @IBAction func booking(_ sender: Any) {
        selection = "booking"

        performSegue(withIdentifier: "submenu", sender: self)


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
