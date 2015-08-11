class CreateBalances < ActiveRecord::Migration
  def change
    create_table :balances do |t|
      t.integer :account
      t.float :balance

      t.timestamps null: false
    end
  end
end
