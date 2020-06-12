require "pry"
class Transfer

  # your code here
  attr_reader :amount, :sender, :receiver
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender, @receiver, @amount = sender, receiver, amount
    @status = "pending"
  end 

  def valid?
    self.sender.status =="open" && self.receiver.status =="open"
    sender.valid? && receiver.valid?
  end 

  def execute_transaction
    if valid? && self.status == "pending" && self.sender.balance > amount
      receiver.balance += amount
      sender.balance -=  amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance." 
    end
   end 

   def reverse_transfer
    if valid? && self.status == "complete" && self.sender.balance > amount
      receiver.balance -= amount
      sender.balance +=  amount
      self.status = "reversed"
   end 
  end
end
