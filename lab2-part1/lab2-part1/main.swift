import Foundation

class BankAccount {
    private let accountNumber: Int
    private let accountOwner: String
    private var balance: Double
    
    let bankAccountRepo = BankAccountRepository.shared
    
    
    init(accountNumber: Int, accountOwner: String, balance: Double) throws {
        if (bankAccountRepo.getRegisteredAccounts().contains(accountNumber)) {
            throw BankAccountError.accountNumberAlreadyExists
        }
        
        self.accountNumber = accountNumber
        self.accountOwner = accountOwner
        self.balance = balance
        
        bankAccountRepo.push(accountNumber)
    }
        
        func deposit(amount: Double) {
            if amount > 0 {
                balance += amount
                print("Deposited: \(amount). New balance: \(balance)")
            } else {
                print("Invalid deposit amount: \(amount)")
            }
        }
        
        func withdraw(amount: Double) {
            if amount > 0 && balance >= amount {
                balance -= amount
                print("Withdrew: \(amount). New balance: \(balance)")
            } else {
                print("Insufficient funds for withdrawal: \(amount)")
            }
        }
        
        func getBalance() -> Double {
            return balance
        }
        
        func displayInfo() {
            print("Account Number: \(accountNumber)")
            print("Account Owner: \(accountOwner)")
            print("Balance: \(balance)")
        }
}

    
    
enum BankAccountError: Error {
    case accountNumberAlreadyExists
}



class BankAccountRepository
{
    static let shared = BankAccountRepository()
    
    private var registeredAccounts: [Int] = []
    
    private init() {}
    
    public func getRegisteredAccounts() -> [Int] {
        return registeredAccounts;
    }
    
    public func push(_ accountNumber: Int) {
        registeredAccounts.append(accountNumber)
    }
}



do {
    // User 1
    let account = try BankAccount(accountNumber: 1, accountOwner: "Alibek Tastan", balance: 100.0)
    account.deposit(amount: 50.0)
    account.withdraw(amount: 25.0)
    account.displayInfo()
    
    print("\n")
    
    // User 2
    let account2 = try BankAccount(accountNumber: 2, accountOwner: "Travis Scott", balance: 500.0)
    account2.deposit(amount: 100.0)
    account2.withdraw(amount: 300.0)
    account2.displayInfo()
    
    print("\n")
    
    // Attempting to create a user with already existed account number.
    _ = try BankAccount(accountNumber: 1, accountOwner: "Mark Zuckerberg", balance: 1000.0)
    
} catch BankAccountError.accountNumberAlreadyExists {
    // Handling exception
    print("Account number already exists.")
}
