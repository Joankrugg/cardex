class AddColumnLanguageToTheouleRestaurantCustomer < ActiveRecord::Migration[6.0]
  def change
    add_column :theoule_restaurant_customers, :language, :string
  end
end
