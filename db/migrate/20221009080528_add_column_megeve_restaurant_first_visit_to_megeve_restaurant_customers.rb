class AddColumnMegeveRestaurantFirstVisitToMegeveRestaurantCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :megeve_restaurant_customers, :megeve_restaurant_first_visit, :datetime
  end
end
