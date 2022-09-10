class AddColumnActivityToSacyRestaurantCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :sacy_restaurant_customers, :activity, :string
  end
end
