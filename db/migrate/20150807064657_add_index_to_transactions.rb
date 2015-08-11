class AddIndexToTransactions < ActiveRecord::Migration
  def change
    add_index(:transactions, :ToAccount)
  end
end
