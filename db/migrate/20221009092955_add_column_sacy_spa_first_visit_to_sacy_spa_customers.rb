class AddColumnSacySpaFirstVisitToSacySpaCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :sacy_spa_customers, :sacy_spa_first_visit, :datetime
  end
end
