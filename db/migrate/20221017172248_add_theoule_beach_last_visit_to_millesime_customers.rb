class AddTheouleBeachLastVisitToMillesimeCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :millesime_customers, :theoule_beach_last_visit, :datetime
  end
end
