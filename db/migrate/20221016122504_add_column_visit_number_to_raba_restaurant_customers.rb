class AddColumnVisitNumberToRabaRestaurantCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :raba_restaurant_customers, :visit_number, :integer
  end
end
