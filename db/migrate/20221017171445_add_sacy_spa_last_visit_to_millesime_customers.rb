class AddSacySpaLastVisitToMillesimeCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :millesime_customers, :sacy_spa_last_visit, :datetime
  end
end
