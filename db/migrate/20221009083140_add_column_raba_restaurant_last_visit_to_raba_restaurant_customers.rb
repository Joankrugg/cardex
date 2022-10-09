class AddColumnRabaRestaurantLastVisitToRabaRestaurantCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :raba_restaurant_customers, :raba_restaurant_last_visit, :datetime
  end
end
