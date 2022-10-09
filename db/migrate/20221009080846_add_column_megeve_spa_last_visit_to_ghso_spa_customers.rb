class AddColumnMegeveSpaLastVisitToGhsoSpaCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :ghso_spa_customers, :megeve_spa_last_visit, :datetime
  end
end
