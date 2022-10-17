class AddSacyRestaurantLastVisitToMillesimeCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :millesime_customers, :sacy_restaurant_last_visit, :datetime
  end
end
