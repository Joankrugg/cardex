class RenameColumnBuyDateInMegeveBubbleCustomers < ActiveRecord::Migration[6.0]
  def change
    rename_column :megeve_bubble_customers, :buy_date, :megeve_bubble_buy_date
  end
end
