class AddColumnMegeveRestaurantLastVisitToMegeveCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :megeve_customers, :megeve_restaurant_last_visit, :datetime
  end
end
