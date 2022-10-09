class AddColumnMegeveSpaLastVisitToMegeveCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :megeve_customers, :megeve_spa_last_visit, :datetime
  end
end
