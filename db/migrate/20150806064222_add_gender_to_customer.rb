class AddGenderToCustomer < ActiveRecord::Migration
  def up
    add_column(:customers, :gender,:string)
  end
  def down
     remove_column(:customers, :gender)
  end
end
