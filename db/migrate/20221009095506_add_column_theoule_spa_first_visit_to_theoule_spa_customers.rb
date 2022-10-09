class AddColumnTheouleSpaFirstVisitToTheouleSpaCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :theoule_spa_customers, :theoule_spa_first_visit, :datetime
  end
end
