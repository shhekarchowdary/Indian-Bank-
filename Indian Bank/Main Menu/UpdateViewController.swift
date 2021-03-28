//
//  UpdateViewController.swift
//  Indian Bank
//
//  Created by SOMA SEKHAR ANAPARTHI on 27/03/21.
//

import UIKit

class UpdateViewController: UIViewController {
    
    
        @IBOutlet weak var registerScrollView: UIScrollView!
        @IBOutlet weak var updatedStack: UIStackView!
    
        @IBOutlet weak var updateButton: UIButton!
    
        @IBOutlet weak var cFullName: UITextField!
        @IBOutlet weak var cFatherName: UITextField!
        @IBOutlet weak var cDOB: UITextField!
        @IBOutlet weak var cMobileNumber: UITextField!
        @IBOutlet weak var cEmailid: UITextField!
        @IBOutlet weak var cAddress: UITextField!
        @IBOutlet weak var cAadhaar: UITextField!
        @IBOutlet weak var cPanNumber: UITextField!
        
        @IBOutlet weak var nameMessage: UILabel!
        @IBOutlet weak var fatherMessage: UILabel!
        @IBOutlet weak var dobMessage: UILabel!
        @IBOutlet weak var mobileMessage: UILabel!
        @IBOutlet weak var emailMessage: UILabel!
        @IBOutlet weak var addressMessage: UILabel!
        @IBOutlet weak var aadhaarMessage: UILabel!
        @IBOutlet weak var panMessage: UILabel!
    
    @IBOutlet weak var updatedName: UILabel!
    @IBOutlet weak var updatedFatherName: UILabel!
    @IBOutlet weak var updatedDob: UILabel!
    @IBOutlet weak var updatedPhoneNumber: UILabel!
    @IBOutlet weak var updatedeMailid: UILabel!
    @IBOutlet weak var updatedAddress: UILabel!
    @IBOutlet weak var updatedAadhar: UILabel!
    @IBOutlet weak var updatedPanNumber: UILabel!
    
    
    
    var customer:Customer?
    let validation = Validations()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        updatedStack.isHidden = true
        
        nameMessage.text = ""
        fatherMessage.text = ""
        dobMessage.text = ""
        mobileMessage.text = ""
        emailMessage.text = ""
        addressMessage.text = ""
        aadhaarMessage.text = ""
        panMessage.text = ""
        
        cFullName.text = customer?.fullName
        cFatherName.text = customer?.fatherName
        cDOB.text = customer?.dob
        cMobileNumber.text = String(customer!.phoneNumber)
        cEmailid.text = customer?.emailId
        cAddress.text = customer?.address
        cAadhaar.text = customer?.aadharNumber
        cPanNumber.text = customer?.panNumber
    }
    
    @IBAction func updateProfilePressed(_ sender: Any) {
        if checkFeilds() {
            let fullName = cFullName.text, fatherName = cFatherName.text, dob = cDOB.text, mobileNumber = cMobileNumber.text, emailid = cEmailid.text, address = cAddress.text, aadhaar = cAadhaar.text, panNumber = cPanNumber.text
            
            let isValidatefullName = self.validation.validateFullName(name: fullName!)
            if isValidatefullName == false{
                nameMessage.text = "min 3 and max 50 Characters"
                nameMessage.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
               return
            }else{
                nameMessage.text = ""
            }
            
            let isValidatefatherName = self.validation.validateFatherName(fatherName: fatherName!)
            if isValidatefatherName == false{
                fatherMessage.text = "min 3 and max 50 Characters"
                fatherMessage.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
               return
            }else{
                fatherMessage.text = ""
            }
            
            let isValidatedob = self.validation.validateDateOfBirth(dob: dob!)
            if isValidatedob == false{
                dobMessage.text = "date should be in DD/MM/YYYY"
                dobMessage.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
               return
            }else{
                dobMessage.text = ""
            }
            
            let isValidatemobileNumber = self.validation.validatePhoneNumber(phoneNumber: mobileNumber!)
            if isValidatemobileNumber == false{
                mobileMessage.text = "format: 9012345678"
                mobileMessage.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
               return
            }else{
                mobileMessage.text = ""
            }
            
            let isValidateemailid = self.validation.validateEmailId(emailId: emailid!)
            if isValidateemailid == false{
                emailMessage.text = "invalid email Id"
                emailMessage.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
               return
            }else{
                emailMessage.text = ""
            }
            
            
            let isValidateaadhaar = self.validation.validateAadharNumber(aadharNumber: aadhaar!)
            if isValidateaadhaar == false{
                aadhaarMessage.text = "format 1234 1234 1234"
                aadhaarMessage.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
               return
            }else{
                aadhaarMessage.text = ""
            }
            
            let isValidatepan = self.validation.validatePanNumber(panNumber: panNumber!)
            if isValidatepan == false{
                panMessage.text = "Invalid Pan Id"
                panMessage.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
               return
            }else{
                panMessage.text = ""
            }
            
            if isValidatefullName && isValidatefatherName && isValidatedob && isValidatemobileNumber && isValidateemailid && isValidateaadhaar && isValidatepan
            {
                customer?.updateData(fullName: fullName!, fatherName: fatherName!, DOB: dob!, phoneNumber: Int(mobileNumber!)!, emailId: emailid!, address: address!, panNumber: panNumber!, aadharNumber: aadhaar!)
                registerScrollView.isHidden = true
                updateButton.isHidden = true
                updateData()
                updatedStack.isHidden = false
            }
            
        }
    }
    
    func checkFeilds() -> Bool{
        var fNameEmpty = false, fatherNameEmpty = false, dobEmpty = false, mobileNumberEmpty = false, emailIdEmpty = false, addressEmpty = false, aadharEmpty = false, panNumberEmpty = false
        if cFullName.text == ""{
            fNameEmpty = true
            cFullName.placeholder = "Cannot be Empty"
            let color = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            let placeholder = cFullName.placeholder ?? ""
            cFullName.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        }
        if cFatherName.text == ""{
            fatherNameEmpty = true
            cFatherName.placeholder = "Cannot be Empty"
            let color = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            let placeholder = cFatherName.placeholder ?? ""
            cFatherName.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        }
        if cDOB.text == ""{
            dobEmpty = true
            cDOB.placeholder = "Cannot be Empty"
            let color = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            let placeholder = cDOB.placeholder ?? ""
            cDOB.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        }
        if cMobileNumber.text == ""{
            mobileNumberEmpty = true
            cMobileNumber.placeholder = "Cannot be Empty"
            let color = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            let placeholder = cMobileNumber.placeholder ?? ""
            cMobileNumber.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        }
        if cEmailid.text == ""{
            emailIdEmpty = true
            cEmailid.placeholder = "Cannot be Empty"
            let color = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            let placeholder = cEmailid.placeholder ?? ""
            cEmailid.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        }
        if cAddress.text == ""{
            addressEmpty = true
            cAddress.placeholder = "Cannot be Empty"
            let color = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            let placeholder = cAddress.placeholder ?? ""
            cAddress.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        }
        if cAadhaar.text == ""{
            aadharEmpty = true
            cAadhaar.placeholder = "Cannot be Empty"
            let color = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            let placeholder = cAadhaar.placeholder ?? ""
            cAadhaar.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        }
        if cPanNumber.text == ""{
            panNumberEmpty = true
            cPanNumber.placeholder = "Cannot be Empty"
            let color = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            let placeholder = cPanNumber.placeholder ?? ""
            cPanNumber.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
        }
        
        if !fNameEmpty && !fatherNameEmpty && !dobEmpty && !mobileNumberEmpty && !emailIdEmpty && !addressEmpty && !aadharEmpty && !panNumberEmpty {
            return true
        }else{
            return false
        }
    }
    
    func updateData(){
        updatedName.text = customer?.fullName
        updatedFatherName.text = customer?.fatherName
        updatedDob.text = customer?.dob
        updatedPhoneNumber.text = String(customer!.phoneNumber)
        updatedeMailid.text = customer?.emailId
        updatedAddress.text = customer?.address
        updatedAadhar.text = customer?.aadharNumber
        updatedPanNumber.text = customer?.panNumber
    }
    
}
