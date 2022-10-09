class AddColumnRabaRestaurantFirstVisitToRabaRestaurantCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :raba_restaurant_customers, :raba_restaurant_first_visit, :datetime
  end
end
