class AddTheouleLastVisitToMillesimeCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :millesime_customers, :theoule_last_visit, :datetime
  end
end
