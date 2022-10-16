class AddColumnNewsletterToBrindosRestaurantCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :brindos_restaurant_customers, :newsletter, :string
  end
end
