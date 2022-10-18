class AddColumnLeognanBubbleBuyDateToLeognanCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :leognan_customers, :leognan_bubble_buy_date, :datetime
  end
end
