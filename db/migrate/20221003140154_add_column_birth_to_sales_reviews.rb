class AddColumnBirthToSalesReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :sales_reviews, :birth, :datetime
  end
end
