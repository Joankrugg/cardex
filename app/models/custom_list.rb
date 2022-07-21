class CustomList < ApplicationRecord
  validates :email, uniqueness: true
end
