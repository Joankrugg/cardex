class AddColumnSacyRestaurantFirstVisitToSacyCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :sacy_customers, :sacy_restaurant_first_visit, :datetime
  end
end
