class RenameColumnBuyDateInLeognanBubbleCustomers < ActiveRecord::Migration[6.0]
  def change
    rename_column :leognan_bubble_customers, :buy_date, :leognan_bubble_buy_date
  end
end
