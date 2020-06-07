require 'pry'
class Transfer#=====================================
  @@all_ids = []
  attr_reader   :sender, :receiver, :amount, :id
  attr_accessor :status 

  def initialize(sender, receiver, amount)
    self.status = "pending"
    @amount = amount
    @sender = sender
    @receiver = receiver
    @id = assign_id
    @@all_ids << @id
  end

  def valid?
    return \
    (@sender.valid? && @receiver.valid? && (@sender.balance - self.amount >= 0))  
  end

  def execute_transaction
    #binding.pry
    if(self.valid? && (self.status != "complete"))
      send_money(self.sender, self.receiver, self.amount)
      return self.status = "complete"
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    return "Transfer was not yet executed" if self.status != "complete"
    send_money(self.receiver,self.sender,self.amount)
    self.status = "reversed"    
  end
  #--------------------------------
  private

  def assign_id
    new_id = rand(99999)
    flag = false
    while(flag == false) do
      if @@all_ids.include? new_id
        new_id = rand(999999)
      else
        flag = true        
      end
    end
    return new_id
  end

  def send_money(sender, receiver, amount)
    sender.pay(amount)
    receiver.deposit(amount)
  end


end#===============================================
