class AddLeognanRestaurantLastVisitToMillesimeCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :millesime_customers, :leognan_restaurant_last_visit, :datetime
  end
end
