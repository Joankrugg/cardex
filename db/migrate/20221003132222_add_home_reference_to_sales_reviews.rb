class AddHomeReferenceToSalesReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :sales_reviews, :home, foreign_key: true
  end
end
