class AddColumnVisitNumberToBrindosRestaurantCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :brindos_restaurant_customers, :visit_number, :integer
  end
end
