class AddColumnActivityToBrindosRestaurantCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :brindos_restaurant_customers, :activity, :string
  end
end
