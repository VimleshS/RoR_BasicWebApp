class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :FromAccount
      t.integer :ToAccount
      t.float :Amount
      t.string :DrCr
      t.string :Narration

      t.timestamps null: false
    end
  end
end
