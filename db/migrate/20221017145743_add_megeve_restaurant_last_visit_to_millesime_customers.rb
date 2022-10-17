class AddMegeveRestaurantLastVisitToMillesimeCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :millesime_customers, :megeve_restaurant_last_visit, :datetime
  end
end
