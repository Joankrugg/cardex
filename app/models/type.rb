class Type < ApplicationRecord
  has_many :customers
  has_many :brindos_pro_customers
end
