//
//  Validations.swift
//  Indian Bank
//
//  Created by SOMA SEKHAR ANAPARTHI on 22/03/21.
//

import Foundation

class Validations{
    
    public func validateFullName(name: String) ->Bool {
    
          let nameRegex = "^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$"
          let trimmedString = name.trimmingCharacters(in: .whitespaces)
          let validateName = NSPredicate(format: "SELF MATCHES %@", nameRegex)
          let isValidateName = validateName.evaluate(with: trimmedString)
          return isValidateName
       }
    
    public func validateFatherName(fatherName: String) ->Bool {
      
          let nameRegex = "^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$"
          let trimmedString = fatherName.trimmingCharacters(in: .whitespaces)
          let validateName = NSPredicate(format: "SELF MATCHES %@", nameRegex)
          let isValidateName = validateName.evaluate(with: trimmedString)
          return isValidateName
       }
    
    public func validateDateOfBirth(dob: String) ->Bool {
          // Length be 18 characters max and 3 characters minimum, you can always modify.
          let nameRegex = "^[0-9]{1,2}[\\/-][0-9]{1,2}[\\/-][0-9]{4}$"
          let trimmedString = dob.trimmingCharacters(in: .whitespaces)
          let validateName = NSPredicate(format: "SELF MATCHES %@", nameRegex)
          let isValidateName = validateName.evaluate(with: trimmedString)
          return isValidateName
       }
    
    public func validatePhoneNumber(phoneNumber: String) -> Bool {
          //Minimum 8 characters at least 1 Alphabet and 1 Number:
          let passRegEx = "^[5-9][0-9]{9}$"
          let trimmedString = phoneNumber.trimmingCharacters(in: .whitespaces)
          let validatePassord = NSPredicate(format:"SELF MATCHES %@", passRegEx)
          let isvalidatePass = validatePassord.evaluate(with: trimmedString)
          return isvalidatePass
       }
    
    public func validateEmailId(emailId: String) -> Bool {
          //Minimum 8 characters at least 1 Alphabet and 1 Number:
          let passRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
          let trimmedString = emailId.trimmingCharacters(in: .whitespaces)
          let validatePassord = NSPredicate(format:"SELF MATCHES %@", passRegEx)
          let isvalidatePass = validatePassord.evaluate(with: trimmedString)
          return isvalidatePass
       }
    
    public func validatePanNumber(panNumber: String) -> Bool {
          //Minimum 8 characters at least 1 Alphabet and 1 Number:
          let passRegEx = "^([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}?$"
          let trimmedString = panNumber.trimmingCharacters(in: .whitespaces)
          let validatePassord = NSPredicate(format:"SELF MATCHES %@", passRegEx)
          let isvalidatePass = validatePassord.evaluate(with: trimmedString)
          return isvalidatePass
       }
    
    public func validateAadharNumber(aadharNumber: String) -> Bool {
          //Minimum 8 characters at least 1 Alphabet and 1 Number:
          let passRegEx = "^^\\d{4}\\s\\d{4}\\s\\d{4}$"
          let trimmedString = aadharNumber.trimmingCharacters(in: .whitespaces)
          let validatePassord = NSPredicate(format:"SELF MATCHES %@", passRegEx)
          let isvalidatePass = validatePassord.evaluate(with: trimmedString)
          return isvalidatePass
       }
    
}
