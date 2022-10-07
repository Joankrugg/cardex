class Home < ApplicationRecord
  has_many :customers
  has_many :leognan_pro_customers
  has_many :brindos_pro_customers
  has_many :raba_pro_customers
  has_many :sacy_pro_customers
  has_many :sales_reviews
end
