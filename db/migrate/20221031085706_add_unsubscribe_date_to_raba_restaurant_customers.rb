class AddUnsubscribeDateToRabaRestaurantCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :raba_restaurant_customers, :unsubscribe_date, :datetime
  end
end
