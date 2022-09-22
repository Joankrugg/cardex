class Creator < ApplicationRecord
  has_many :customers
  has_many :brindos_pro_customers
  has_many :leognan_pro_customers
end
