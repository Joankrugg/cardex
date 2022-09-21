class AddColumnFirstVisitToBrindosRestaurantCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :brindos_restaurant_customers, :first_visit, :datetime
  end
end
