class AddCreatorReferenceToSalesReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :sales_reviews, :creator, foreign_key: true
  end
end
