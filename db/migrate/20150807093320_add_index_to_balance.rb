class AddIndexToBalance < ActiveRecord::Migration
  def change
    add_index(:balances,:account)
  end
end
