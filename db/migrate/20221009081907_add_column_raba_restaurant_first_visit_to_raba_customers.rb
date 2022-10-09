class AddColumnRabaRestaurantFirstVisitToRabaCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :raba_customers, :raba_restaurant_first_visit, :datetime
  end
end
