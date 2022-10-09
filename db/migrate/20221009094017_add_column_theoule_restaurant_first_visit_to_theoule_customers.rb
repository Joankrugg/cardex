class AddColumnTheouleRestaurantFirstVisitToTheouleCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :theoule_customers, :theoule_restaurant_first_visit, :datetime
  end
end
