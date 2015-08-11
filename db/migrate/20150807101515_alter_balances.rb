class AlterBalances < ActiveRecord::Migration
  def change
    remove_column :balances, :account
    add_column :balances, :accountId, :integer
  end
end
