class AddSacyBubbleLastBuyToMillesimeCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :millesime_customers, :sacy_bubble_last_buy, :datetime
  end
end
