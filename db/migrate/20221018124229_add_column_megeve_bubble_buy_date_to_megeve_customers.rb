class AddColumnMegeveBubbleBuyDateToMegeveCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :megeve_customers, :megeve_bubble_buy_date, :datetime
  end
end
