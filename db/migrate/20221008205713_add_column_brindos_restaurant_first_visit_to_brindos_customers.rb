class AddColumnBrindosRestaurantFirstVisitToBrindosCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :brindos_customers, :brindos_restaurant_first_visit, :datetime
  end
end
