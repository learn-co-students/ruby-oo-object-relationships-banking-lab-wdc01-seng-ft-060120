class BankAccount
    attr_accessor   :balance, :status
    
    attr_reader     :name 

    def initialize(name)
        @name = name
        self.balance = 1000
        self.status = "open"
    end

    def deposit(amount)
        self.balance += amount
    end

    def pay(amount)
        self.balance -= amount
    end

    def display_balance
        return "Your balance is $#{self.balance}."
    end

    #does not consider outgoing amount
    def valid?        
        return false if self.status != "open" || self.balance  <= 0

        return true
    end 

    def close_account
        self.status = "closed"
    end
end
