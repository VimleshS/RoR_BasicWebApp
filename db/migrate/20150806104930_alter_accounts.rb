class AlterAccounts < ActiveRecord::Migration
  def up
      change_column("accounts", "accountId",:integer, :limit => 25 )
  end
  
  def down
      change_column("accounts", "accountId",:string, :limit => 25 )
  end
  
end
