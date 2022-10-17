class AddLeognanBubbleLastBuyToMillesimeCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :millesime_customers, :leognan_bubble_last_buy, :datetime
  end
end
