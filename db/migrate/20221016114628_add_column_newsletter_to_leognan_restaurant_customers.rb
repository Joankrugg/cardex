class AddColumnNewsletterToLeognanRestaurantCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :leognan_restaurant_customers, :newsletter, :string
  end
end
