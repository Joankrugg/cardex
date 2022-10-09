class AddColumnTheouleRestaurantLastVisitToTheouleRestaurantCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :theoule_restaurant_customers, :theoule_restaurant_last_visit, :datetime
  end
end
