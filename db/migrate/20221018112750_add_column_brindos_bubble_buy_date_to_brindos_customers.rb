class AddColumnBrindosBubbleBuyDateToBrindosCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :brindos_customers, :brindos_bubble_buy_date, :datetime
  end
end
