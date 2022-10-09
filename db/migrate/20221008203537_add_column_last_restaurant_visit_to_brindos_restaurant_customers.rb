class AddColumnLastRestaurantVisitToBrindosRestaurantCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :brindos_restaurant_customers, :leognan_restaurant_visit, :datetime
  end
end
