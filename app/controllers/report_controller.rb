class ReportController < ApplicationController
  def new
  end

  def create
    fromAccount = params[:FrAccount]
    if fromAccount != ''
      send_data generateReport(fromAccount.to_i), :filename => 'test.csv'
    end
  end
  
  
  # def generateReport
    # CSV.generate do |csv|
    # csv <<  [ 'user[:id]', 'user[:email]', 'user[:password]', 'user[:url]', 'user[:message]' ]
    # # all.each do |item|
      # csv <<  [ 1,2,3,4,5]
    # # end
    # end   
  # end
  
  def generateReport(fromAccount)
    CSV.generate do |csv|
      csv <<  [ 'Name', 'Address', 'Kyc', 'Account Id','Balance'] #Header Row
      account =  Account.find(fromAccount)
      
      detailArray = []
      if account        
        detailArray << account.customer.name
        detailArray << account.customer.address1
        detailArray << account.customer.KycYN
        detailArray << account.accountId
        detailArray << account.balance.balance
      end
      csv << detailArray
    end   
  end
  
  
end
