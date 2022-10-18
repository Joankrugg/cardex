class RenameColumnBuyDateInSacyBubbleCustomers < ActiveRecord::Migration[6.0]
  def change
    rename_column :sacy_bubble_customers, :buy_date, :sacy_bubble_buy_date
  end
end
