class AddSectorReferenceToSalesReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :sales_reviews, :sector, foreign_key: true
  end
end
