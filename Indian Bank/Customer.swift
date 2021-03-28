//
//  Customer.swift
//  Indian Bank
//
//  Created by SOMA SEKHAR ANAPARTHI on 16/03/21.
//
import Foundation

class Customer
{
    var cin: String
    var fullName: String
    var fatherName: String
    var dob: String
    
    var phoneNumber: Int
    var emailId: String
    var address: String
    
    var panNumber :String
    var aadharNumber: String
    
    var accounts = [Account?]()
    
    init (cin:String,fullName:String,fatherName:String,DOB:String,phoneNumber:Int,emailId:String,address:String,panNumber:String,aadharNumber:String)
    {
        self.cin = cin
        self.fullName = fullName
        self.fatherName = fatherName
        self.dob = DOB
        self.phoneNumber = phoneNumber
        self.emailId = emailId
        self.address = address
        self.panNumber = panNumber
        self.aadharNumber = aadharNumber
        
        
    }

    
    func createAccount(type:Int, accountNumber:String, initialamount:Double, companyName:String, empId:String) -> Bool{
    
            switch type
            {
                case 1:
                    accounts.append(SavingsAccount(accountNumber:accountNumber, initialDeposit: initialamount))
                    return true
                case 2:
                    accounts.append(SavingsProAccount(accountNumber:accountNumber, initialDeposit: initialamount))
                    return true
                case 3:
                    accounts.append(SalaryAccount(accountNumber:accountNumber, initialDeposit: initialamount, companyName: companyName, empId: empId))
                    return true
                    
                default:
                    return false
            }
    }
    
    func updateData(fullName:String,fatherName:String,DOB:String,phoneNumber:Int,emailId:String,address:String,panNumber:String,aadharNumber:String)
    {
        self.fullName = fullName
        self.fatherName = fatherName
        self.dob = DOB
        self.phoneNumber = phoneNumber
        self.emailId = emailId
        self.address = address
        self.panNumber = panNumber
        self.aadharNumber = aadharNumber
    }


    func getData() -> String
    {
        var customerData = "-------- Profile Details --------" + "\n"
        customerData += "   Customer Name: \(self.fullName)" + "\n"
        customerData += "   Father Name--: \(self.fatherName)" + "\n"
        customerData += "   Date of Birth: \(self.dob)" + "\n"
        customerData += "   Phone Numbe--: \(self.phoneNumber)" + "\n"
        customerData += "   Email-Id-----: \(self.emailId)" + "\n"
        customerData += "   Address------: \(self.address)" + "\n"
        customerData += "   Aadhar Number: \(self.aadharNumber)" + "\n"
        customerData += "   PAN Number---: \(self.panNumber)" + "\n"
        return customerData
    }
    
    func transfermoney(from:Int,to:Int,amount:Double)->Bool
    {
        let wAccount = self.accounts[from]
        let dAccount = self.accounts[to]
        if amount <= wAccount!.currentBalance{
            wAccount!.currentBalance -= amount
            dAccount!.currentBalance += amount
            return true
        }
        return false
    }
    
    func getBillAmount(billType:Int) -> Double
    {
        let choice = billType
        var billAmount = 0.0
        switch choice{
        
            case 1:
                let randomInt = Int.random(in: 100..<1000)
                billAmount = Double(randomInt)
                return billAmount
                
            case 2:
                let randomInt = Int.random(in: 500..<1000)
                billAmount = Double(randomInt)
                return billAmount
                
            case 3:
                let randomInt = Int.random(in: 500..<1000)
                billAmount = Double(randomInt)
                return billAmount
                
            case 4:
                let randomInt = Int.random(in: 0..<2000)
                billAmount = Double(randomInt)
                return billAmount
            case 5:
                let randomInt = Int.random(in: 250..<700)
                billAmount = Double(randomInt)
                return billAmount
            default:
                return billAmount
        }
    }
    
    
    
}

