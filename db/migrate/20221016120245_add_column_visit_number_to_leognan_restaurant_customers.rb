class AddColumnVisitNumberToLeognanRestaurantCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :leognan_restaurant_customers, :visit_number, :integer
  end
end
