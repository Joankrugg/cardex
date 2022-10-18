class AddMillesimeBubbleLastBuyToMillesimeCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :millesime_customers, :millesime_bubble_last_buy, :datetime
  end
end
