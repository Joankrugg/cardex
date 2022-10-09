class AddColumnLeognanRestaurantLastVisitToLeognanCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :leognan_customers, :leognan_restaurant_last_visit, :datetime
  end
end
