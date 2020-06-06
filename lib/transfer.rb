require 'pry'
class Transfer
    attr_accessor :sender, :receiver, :amount, :status

    def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @status = "pending"
      @amount = amount
    end

    def valid?
      #binding.pry
      self.sender.valid? && self.receiver.valid?
    end

    def execute_transaction
      if valid? && self.status == "pending" && self.sender.balance >= self.amount
        self.sender.balance -= self.amount
        self.receiver.balance += self.amount
        self.status = "complete"
      else 
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end

    def reverse_transfer
      if valid? && self.status == "complete"
        self.receiver.balance -= self.amount
        self.sender.balance += self.amount
        self.status = "reversed"
      end
    end

end
