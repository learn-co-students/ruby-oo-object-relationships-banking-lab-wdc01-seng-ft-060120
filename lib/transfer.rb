require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def self.status
    @status
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.status == "complete"
      "Transaction can only be completed once."
    elsif !self.valid? || @sender.balance < amount
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      sender.withdraw(amount)
      receiver.deposit(amount)
      self.status = "complete"
    end
  end

  def reverse_transfer
    if self.status == "complete" 
      receiver.withdraw(amount)
      sender.deposit(amount)
      self.status = "reversed"
    end
  end

end
