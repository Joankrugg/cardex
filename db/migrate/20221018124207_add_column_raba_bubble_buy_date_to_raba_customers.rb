class AddColumnRabaBubbleBuyDateToRabaCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :raba_customers, :raba_bubble_buy_date, :datetime
  end
end
