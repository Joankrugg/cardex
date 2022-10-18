class AddColumnSacyBubbleBuyDateToSacyCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :sacy_customers, :sacy_bubble_buy_date, :datetime
  end
end
