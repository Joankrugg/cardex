class AddPortoRestaurantLastVisitToMillesimeCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :millesime_customers, :porto_restaurant_last_visit, :datetime
  end
end
