class AddAccountToCustomer < ActiveRecord::Migration
  def change
    # Adds the reference of customer in accounts table
    # NOTE: Singularism and Pluralism
    add_reference :accounts, :customer, index: true, foreign_key: true 
  end
end
