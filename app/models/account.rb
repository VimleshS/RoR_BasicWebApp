class Account < ActiveRecord::Base
  belongs_to :customer
  has_one :balance
  
  # http://stackoverflow.com/questions/4154864/i-dont-understand-ruby-local-scope
  def Deposit(_balance)
    # THIS WORKS
    # b = GetBalance()
    
    # b.balance = b.balance + _balance
    # b.account_id = id
    # b.accountId = accountId
    # b.save
    
    
    # # THIS ALSO WORKS
    # begin
      # @balance = Balance.find_by!(account_id: id)
    # rescue ActiveRecord::RecordNotFound
      # @balance = Balance.new
      # @balance.balance = 0        
    # end
    # @balance.balance =  @balance.balance  + _balance
    # @balance.account_id = id
    # @balance.accountId = accountId
    # @balance.save
    
    # THIS ALSO WORKS
    begin
      balance = Balance.find_by!(account_id: id)
    rescue ActiveRecord::RecordNotFound
      balance = Balance.new
      balance.balance = 0        
    end
    balance.balance =  balance.balance  + _balance
    balance.account_id = id
    balance.accountId = accountId
    balance.save
  end
  
  
   # def WithDraw(_balance)
    # begin
      # @balance = Balance.find_by!(account_id: id)
    # rescue ActiveRecord::RecordNotFound
      # @balance = Balance.new
      # @balance.balance = 0        
    # end
    # @balance.balance =  @balance.balance  - _balance
    # @balance.account_id = id
    # @balance.accountId = accountId
    # @balance.save
  # end
   
   
  def WithDraw(_balance)
    begin
      balance = Balance.find_by!(account_id: id)
    rescue ActiveRecord::RecordNotFound
      balance = Balance.new
      balance.balance = 0        
    end
    balance.balance =  balance.balance  - _balance
    balance.account_id = id
    balance.accountId = accountId
    balance.save
  end
  
  private 
    def GetBalance
        begin
        b = Balance.find_by!(account_id: id)
        return b
      rescue ActiveRecord::RecordNotFound
        b = Balance.new  
        b.balance = 0
        return b
      end    
    
  end
  
  
  
end
