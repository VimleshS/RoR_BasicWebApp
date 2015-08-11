class TransactionController < ApplicationController
  def new
  end

  def create
    fromAccount = params[:FrAccount]
    toAccount = params[:ToAccount]
    amount = params[:Amount]
    
    if toAccount.nil?
       flash[:alert] = "To Account cannot be blank"
       redirect_to transaction_new_path
       return
    end

    if amount.nil? || (amount.to_i < 0)
       flash[:alert] = "Please enter correct amount"
       redirect_to transaction_new_path
       return
    end
    
    txn = Transaction.new
    txn[:FromAccount] = fromAccount
    txn[:ToAccount] = toAccount
    txn[:Amount] = amount
    txn[:Narration] = params[:Narration]
    txn[:DrCr] = params[:DrCr]

    
    txn.transaction do
      f = Account.find_by(:id => toAccount.to_i)
      f.Deposit(amount.to_f)
      if fromAccount != ""
        t = Account.find_by(:id => fromAccount.to_i)
        t.WithDraw(amount.to_f)
      end 
      # raise 'An error has occured'  
      txn.save!
    end
        
  end
   
  
  
  private
      # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:FromAccount, :ToAccount, :Amount, :DrCr, :Narration)
    end
end
