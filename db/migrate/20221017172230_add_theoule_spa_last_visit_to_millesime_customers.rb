class AddTheouleSpaLastVisitToMillesimeCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :millesime_customers, :theoule_spa_last_visit, :datetime
  end
end
