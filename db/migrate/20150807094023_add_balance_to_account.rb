class AddBalanceToAccount < ActiveRecord::Migration
  def change
    # Adds the reference of account in balances table
    # NOTE: Singularism and Pluralism
    add_reference :balances, :account, index: true, foreign_key: true 
  end
end
