class Quotation < ApplicationRecord
  belongs_to :creator, optional: true
end
