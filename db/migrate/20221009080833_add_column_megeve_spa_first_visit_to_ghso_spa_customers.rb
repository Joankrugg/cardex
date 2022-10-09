class AddColumnMegeveSpaFirstVisitToGhsoSpaCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :ghso_spa_customers, :megeve_spa_first_visit, :datetime
  end
end
