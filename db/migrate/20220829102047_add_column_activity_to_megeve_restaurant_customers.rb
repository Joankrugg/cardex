class AddColumnActivityToMegeveRestaurantCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :megeve_restaurant_customers, :activity, :string
  end
end
