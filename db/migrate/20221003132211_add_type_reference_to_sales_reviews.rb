class AddTypeReferenceToSalesReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :sales_reviews, :type, foreign_key: true
  end
end
