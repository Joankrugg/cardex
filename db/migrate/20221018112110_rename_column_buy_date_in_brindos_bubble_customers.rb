class RenameColumnBuyDateInBrindosBubbleCustomers < ActiveRecord::Migration[6.0]
  def change
    rename_column :brindos_bubble_customers, :buy_date, :brindos_bubble_buy_date
  end
end
