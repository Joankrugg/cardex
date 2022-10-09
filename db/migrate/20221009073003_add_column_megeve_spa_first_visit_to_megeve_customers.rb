class AddColumnMegeveSpaFirstVisitToMegeveCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :megeve_customers, :megeve_spa_first_visit, :datetime
  end
end
