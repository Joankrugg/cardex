class AddColumnBrindosRestaurantLastVisitToBrindosCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :brindos_customers, :brindos_restaurant_last_visit, :datetime
  end
end
