class AddBrindosBubbleLastBuyToMillesimeCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :millesime_customers, :brindos_bubble_last_buy, :datetime
  end
end
