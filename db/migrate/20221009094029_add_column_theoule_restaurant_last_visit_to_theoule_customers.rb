class AddColumnTheouleRestaurantLastVisitToTheouleCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :theoule_customers, :theoule_restaurant_last_visit, :datetime
  end
end
