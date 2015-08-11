class Customer < ActiveRecord::Base
  has_many :accounts
  
  GENDERS = [ "Male", "Female", "Other" ]
  KYCYN = [true,false]
  
  validates :gender, inclusion: GENDERS
  validates :KycYN, inclusion: KYCYN
  validates :name, :address1, :KycYN, :gender, presence: true
end
