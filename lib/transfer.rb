class Transfer#=====================================

  attr_reader   :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    self.status = "pending"
    @amount = amount
    @sender = sender
    @receiver = receiver
  end

  def valid?
    return (sender.valid? && receiver.valid?)  
  end

  

end#===============================================
