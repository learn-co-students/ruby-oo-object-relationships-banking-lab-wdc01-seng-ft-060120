class Transfer
  attr_reader :sender, :receiver
  attr_accessor :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    self.status == 'complete' ? false : sender.valid? && receiver.valid? 
  end

  def execute_transaction
    if self.valid? && sender.balance - self.amount > 0
      sender.balance -= self.amount 
      receiver.balance += self.amount
      self.status = 'complete'
    else
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == 'complete'
      self.status = 'reversed'
      sender.balance += self.amount 
      receiver.balance -= self.amount
    end
  end

end
