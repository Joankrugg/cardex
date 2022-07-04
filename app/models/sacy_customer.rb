class SacyCustomer < ApplicationRecord
  validates :email, format: { with:  /\A[^@\s]+@[^@\s]+\z/}, presence: true
  validates :email, uniqueness: true
end
