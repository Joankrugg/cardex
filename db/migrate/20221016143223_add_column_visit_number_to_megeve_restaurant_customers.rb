class AddColumnVisitNumberToMegeveRestaurantCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :megeve_restaurant_customers, :visit_number, :integer
  end
end
