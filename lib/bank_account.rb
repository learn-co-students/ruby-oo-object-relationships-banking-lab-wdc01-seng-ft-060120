require 'pry'

class BankAccount
    attr_writer :deposit
    attr_reader :name, :bank_account
    attr_accessor :balance, :status

    def initialize(name)
        # @bank_account = bank_account
        @name = name
        @balance = 1000
        @status = "open"
    end

    def deposit(num)
        @balance += num
    end

    def display_balance
        "Your balance is $#{@balance}."
    end

    def valid?
        @status == "open" && @balance > 0
    end

    def close_account
        self.status = "closed"
    end
    
end

# binding.pry