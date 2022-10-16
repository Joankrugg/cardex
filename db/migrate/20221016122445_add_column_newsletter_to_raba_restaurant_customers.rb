class AddColumnNewsletterToRabaRestaurantCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :raba_restaurant_customers, :newsletter, :string
  end
end
