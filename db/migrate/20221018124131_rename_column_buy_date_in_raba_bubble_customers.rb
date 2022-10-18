class RenameColumnBuyDateInRabaBubbleCustomers < ActiveRecord::Migration[6.0]
  def change
    rename_column :raba_bubble_customers, :buy_date, :raba_bubble_buy_date
  end
end
