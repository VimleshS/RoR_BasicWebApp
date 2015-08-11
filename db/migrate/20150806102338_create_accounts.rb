class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :account_type
      t.string :accountId

      t.timestamps null: false
    end
  end
end
