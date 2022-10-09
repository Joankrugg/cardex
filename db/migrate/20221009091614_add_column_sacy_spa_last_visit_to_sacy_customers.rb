class AddColumnSacySpaLastVisitToSacyCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :sacy_customers, :sacy_spa_last_visit, :datetime
  end
end
