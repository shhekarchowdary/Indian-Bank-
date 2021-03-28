//
//  Account.swift
//  Indian Bank
//
//  Created by SOMA SEKHAR ANAPARTHI on 16/03/21.
//

import Foundation

class Account
{
    var accountNo: String
    var currentBalance: Double = 0.0
    var minBalance: Double = 0.0
    var maxDeposit: Double = 0.0
    var maxWithdrawal: Double = 0.0
    var type: String = ""
    
    init (accountNumber:String,initialDeposit:Double){
        self.accountNo = accountNumber
        self.currentBalance = initialDeposit
    }
    
    func deposit(amount:Double) -> Bool{
        if amount <= self.maxDeposit {
            self.currentBalance += amount
            return true
        }
        return false
    }

     func withDraw(amount:Double) ->Bool{
        if amount <= self.currentBalance{
            self.currentBalance -= amount
            return true
        }
        return false
    }
    
}




class SavingsAccount: Account
{

    override init (accountNumber:String,initialDeposit:Double)
    {
        super.init(accountNumber:accountNumber,initialDeposit:initialDeposit)
        self.minBalance = 0.0
        self.maxDeposit = 100000.0
        self.maxWithdrawal = 100000.0
        self.type = "Savings Account"
    }
}






class SavingsProAccount: Account
{
    override init (accountNumber:String,initialDeposit:Double)
    {
        super.init(accountNumber:accountNumber,initialDeposit:initialDeposit)
        self.minBalance = 2000.0
        self.maxWithdrawal = 200000.0
        self.maxDeposit = 200000.0
        self.type = "Savings Pro Account"
        
    }
}





class SalaryAccount: Account
{
    var empId: String
    var companyName: String
    
    init (accountNumber:String, initialDeposit:Double, companyName:String, empId:String)
    {
        self.companyName = companyName
        self.empId = empId

        super.init(accountNumber:accountNumber,initialDeposit:initialDeposit)
        self.minBalance = 0.0
        self.maxDeposit = 150000.0
        self.maxWithdrawal = 150000.0
        self.type = "Salary Account"
        
    }
}
