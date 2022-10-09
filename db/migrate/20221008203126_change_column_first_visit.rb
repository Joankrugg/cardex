class ChangeColumnFirstVisit < ActiveRecord::Migration[6.0]
  def change
    rename_column :brindos_restaurant_customers, :first_visit, :first_restaurant_visit
  end
end
