class AddColumnActivityToRabaRestaurantCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :raba_restaurant_customers, :activity, :string
  end
end
