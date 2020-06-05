require_relative "./bank_account.rb"
class Transfer
  # your code here
  attr_reader :sender, :receiver
  attr_accessor :amount, :status, :reverse_amount

  @@all_transfers = []
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if self.valid? && @sender.balance > @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      # @receiver.deposit(@amount)
      @status = "complete"
      @reverse_amount = @amount
      @amount = 0
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      @sender.balance += @reverse_amount
      @receiver.balance -= @reverse_amount
      
      @status = "reversed"
      @reverse_amount = 0
    end
  end

end
