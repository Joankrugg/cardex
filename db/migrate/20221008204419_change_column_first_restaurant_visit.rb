class ChangeColumnFirstRestaurantVisit < ActiveRecord::Migration[6.0]
  def change
     rename_column :brindos_restaurant_customers, :first_restaurant_visit, :brindos_restaurant_last_visit
  end
end
