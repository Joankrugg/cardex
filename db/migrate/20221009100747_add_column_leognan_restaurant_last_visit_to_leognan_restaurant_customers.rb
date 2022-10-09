class AddColumnLeognanRestaurantLastVisitToLeognanRestaurantCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :leognan_restaurant_customers, :leognan_restaurant_last_visit, :datetime
  end
end
