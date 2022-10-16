class AddColumnNewsletterToMegeveRestaurantCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :megeve_restaurant_customers, :newsletter, :string
  end
end
