class AddColumnSacySpaLastVisitToSacySpaCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :sacy_spa_customers, :sacy_spa_last_visit, :datetime
  end
end
