class AddColumnTheouleSpaLastVisitToTheouleSpaCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :theoule_spa_customers, :theoule_spa_last_visit, :datetime
  end
end
