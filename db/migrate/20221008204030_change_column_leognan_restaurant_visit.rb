class ChangeColumnLeognanRestaurantVisit < ActiveRecord::Migration[6.0]
  def change
    rename_column :brindos_restaurant_customers, :leognan_restaurant_visit, :brindos_restaurant_first_visit
  end
end
