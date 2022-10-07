class SalesReview < ApplicationRecord
  belongs_to :sector, optional: true
  belongs_to :creator, optional: true
  belongs_to :type, optional: true
  belongs_to :home, optional: true
end
